(require 'org-tempo)
(tempo-define-template "org-drill-1"
		       '("* Item :drill:\n<QUESTION>\n\n** Answer\n<ANSWER>")
		       "<1"
		       "Template for and org drill's simple topic")
(tempo-define-template "org-drill-2"
		       '("* Item :drill:\n:PROPERTIES:\n:DRILL_CARD_TYPE: twosided\n:END:\n\n<QUESTION>\n\n** Side A\n\n** Side B\n")
		       "<2"
		       "Template for an org drills' 2 sided card")
(tempo-define-template "org-drill-3"
		       '("* Item :drill:\n:PROPERTIES:\n:DRILL_CARD_TYPE: hide1cloze\n:END:\n\n<QUESTION>\n")
		       "<3"
		       "Template for an org drills' hide1cloze card")
(tempo-define-template "org-drill-4"
		       '("* Item :drill:\n")
		       "<4"
		       "Simples org dril template")
