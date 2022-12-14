	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		((P2 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 5: // STATE 3
		;
		now.permToProcess[ Index(((P2 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 4
		;
		now.doneProcessing[ Index(((P2 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 5
		;
		((P2 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 11
		;
		((P2 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 13
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 14
		;
		((P2 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 20
		;
		((P2 *)_this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 22
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 15: // STATE 23
		;
		((P2 *)_this)->i = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 30
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Machine */

	case 17: // STATE 2
		;
		now.permToProcess[ Index(((P1 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 5
		;
		now.doneProcessing[ Index(((P1 *)_this)->i, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Car */

	case 20: // STATE 2
		;
		now.station0 = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 5
		;
		now.c0 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 23: // STATE 7
		;
		now.c0 = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 8
		;
		now.permToProcess[0] = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 11
		;
		now.doneProcessing[0] = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 15
		;
		now.station1 = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 18
		;
		now.c1 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 29: // STATE 20
		;
		now.c1 = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 21
		;
		now.station0 = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 23
		;
		now.permToProcess[1] = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 26
		;
		now.doneProcessing[1] = trpt->bup.oval;
		;
		goto R999;

	case 33: // STATE 30
		;
		now.station2 = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 33
		;
		now.c2 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 36: // STATE 35
		;
		now.c2 = trpt->bup.oval;
		;
		goto R999;

	case 37: // STATE 36
		;
		now.station1 = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 38
		;
		now.permToProcess[2] = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 41
		;
		now.doneProcessing[2] = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 44
		;
		now.station2 = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 46
		;
		p_restor(II);
		;
		;
		goto R999;
	}

