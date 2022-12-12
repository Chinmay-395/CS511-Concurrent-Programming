	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Patriots */

	case 3: // STATE 2
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 5
		;
		now.criticalPats = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 7
		;
		now.ticket = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 10
		;
		now.criticalJets = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 12
		;
		now.ticket = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 15
		;
		now.criticalJets = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 17
		;
		now.criticalPats = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 18
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Jets */

	case 13: // STATE 1
		;
		now.criticalJets = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 2
		;
		now.ticket = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;
	}

