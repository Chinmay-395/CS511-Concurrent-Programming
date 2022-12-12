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

		 /* PROC user */
	case 3: // STATE 1 - q6.pml:6 - [turn = _pid] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q6.pml:7 - [flag[_pid] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[ Index(((int)((P0 *)_this)->_pid), 2) ]);
		now.flag[ Index(((P0 *)_this)->_pid, 2) ] = 1;
#ifdef VAR_RANGES
		logval("flag[_pid]", ((int)now.flag[ Index(((int)((P0 *)_this)->_pid), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - q6.pml:10 - [(((flag[(1-_pid)]==0)||(turn==(1-_pid))))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((((int)now.flag[ Index((1-((int)((P0 *)_this)->_pid)), 2) ])==0)||(((int)now.turn)==(1-((int)((P0 *)_this)->_pid))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - q6.pml:10 - [counter = (counter+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)+1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 11 - q6.pml:16 - [assert((counter==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		spin_assert((((int)now.counter)==1), "(counter==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 12 - q6.pml:17 - [counter = (counter-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)-1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 13 - q6.pml:19 - [flag[_pid] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[ Index(((int)((P0 *)_this)->_pid), 2) ]);
		now.flag[ Index(((P0 *)_this)->_pid, 2) ] = 0;
#ifdef VAR_RANGES
		logval("flag[_pid]", ((int)now.flag[ Index(((int)((P0 *)_this)->_pid), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 14 - q6.pml:20 - [assert((counter==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		spin_assert((((int)now.counter)==0), "(counter==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 15 - q6.pml:21 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
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

