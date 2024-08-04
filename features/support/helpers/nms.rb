module Helpers
	module XMLBuilder
		class NewMatterStartsXML
			def initialize(sr, pa, ap, col, nms)
				#@sr, @pa, @ap, @col, @nms = *argList
				@sr = sr
				@pa = pa
				@ap = ap
				@col = col
				@nms = nms
			end
			#SCHEDULE_REF tag
			def sr_tag
					"<matterStart code=\"SCHEDULE_REF\">#{@sr}</matterStart>"
			end
			#PROCUREMENT_AREA tag
			def pa_tag
					"<matterStart code=\"PROCUREMENT_AREA\">#{@pa}</matterStart>"
			end
			#ACCESS_POINT tag
			def ap_tag
					"<matterStart code=\"ACCESS_POINT\">#{@ap}</matterStart>"
			end
			#CATEGORY_OF_LAW/NMS tag
			def col_tag
					"<matterStart code=\"#{@col}\">#{@nms}</matterStart>"
			end
			#newMatterStarts Section
			def section_tag
					"<newMatterStarts>#{sr_tag}#{pa_tag}#{ap_tag}#{col_tag}</newMatterStarts>"
			end
		end
	end
end