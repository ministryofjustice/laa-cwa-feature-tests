class AddOutcomePage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/SubmissionPG*'

  attr_accessor :builder

  def initialize(builder = nil)
    super()
    @builder = builder

    builder
      .fields_with_label
      .each(&method(:add_field)) if builder
  end

  element :save_button, :xpath, '//*[@id="Apply_uixr"]'
  element :errors, :xpath, '//*[@id="FwkErrorBeanId"]'

  PRIMARY_FIELDS = %i[matter_type crime_matter_type claim_type]
  private_constant :PRIMARY_FIELDS

  def add_outcome
    raise StandardError, "Cannot invoke method without defining 'builder' first" unless builder

    values = builder.values

    PRIMARY_FIELDS.each do |field|
      next unless values[field]
      fill_in(field, values[field])
      values.delete(field)
    end

    values.each(&method(:fill_in))
    page.execute_script "window.scrollBy(0,10000)"
    save_button.click
  end

  private

  def fill_in(field, value)
    return if value.to_s.empty?

    if !respond_to?(field)
      raise NotImplementedError, "Element '#{field}' is not defined on the page"
    end

    unless public_send("wait_until_#{field}_visible", { wait: 5 })
      raise SitePrism::ElementVisibilityTimeoutError, "Element '#{field} is not visible"
    end

    element = public_send(field)

    unless PRIMARY_FIELDS.include?(field)
      element.execute_script(remove_attribute_js('onchange'))
    end

    case element.tag_name
    when 'input'
      element.execute_script(remove_attribute_js('disabled'))
      element.set(value)
    when 'select'
      unless element.has_content?(value, wait: 0)
        element.execute_script(add_option_js(value))
      end
      element.select(value)
    end

    element.send_keys(:tab) if PRIMARY_FIELDS.include?(field)
  end

  def add_field(name, labels)
    return if self.class.method_defined?(name)

    self.class.public_send(:element, name.to_sym, :xpath, self.class.build_xpath(labels))
  end

  def remove_attribute_js(value)
    "el=document.getElementById(this.id),el.hasAttribute('#{value}')&&el.removeAttribute('#{value}');"
  end

  def add_option_js(value)
    "this.add(new Option('#{value}', '#{value}'))"
  end

  def self.build_xpath(labels)
    xpath = labels.reduce('') do |memo, label|
      base = "//span[contains(text(), \"#{label}\")]/ancestor::td[1]/following-sibling::td[2]"
      memo += '|' unless memo.empty?
      memo += "#{base}/input|#{base}/select|#{base}/span/input"
    end
    "(#{xpath})[1]"
  end
end
