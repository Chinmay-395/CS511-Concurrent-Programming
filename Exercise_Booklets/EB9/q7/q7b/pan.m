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
	case 3: // STATE 1 - q7b.pml:25 - [temp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->temp);
		((P1 *)_this)->temp = 0;
#ifdef VAR_RANGES
		logval("Q:temp", ((int)((P1 *)_this)->temp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q7b.pml:25 - [temp = (np+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->temp);
		((P1 *)_this)->temp = (((int)now.np)+1);
#ifdef VAR_RANGES
		logval("Q:temp", ((int)((P1 *)_this)->temp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - q7b.pml:26 - [nq = temp] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.nq);
		now.nq = ((int)((P1 *)_this)->temp);
#ifdef VAR_RANGES
		logval("nq", ((int)now.nq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - q7b.pml:28 - [(!(((np==0)||(nq<np))))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!( !(((((int)now.np)==0)||(((int)now.nq)<((int)now.np))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 9 - q7b.pml:31 - [nq = 0] (0:0:1 - 3)
		IfNotBlocked
		reached[1][9] = 1;
		(trpt+1)->bup.oval = ((int)now.nq);
		now.nq = 0;
#ifdef VAR_RANGES
		logval("nq", ((int)now.nq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 13 - q7b.pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 9: // STATE 1 - q7b.pml:8 - [temp = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->temp);
		((P0 *)_this)->temp = 0;
#ifdef VAR_RANGES
		logval("P:temp", ((int)((P0 *)_this)->temp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 2 - q7b.pml:8 - [temp = (nq+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->temp);
		((P0 *)_this)->temp = (((int)now.nq)+1);
#ifdef VAR_RANGES
		logval("P:temp", ((int)((P0 *)_this)->temp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - q7b.pml:9 - [np = temp] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.np);
		now.np = ((int)((P0 *)_this)->temp);
#ifdef VAR_RANGES
		logval("np", ((int)now.np));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - q7b.pml:11 - [(!(((nq==0)||(np<=nq))))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!( !(((((int)now.nq)==0)||(((int)now.np)<=((int)now.nq))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 9 - q7b.pml:14 - [np = 0] (0:0:1 - 3)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)now.np);
		now.np = 0;
#ifdef VAR_RANGES
		logval("np", ((int)now.np));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 13 - q7b.pml:17 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
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

