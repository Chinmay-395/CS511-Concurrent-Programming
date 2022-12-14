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

		 /* PROC Patriots */
	case 3: // STATE 1 - q10.pml:28 - [nPats = (nPats+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.nPats);
		now.nPats = (((int)now.nPats)+1);
#ifdef VAR_RANGES
		logval("nPats", ((int)now.nPats));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q10.pml:14 - [ticket = (ticket+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.ticket);
		now.ticket = (((int)now.ticket)+1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - q10.pml:30 - [printf('J: %d, P: %d\\n',nJets,nPats)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		Printf("J: %d, P: %d\n", ((int)now.nJets), ((int)now.nPats));
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - q10.pml:31 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Jets */
	case 7: // STATE 1 - q10.pml:9 - [((mutex>0))] (8:0:1 - 1)
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
	case 8: // STATE 5 - q10.pml:9 - [((ticket>0))] (12:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)now.ticket)>0)))
			continue;
		/* merge: ticket = (ticket-1)(0, 6, 12) */
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.ticket);
		now.ticket = (((int)now.ticket)-1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 9: // STATE 9 - q10.pml:9 - [((ticket>0))] (14:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((((int)now.ticket)>0)))
			continue;
		/* merge: ticket = (ticket-1)(0, 10, 14) */
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)now.ticket);
		now.ticket = (((int)now.ticket)-1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 10: // STATE 13 - q10.pml:14 - [mutex = (mutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 15 - q10.pml:22 - [nJets = (nJets+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.nJets);
		now.nJets = (((int)now.nJets)+1);
#ifdef VAR_RANGES
		logval("nJets", ((int)now.nJets));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 16 - q10.pml:23 - [printf('J: %d, P: %d\\n',nJets,nPats)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		Printf("J: %d, P: %d\n", ((int)now.nJets), ((int)now.nPats));
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 17 - q10.pml:24 - [assert(((2*nJets)<=nPats))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		spin_assert(((2*((int)now.nJets))<=((int)now.nPats)), "((2*nJets)<=nPats)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 18 - q10.pml:25 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
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

