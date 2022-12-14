#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC Feline */
	case 3: // STATE 1 - dekker (1).pml:8 - [((mutex>0))] (8:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.mutex)>0)))
			continue;
		/* merge: mutex = (mutex-1)(0, 2, 8) */
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)-1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 5 - dekker (1).pml:8 - [((mutexFelines>0))] (9:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((int)now.mutexFelines)>0)))
			continue;
		/* merge: mutexFelines = (mutexFelines-1)(0, 6, 9) */
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexFelines);
		now.mutexFelines = (((int)now.mutexFelines)-1);
#ifdef VAR_RANGES
		logval("mutexFelines", ((int)now.mutexFelines));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 5: // STATE 9 - dekker (1).pml:38 - [assert((mice==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		spin_assert((((int)now.mice)==0), "(mice==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 10 - dekker (1).pml:39 - [felines = (felines+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((int)now.felines);
		now.felines = (((int)now.felines)+1);
#ifdef VAR_RANGES
		logval("felines", ((int)now.felines));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 11 - dekker (1).pml:41 - [((felines==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!((((int)now.felines)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 12 - dekker (1).pml:8 - [((mutexMice>0))] (21:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!((((int)now.mutexMice)>0)))
			continue;
		/* merge: mutexMice = (mutexMice-1)(0, 13, 21) */
		reached[1][13] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexMice);
		now.mutexMice = (((int)now.mutexMice)-1);
#ifdef VAR_RANGES
		logval("mutexMice", ((int)now.mutexMice));
#endif
		;
		/* merge: .(goto)(0, 19, 21) */
		reached[1][19] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 20 - dekker (1).pml:13 - [mutexFelines = (mutexFelines+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexFelines);
		now.mutexFelines = (((int)now.mutexFelines)+1);
#ifdef VAR_RANGES
		logval("mutexFelines", ((int)now.mutexFelines));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 22 - dekker (1).pml:13 - [mutex = (mutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 24 - dekker (1).pml:8 - [((mutexFelines>0))] (28:0:1 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		if (!((((int)now.mutexFelines)>0)))
			continue;
		/* merge: mutexFelines = (mutexFelines-1)(0, 25, 28) */
		reached[1][25] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexFelines);
		now.mutexFelines = (((int)now.mutexFelines)-1);
#ifdef VAR_RANGES
		logval("mutexFelines", ((int)now.mutexFelines));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 28 - dekker (1).pml:48 - [felines = (felines-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][28] = 1;
		(trpt+1)->bup.oval = ((int)now.felines);
		now.felines = (((int)now.felines)-1);
#ifdef VAR_RANGES
		logval("felines", ((int)now.felines));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 29 - dekker (1).pml:50 - [((felines==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][29] = 1;
		if (!((((int)now.felines)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 30 - dekker (1).pml:13 - [mutexMice = (mutexMice+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][30] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexMice);
		now.mutexMice = (((int)now.mutexMice)+1);
#ifdef VAR_RANGES
		logval("mutexMice", ((int)now.mutexMice));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 36 - dekker (1).pml:13 - [mutexFelines = (mutexFelines+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][36] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexFelines);
		now.mutexFelines = (((int)now.mutexFelines)+1);
#ifdef VAR_RANGES
		logval("mutexFelines", ((int)now.mutexFelines));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 38 - dekker (1).pml:54 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][38] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Mouse */
	case 17: // STATE 1 - dekker (1).pml:8 - [((mutex>0))] (8:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.mutex)>0)))
			continue;
		/* merge: mutex = (mutex-1)(0, 2, 8) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)-1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 5 - dekker (1).pml:8 - [((mutexMice>0))] (9:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)now.mutexMice)>0)))
			continue;
		/* merge: mutexMice = (mutexMice-1)(0, 6, 9) */
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexMice);
		now.mutexMice = (((int)now.mutexMice)-1);
#ifdef VAR_RANGES
		logval("mutexMice", ((int)now.mutexMice));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 19: // STATE 9 - dekker (1).pml:18 - [assert((felines==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		spin_assert((((int)now.felines)==0), "(felines==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 10 - dekker (1).pml:19 - [mice = (mice+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)now.mice);
		now.mice = (((int)now.mice)+1);
#ifdef VAR_RANGES
		logval("mice", ((int)now.mice));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 11 - dekker (1).pml:21 - [((mice==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((int)now.mice)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 12 - dekker (1).pml:8 - [((mutexFelines>0))] (21:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!((((int)now.mutexFelines)>0)))
			continue;
		/* merge: mutexFelines = (mutexFelines-1)(0, 13, 21) */
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexFelines);
		now.mutexFelines = (((int)now.mutexFelines)-1);
#ifdef VAR_RANGES
		logval("mutexFelines", ((int)now.mutexFelines));
#endif
		;
		/* merge: .(goto)(0, 19, 21) */
		reached[0][19] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 20 - dekker (1).pml:13 - [mutexMice = (mutexMice+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexMice);
		now.mutexMice = (((int)now.mutexMice)+1);
#ifdef VAR_RANGES
		logval("mutexMice", ((int)now.mutexMice));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 22 - dekker (1).pml:13 - [mutex = (mutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 24 - dekker (1).pml:8 - [((mutexMice>0))] (28:0:1 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		if (!((((int)now.mutexMice)>0)))
			continue;
		/* merge: mutexMice = (mutexMice-1)(0, 25, 28) */
		reached[0][25] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexMice);
		now.mutexMice = (((int)now.mutexMice)-1);
#ifdef VAR_RANGES
		logval("mutexMice", ((int)now.mutexMice));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 28 - dekker (1).pml:28 - [mice = (mice-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.oval = ((int)now.mice);
		now.mice = (((int)now.mice)-1);
#ifdef VAR_RANGES
		logval("mice", ((int)now.mice));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 29 - dekker (1).pml:30 - [((mice==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		if (!((((int)now.mice)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 30 - dekker (1).pml:13 - [mutexFelines = (mutexFelines+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexFelines);
		now.mutexFelines = (((int)now.mutexFelines)+1);
#ifdef VAR_RANGES
		logval("mutexFelines", ((int)now.mutexFelines));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 36 - dekker (1).pml:13 - [mutexMice = (mutexMice+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = ((int)now.mutexMice);
		now.mutexMice = (((int)now.mutexMice)+1);
#ifdef VAR_RANGES
		logval("mutexMice", ((int)now.mutexMice));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 38 - dekker (1).pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

