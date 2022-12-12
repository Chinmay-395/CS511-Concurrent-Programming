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
	case 3: // STATE 1 - q10.pml:8 - [((mutex>0))] (5:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.mutex)>0)))
			continue;
		/* merge: mutex = (mutex-1)(0, 2, 5) */
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)-1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 5 - q10.pml:23 - [criticalPats = (criticalPats+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = ((int)now.criticalPats);
		now.criticalPats = (((int)now.criticalPats)+1);
#ifdef VAR_RANGES
		logval("criticalPats", ((int)now.criticalPats));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 6 - q10.pml:8 - [((ticket>0))] (10:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!((((int)now.ticket)>0)))
			continue;
		/* merge: ticket = (ticket-1)(0, 7, 10) */
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.ticket);
		now.ticket = (((int)now.ticket)-1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 6: // STATE 10 - q10.pml:25 - [criticalJets = (criticalJets+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((int)now.criticalJets);
		now.criticalJets = (((int)now.criticalJets)+1);
#ifdef VAR_RANGES
		logval("criticalJets", ((int)now.criticalJets));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 11 - q10.pml:8 - [((ticket>0))] (15:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!((((int)now.ticket)>0)))
			continue;
		/* merge: ticket = (ticket-1)(0, 12, 15) */
		reached[1][12] = 1;
		(trpt+1)->bup.oval = ((int)now.ticket);
		now.ticket = (((int)now.ticket)-1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 8: // STATE 15 - q10.pml:27 - [criticalJets = (criticalJets+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = ((int)now.criticalJets);
		now.criticalJets = (((int)now.criticalJets)+1);
#ifdef VAR_RANGES
		logval("criticalJets", ((int)now.criticalJets));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 16 - q10.pml:28 - [assert(((2*criticalJets)<=criticalPats))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		spin_assert(((2*((int)now.criticalJets))<=((int)now.criticalPats)), "((2*criticalJets)<=criticalPats)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 17 - q10.pml:29 - [criticalPats = (criticalPats-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((int)now.criticalPats);
		now.criticalPats = (((int)now.criticalPats)-1);
#ifdef VAR_RANGES
		logval("criticalPats", ((int)now.criticalPats));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 18 - q10.pml:13 - [mutex = (mutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 20 - q10.pml:32 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Jets */
	case 13: // STATE 1 - q10.pml:17 - [criticalJets = (criticalJets-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.criticalJets);
		now.criticalJets = (((int)now.criticalJets)-1);
#ifdef VAR_RANGES
		logval("criticalJets", ((int)now.criticalJets));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - q10.pml:13 - [ticket = (ticket+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.ticket);
		now.ticket = (((int)now.ticket)+1);
#ifdef VAR_RANGES
		logval("ticket", ((int)now.ticket));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 4 - q10.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
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

