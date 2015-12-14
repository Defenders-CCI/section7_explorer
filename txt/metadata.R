the_metadata <- '{
"activity_code": "The TAILS consultation identifier, which can be used to request specific consultations from FWS.",

"region": "FWS region in which the consultation occurred.",

"state": "An approximation of the state in which the action occurred. This is based on the coverage of Ecological Services offices, and may not be known for consultations conducted in offices that span state boundaries.",

"ESOffice": "The name of the FWS Ecological Services office that completed the consultation.",

"title": "The approximate title of the proposed action.",

"lead_agency": "The agency recorded by FWS as leading the action. Note this may not be the same as action agency as discussed in legislation and the section 7 handbook, but may include state agencies, consultants, or other private entities.",

"FY": "The fiscal year in which the consultation was recorded.",

"FY_start": "The fiscal year at consultation initiation.",

"FY_concl": "The fiscal year at consultation conclusion.",

"start_date": "The date of consultation initiation as recorded by FWS.",

"date_formal_consult": "The date of initiation for formal consultation.",

"due_date": "The date on which the consultation is due. For formal consultations this may be 90 days after the initiation date, 135 days (to allow 45 days for writing the response), or longer if FWS and the action agency mutually agree to extensions.",

"FWS_concl_date": "The date on which FWS concluded consultation.",

"elapsed": "Consultation duration, in days. Calculated as the conclusion date minus the start date for informal consultations, or conclusion date minus date_formal_consult for formal consultations.",

"date_active_concluded": "A second conclusion date that may or may not have been recorded for consultations. Use FWS_concl_date unless there is a good reason to use this variable.",

"timely_concl": "FWS record of whether consultations were concluded in a timely fashion. A formal consultation that extended beyond the 135-day deadline may still be timely if both FWS and the action agency agreed to extensions.",

"hours_logged": "FWS record as to whether the consulting biologist(s) recorded the time they spent on the consultation. Also asking FWS if more info available...",

"events_logged": "Asking FWS",

"formal_consult": "Whether the consultation was formal. This can be cross-checked with the letter in the middle of the activity_code (####-F-#### is formal, ####-I-#### is informal).",

"consult_type": "Type of consultation; one of the four combinations of informal/formal and standard/emergency.",

"consult_complex": "Consultation complexity; one of Standard, Batched, Programmatic Program-level, or Programmatic Project-level.",

"work_type": "One of 449 classifications for the action as recorded by FWS. Some types are more detailed than others, and may be nested.",

"work_category": "One of 92 categories for the action. This variable is the highest-level category (first listed, before any  -  separator) from the work_type field. Some work categories are very broad and a given consultation may have more detailed information in work_type.",

"ARRA": "Whether the action or FWS consultation was funded by American Recovery and Reinvestment Act.",

"datum": "The geodetic datum in which any action coordinates were recorded.",

"lat_dec_deg": "Action latitude in decimal-degrees.",

"long_dec_deg": "Action longitude in decimal-degrees.",

"lat_deg": "Degrees value for action latitude.",

"lat_min": "Minutes value for action latitude.",

"lat_sec": "Seconds value for action latitude.",

"long_deg": "Degrees value for action longitude.",

"long_min": "Minutes value for action longitude.",

"long_sec": "Seconds value for action longitude.",

"UTM_E": "Universal Transverse Mercator easting coordinate for action.",

"UTM_N": "Universal Transverse Mercator northing coordinate for action.",

"UTM_zone": "Universal Transverse Mercator zone for action.",

"spp_ev_ls": "The list of the species evaluated in the consultation. Species names were homogenized against a single, standardized list derived (mostly) from the 2013 FWS expenditures report to Congress.",

"spp_BO_ls": "The list of the species analyzed in the Biological Opinion for a formal consultation, as recorded by FWS. Species names were set to lower-case to facilitate certain pattern-matching; see the spp_ev_ls for the standard name of a species in spp_BO_ls.",

"n_spp_eval": "The number of species evaluated in the consultation.",

"n_spp_BO": "The number of species analyzed in the Biological Opinion of a formal consultation.",

"n_nofx": "Number of No Effect determinations for the action.",

"n_NLAA": "Number of Not Likely to Adversely Affect determinations for the action.",

"n_conc": "Number of Concurrence determinations for the action.",

"n_jeopardy": "Number of Jeopardy determinations for the action.",

"n_rpa": "Number of jeopardy/adverse modification determinations with reasonable and prudent alternatives for the action.",

"n_admo": "Number of Adverse Modification determinations for the action.",

"n_tech": "Number of Technical Assistance determinations for the action.",

"staff_lead_hash": "An MD5 hash of the names of the lead FWS biologist for the consultation. Each unique hash maps to a single person so that individual-level effects can be analyzed, but the identity of the biologists is protected.",

"staff_support_hash": "An MD5 hash of the names of the supporting FWS biologist for the consultation, if any. Each unique hash maps to a single person so that individual-level effects can be analyzed, but the identity of the biologists is protected."
}'
