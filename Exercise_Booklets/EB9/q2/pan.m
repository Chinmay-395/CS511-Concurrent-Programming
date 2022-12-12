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

		 /* PROC Q */
	case 3: // STATE 1 - 2.pml:20 - [((turn==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.turn)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 7 - 2.pml:23 - [printf('Q went in \\n')] (0:9:0 - 3)
		IfNotBlocked
		reached[1][7] = 1;
		Printf("Q went in \n");
		/* merge: .(goto)(0, 10, 9) */
		reached[1][10] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 5: // STATE 8 - 2.pml:24 - [turn = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 12 - 2.pml:27 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 7: // STATE 1 - 2.pml:7 - [((turn==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.turn)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 7 - 2.pml:10 - [printf('P went in \\n')] (0:9:0 - 3)
		IfNotBlocked
		reached[0][7] = 1;
		Printf("P went in \n");
		/* merge: .(goto)(0, 10, 9) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 9: // STATE 8 - 2.pml:11 - [((turn==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((int)now.turn)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 12 - 2.pml:14 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
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

