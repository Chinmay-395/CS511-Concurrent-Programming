	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Patriots */

	case 3: // STATE 1
		;
		now.nPats = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 2
		;
		now.ticket = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Jets */

	case 7: // STATE 2
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 6
		;
		now.ticket = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 10
		;
		now.ticket = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 13
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 15
		;
		now.nJets = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 14: // STATE 18
		;
		p_restor(II);
		;
		;
		goto R999;
	}

