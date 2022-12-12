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

		 /* PROC :init: */
	case 3: // STATE 1 - new.pml:68 - [(run P())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - new.pml:69 - [(run Q())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - new.pml:70 - [(run R())] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - new.pml:72 - [assert(((x<200)&&(x>0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		spin_assert(((((int)now.x)<200)&&(((int)now.x)>0)), "((x<200)&&(x>0))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 6 - new.pml:73 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC R */
	case 8: // STATE 1 - new.pml:60 - [((x==200))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!((((int)now.x)==200)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - new.pml:60 - [x = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.oval = ((int)now.x);
		now.x = 0;
#ifdef VAR_RANGES
		logval("x", ((int)now.x));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 10 - new.pml:64 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Q */
	case 11: // STATE 1 - new.pml:50 - [((x>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.x)>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - new.pml:50 - [x = (x-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.x);
		now.x = (((int)now.x)-1);
#ifdef VAR_RANGES
		logval("x", ((int)now.x));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 10 - new.pml:54 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 14: // STATE 1 - new.pml:39 - [((x<200))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.x)<200)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 2 - new.pml:39 - [x = (x+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.x);
		now.x = (((int)now.x)+1);
#ifdef VAR_RANGES
		logval("x", ((int)now.x));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 10 - new.pml:44 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[0][10] = 1;
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

