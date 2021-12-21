module SubmissionConfig
  module CategoriesOfLaw
    module ImmigrationAndAsylum
      class Immigration < Base

        define_matter_type1_codes({
          IMXL: 'Immigration - LH Work Not Subject to the Standard Fee Scheme',
          IMXC: 'Immigration - CLR Work Not Subject to the Standard Fee Scheme',

          IMLB: 'Immigration - Stage 1 (LH)',
          IMCA: 'Immigration - Stage 2a (CLR)',
          IMCB: 'Immigration - Stage 2b (CLR)',
          IMCC: 'Immigration - Stage 2c (CLR)',

          IMCD: 'Immigration – Interim CLR rates (hourly rates with fixed fee for advocacy services)',
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
          ITWE: 'No description'
        })

        define_matter_type_code_combinations({
          IMXL: %i[
            IBAI
            ICOA
            IIRC
            IJRA
            IMER
            IOTH
            IOUT
            IPST
            IRVL
            ICZN
            IFFL
          ],
          IMXC: %i[
            IBAI
            IIRC
            IOTH
            IOUT
            IRAR
            IRVL
            IREM
          ],

          IMLB: %i[
            IDOM
            IIRC
            IOTH
            IOUT
            IRVL
            ICZN
            IEMP
            IEUL
            IFME
            IFVI
            IGOL
            IILL
            ISTU
            ITWE
          ],
          IMCA: %i[
            IDOM
            IIRC
            IOTH
            IOUT
            IRVL
            ICZN
            IEMP
            IEUL
            IFME
            IFVI
            IGOL
            IILL
            ISTU
            ITWE
          ],
          IMCB: %i[
            IDOM
            IIRC
            IOTH
            IOUT
            IRVL
            IEMP
            IEUL
            IFME
            IFVI
            IILL
            ISTU
            ITWE
          ], # TODO: IGOL doesn't seem to trigger escape fee flag properly, add back
          IMCC: %i[
            IDOM
            IIRC
            IOTH
            IOUT
            IRVL
            ICZN
            IEMP
            IEUL
            IFME
            IFVI
            IGOL
            IILL
            ISTU
            ITWE
          ],

          IMCD: %i[
            IDOM
            IIRC
            IOTH
            IOUT
            IRVL
            ICZN
            IEMP
            IEUL
            IFME
            IFVI
            IGOL
            IILL
            ISTU
            ITWE
          ],
        })

        define_standard_fees({
          IMLB: 234,
          IMCA: 227,
          IMCB: 454,
          IMCC: 527,
        })

        define_additional_payments({
          # ho_interview: 'HO Interview',
          cmrh_oral: 'CMRH Oral',
          cmrh_telephone: 'CMRH Telephone',
          substantive_hearing: 'Substantive Hearing',
          adjourned_hearing_fee: 'Adjourned Hearing Fee',
        })

        define_additional_payment_fees({
          # ho_interview: 266,
          cmrh_oral: 166,
          cmrh_telephone: 90,
          substantive_hearing: 302,
          adjourned_hearing_fee: 161,
        })

        # define_additional_payment_combinations({
        #   IMXL: %i[ho_interview],
        #   IMXC: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

        #   IMLB: %i[ho_interview],
        #   IMCA: %i[cmrh_oral cmrh_telephone],
        #   IMCB: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
        #   IMCC: %i[ho_interview cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

        #   IMCD: %i[ho_interview cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
        # })

        define_additional_payment_combinations({
          IMXL: %i[],
          IMXC: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

          IMLB: %i[],
          IMCA: %i[cmrh_oral cmrh_telephone],
          IMCB: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
          IMCC: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],

          IMCD: %i[cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
        })

        # define_claim_types({
        #   stage_claim: 'Stage Claim',
        #   stage_disbursement_claim: 'Stage Disbursement Claim',
        #   completed_matter_claim: 'Completed Matter Claim',
        # })

        # define_claim_types_additional_payments({
        #   stage_claim: %i[ho_interview cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
        #   stage_disbursement_claim: %i[ho_interview],
        #   completed_matter_claim: %i[ho_interview cmrh_oral cmrh_telephone substantive_hearing adjourned_hearing_fee],
        # })
      end
    end
  end
end
