	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Feline */

	case 3: // STATE 2
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 6
		;
		now.mutexFelines = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 6: // STATE 10
		;
		now.felines = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 8: // STATE 13
		;
		now.mutexMice = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 20
		;
		now.mutexFelines = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 22
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 25
		;
		now.mutexFelines = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 28
		;
		now.felines = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 30
		;
		now.mutexMice = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 36
		;
		now.mutexFelines = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 38
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Mouse */

	case 17: // STATE 2
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 6
		;
		now.mutexMice = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 20: // STATE 10
		;
		now.mice = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: // STATE 13
		;
		now.mutexFelines = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 20
		;
		now.mutexMice = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 22
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 25
		;
		now.mutexMice = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 28
		;
		now.mice = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 28: // STATE 30
		;
		now.mutexFelines = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 36
		;
		now.mutexMice = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 38
		;
		p_restor(II);
		;
		;
		goto R999;
	}

