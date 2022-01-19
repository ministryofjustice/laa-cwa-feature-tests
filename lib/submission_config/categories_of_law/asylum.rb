module SubmissionConfig
  module CategoriesOfLaw
    class Asylum < Base

      define_matter_type1_codes({
        IAXL: 'Asylum - LH Work Not Subject to the Standard Fee Scheme',
        IAXC: 'Asylum - CLR Work Not Subject to the Standard Fee Scheme',

        IALB: 'Asylum - Stage 1 (LH)',
        IACA: 'Asylum - Stage 2a (CLR)',
        IACB: 'Asylum - Stage 2b (CLR)',
        IACC: 'Asylum - Stage 2c (CLR)',

        IACD: 'Asylum – Interim CLR rates (hourly rates with fixed fee for advocacy services)',
      })

      define_matter_type2_codes({
        IASY: 'No description',
        ILEA: 'No description',
        IDOM: 'No description',
        IBAI: 'No description',
        ICOA: 'No description',
        IDAS: 'No description',
        IFRA: 'No description',
        IFST: 'No description',
        IIRC: 'No description',
        IJRA: 'No description',
        IMER: 'No description',
        IOTH: 'No description',
        IOUT: 'No description',
        IPAS: 'No description',
        IPST: 'No description',
        IRAR: 'No description',
        IRVL: 'No description',
        IUAS: 'No description',
        IREM: 'No description',
        ICZN: 'No description',
        IEMP: 'No description',
        IEUL: 'No description',
        IFFL: 'No description',
        IFME: 'No description',
        IFVI: 'No description',
        IGOL: 'No description',
        IILL: 'No description',
        INAS: 'No description',
        ISTU: 'No description',
        ITWE: 'No description',
      })

      MATTER_TYPE2_CODES_COMMON = %i[IASY ILEA IFRA IFST IIRC IOTH IOUT IRVL IGOL]
      private_constant :MATTER_TYPE2_CODES_COMMON

      define_matter_type_code_combinations({
        IAXL: MATTER_TYPE2_CODES_COMMON + %i[IBAI ICOA IDAS IJRA IMER IPAS IUAS IFFL],
        IAXC: MATTER_TYPE2_CODES_COMMON + %i[IBAI IRAR IUAS IREM],

        IALB: MATTER_TYPE2_CODES_COMMON,
        IACA: MATTER_TYPE2_CODES_COMMON,
        IACB: MATTER_TYPE2_CODES_COMMON,
        IACC: MATTER_TYPE2_CODES_COMMON,

        IACD: MATTER_TYPE2_CODES_COMMON,
      })

      define_standard_fees({
        IALB: 413,
        IACA: 227,
        IACB: 567,
        IACC: 627,
      })

      define_additional_payments({
        # ho_interview: 'HO Interview',
        cmrh_oral: 'CMRH Oral',
        cmrh_telephone: 'CMRH Telephone',
        substantive_hearing: 'Substantive Hearing',
        adjourned_hearing_fee: 'Adjourned Hearing Fee',
      })

      define_additional_payment_fees({
        # ho_interview: 0, # Can't get it priced with IACC, should have been: 266, but I got it added with IALB:ILEA!
        cmrh_oral: 166,
        cmrh_telephone: 90,
        substantive_hearing: 302,
        adjourned_hearing_fee: 161,
      })

      # define_additional_payment_quantities({
      #   ho_interview: Constants::ZERO_TO_NINE,
      #   cmrh_oral: Constants::ZERO_TO_NINE,
      #   cmrh_telephone: Constants::ZERO_TO_NINE,
      #   substantive_hearing: Constants::YES_OR_NO,
      #   adjourned_hearing_fee: Constants::ZERO_TO_NINE,
      # })

      # TODO: look for query that hardcodes MTs when retrieving values for the dropdowns
      # define_additional_payment_combinations({
      #   IAXL: %i[ho_interview],
      #   IAXC: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

      #   IALB: %i[ho_interview],
      #   IACA: %i[cmrh_oral cmrh_telephone],
      #   IACB: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
      #   IACC: %i[ho_interview cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

      #   IACD: %i[ho_interview cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
      # })

      define_additional_payment_combinations({
        IAXL: %i[],
        IAXC: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

        IALB: %i[],
        IACA: %i[cmrh_oral cmrh_telephone],
        IACB: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
        IACC: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

        IACD: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
      })

      define_escape_fee_threshold_formula 'standard_fee * 3 + 1.00'
    end
  end
end
