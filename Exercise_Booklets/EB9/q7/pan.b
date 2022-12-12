	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Q */

	case 3: // STATE 1
		;
		now.nq = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 5: // STATE 7
		;
		now.nq = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC P */

	case 7: // STATE 1
		;
		now.np = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: // STATE 7
		;
		now.np = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;
	}

