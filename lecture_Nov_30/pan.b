	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		
	case 7: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC R */
;
		;
		
	case 9: // STATE 2
		;
		now.x = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Q */
;
		;
		
	case 12: // STATE 2
		;
		now.x = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC P */
;
		;
		
	case 15: // STATE 2
		;
		now.x = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;
	}

