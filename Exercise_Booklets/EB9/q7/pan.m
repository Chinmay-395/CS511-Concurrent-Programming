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
	case 3: // STATE 1 - q7.pml:20 - [nq = (np+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.nq);
		now.nq = (((int)now.np)+1);
#ifdef VAR_RANGES
		logval("nq", ((int)now.nq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q7.pml:22 - [(!(((np==0)||(nq<np))))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!( !(((((int)now.np)==0)||(((int)now.nq)<((int)now.np))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 7 - q7.pml:25 - [nq = 0] (0:0:1 - 3)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.nq);
		now.nq = 0;
#ifdef VAR_RANGES
		logval("nq", ((int)now.nq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 11 - q7.pml:28 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 7: // STATE 1 - q7.pml:6 - [np = (nq+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.np);
		now.np = (((int)now.nq)+1);
#ifdef VAR_RANGES
		logval("np", ((int)now.np));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 2 - q7.pml:8 - [(!(((nq==0)||(np<=nq))))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!( !(((((int)now.nq)==0)||(((int)now.np)<=((int)now.nq))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - q7.pml:11 - [np = 0] (0:0:1 - 3)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.np);
		now.np = 0;
#ifdef VAR_RANGES
		logval("np", ((int)now.np));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 11 - q7.pml:14 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
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

