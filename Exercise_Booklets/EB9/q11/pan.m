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
	case 3: // STATE 1 - q11.pml:81 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->i);
		((P2 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - q11.pml:81 - [((i<=(3-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((int)((P2 *)_this)->i)<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - q11.pml:82 - [permToProcess[i] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		(trpt+1)->bup.oval = ((int)now.permToProcess[ Index(((int)((P2 *)_this)->i), 3) ]);
		now.permToProcess[ Index(((P2 *)_this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("permToProcess[:init::i]", ((int)now.permToProcess[ Index(((int)((P2 *)_this)->i), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - q11.pml:83 - [doneProcessing[i] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = ((int)now.doneProcessing[ Index(((int)((P2 *)_this)->i), 3) ]);
		now.doneProcessing[ Index(((P2 *)_this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("doneProcessing[:init::i]", ((int)now.doneProcessing[ Index(((int)((P2 *)_this)->i), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - q11.pml:81 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->i);
		((P2 *)_this)->i = (((int)((P2 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 11 - q11.pml:87 - [i = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->i);
		((P2 *)_this)->i = 1;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 12 - q11.pml:87 - [((i<=10))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		if (!((((int)((P2 *)_this)->i)<=10)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 13 - q11.pml:88 - [(run Car())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 14 - q11.pml:87 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->i);
		((P2 *)_this)->i = (((int)((P2 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 20 - q11.pml:93 - [i = 0] (0:26:1 - 3)
		IfNotBlocked
		reached[2][20] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->i);
		((P2 *)_this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)_this)->i));
#endif
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[2][27] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 21 - q11.pml:93 - [((i<=(3-1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		if (!((((int)((P2 *)_this)->i)<=(3-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 22 - q11.pml:94 - [(run Machine(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		if (!(addproc(II, 1, 1, ((int)((P2 *)_this)->i))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 23 - q11.pml:93 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[2][23] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->i);
		((P2 *)_this)->i = (((int)((P2 *)_this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P2 *)_this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 30 - q11.pml:97 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][30] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Machine */
	case 17: // STATE 1 - q11.pml:15 - [((permToProcess[i]>0))] (6:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.permToProcess[ Index(((P1 *)_this)->i, 3) ])>0)))
			continue;
		/* merge: permToProcess[i] = (permToProcess[i]-1)(0, 2, 6) */
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)now.permToProcess[ Index(((P1 *)_this)->i, 3) ]);
		now.permToProcess[ Index(((P1 *)_this)->i, 3) ] = (((int)now.permToProcess[ Index(((P1 *)_this)->i, 3) ])-1);
#ifdef VAR_RANGES
		logval("permToProcess[Machine:i]", ((int)now.permToProcess[ Index(((P1 *)_this)->i, 3) ]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 5 - q11.pml:20 - [doneProcessing[i] = (doneProcessing[i]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = ((int)now.doneProcessing[ Index(((P1 *)_this)->i, 3) ]);
		now.doneProcessing[ Index(((P1 *)_this)->i, 3) ] = (((int)now.doneProcessing[ Index(((P1 *)_this)->i, 3) ])+1);
#ifdef VAR_RANGES
		logval("doneProcessing[Machine:i]", ((int)now.doneProcessing[ Index(((P1 *)_this)->i, 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 10 - q11.pml:75 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Car */
	case 20: // STATE 1 - q11.pml:15 - [((station0>0))] (5:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.station0)>0)))
			continue;
		/* merge: station0 = (station0-1)(0, 2, 5) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.station0);
		now.station0 = (((int)now.station0)-1);
#ifdef VAR_RANGES
		logval("station0", ((int)now.station0));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 5 - q11.pml:27 - [stationAccquired[0] = (stationAccquired[0]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)now.stationAccquired[0]);
		now.stationAccquired[0] = (((int)now.stationAccquired[0])+1);
#ifdef VAR_RANGES
		logval("stationAccquired[0]", ((int)now.stationAccquired[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 6 - q11.pml:28 - [assert((stationAccquired[0]==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		spin_assert((((int)now.stationAccquired[0])==1), "(stationAccquired[0]==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 7 - q11.pml:29 - [stationAccquired[0] = (stationAccquired[0]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.stationAccquired[0]);
		now.stationAccquired[0] = (((int)now.stationAccquired[0])-1);
#ifdef VAR_RANGES
		logval("stationAccquired[0]", ((int)now.stationAccquired[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 8 - q11.pml:20 - [permToProcess[0] = (permToProcess[0]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)now.permToProcess[0]);
		now.permToProcess[0] = (((int)now.permToProcess[0])+1);
#ifdef VAR_RANGES
		logval("permToProcess[0]", ((int)now.permToProcess[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 10 - q11.pml:15 - [((doneProcessing[0]>0))] (17:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!((((int)now.doneProcessing[0])>0)))
			continue;
		/* merge: doneProcessing[0] = (doneProcessing[0]-1)(0, 11, 17) */
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.doneProcessing[0]);
		now.doneProcessing[0] = (((int)now.doneProcessing[0])-1);
#ifdef VAR_RANGES
		logval("doneProcessing[0]", ((int)now.doneProcessing[0]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 14 - q11.pml:15 - [((station1>0))] (18:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!((((int)now.station1)>0)))
			continue;
		/* merge: station1 = (station1-1)(0, 15, 18) */
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.station1);
		now.station1 = (((int)now.station1)-1);
#ifdef VAR_RANGES
		logval("station1", ((int)now.station1));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 27: // STATE 18 - q11.pml:36 - [stationAccquired[1] = (stationAccquired[1]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)now.stationAccquired[1]);
		now.stationAccquired[1] = (((int)now.stationAccquired[1])+1);
#ifdef VAR_RANGES
		logval("stationAccquired[1]", ((int)now.stationAccquired[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 19 - q11.pml:37 - [assert((stationAccquired[1]==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		spin_assert((((int)now.stationAccquired[1])==1), "(stationAccquired[1]==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 20 - q11.pml:38 - [stationAccquired[1] = (stationAccquired[1]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.stationAccquired[1]);
		now.stationAccquired[1] = (((int)now.stationAccquired[1])-1);
#ifdef VAR_RANGES
		logval("stationAccquired[1]", ((int)now.stationAccquired[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 21 - q11.pml:20 - [station0 = (station0+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = ((int)now.station0);
		now.station0 = (((int)now.station0)+1);
#ifdef VAR_RANGES
		logval("station0", ((int)now.station0));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 23 - q11.pml:20 - [permToProcess[1] = (permToProcess[1]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)now.permToProcess[1]);
		now.permToProcess[1] = (((int)now.permToProcess[1])+1);
#ifdef VAR_RANGES
		logval("permToProcess[1]", ((int)now.permToProcess[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 25 - q11.pml:15 - [((doneProcessing[1]>0))] (32:0:1 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((int)now.doneProcessing[1])>0)))
			continue;
		/* merge: doneProcessing[1] = (doneProcessing[1]-1)(0, 26, 32) */
		reached[0][26] = 1;
		(trpt+1)->bup.oval = ((int)now.doneProcessing[1]);
		now.doneProcessing[1] = (((int)now.doneProcessing[1])-1);
#ifdef VAR_RANGES
		logval("doneProcessing[1]", ((int)now.doneProcessing[1]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 33: // STATE 29 - q11.pml:15 - [((station2>0))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		if (!((((int)now.station2)>0)))
			continue;
		/* merge: station2 = (station2-1)(0, 30, 33) */
		reached[0][30] = 1;
		(trpt+1)->bup.oval = ((int)now.station2);
		now.station2 = (((int)now.station2)-1);
#ifdef VAR_RANGES
		logval("station2", ((int)now.station2));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 34: // STATE 33 - q11.pml:50 - [stationAccquired[2] = (stationAccquired[2]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][33] = 1;
		(trpt+1)->bup.oval = ((int)now.stationAccquired[2]);
		now.stationAccquired[2] = (((int)now.stationAccquired[2])+1);
#ifdef VAR_RANGES
		logval("stationAccquired[2]", ((int)now.stationAccquired[2]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 34 - q11.pml:51 - [assert((stationAccquired[2]==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		spin_assert((((int)now.stationAccquired[2])==1), "(stationAccquired[2]==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 35 - q11.pml:52 - [stationAccquired[2] = (stationAccquired[2]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((int)now.stationAccquired[2]);
		now.stationAccquired[2] = (((int)now.stationAccquired[2])-1);
#ifdef VAR_RANGES
		logval("stationAccquired[2]", ((int)now.stationAccquired[2]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 36 - q11.pml:20 - [station1 = (station1+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = ((int)now.station1);
		now.station1 = (((int)now.station1)+1);
#ifdef VAR_RANGES
		logval("station1", ((int)now.station1));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 38 - q11.pml:20 - [permToProcess[2] = (permToProcess[2]+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		(trpt+1)->bup.oval = ((int)now.permToProcess[2]);
		now.permToProcess[2] = (((int)now.permToProcess[2])+1);
#ifdef VAR_RANGES
		logval("permToProcess[2]", ((int)now.permToProcess[2]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 40 - q11.pml:15 - [((doneProcessing[2]>0))] (45:0:1 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		if (!((((int)now.doneProcessing[2])>0)))
			continue;
		/* merge: doneProcessing[2] = (doneProcessing[2]-1)(0, 41, 45) */
		reached[0][41] = 1;
		(trpt+1)->bup.oval = ((int)now.doneProcessing[2]);
		now.doneProcessing[2] = (((int)now.doneProcessing[2])-1);
#ifdef VAR_RANGES
		logval("doneProcessing[2]", ((int)now.doneProcessing[2]));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 40: // STATE 44 - q11.pml:20 - [station2 = (station2+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = ((int)now.station2);
		now.station2 = (((int)now.station2)+1);
#ifdef VAR_RANGES
		logval("station2", ((int)now.station2));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 46 - q11.pml:59 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][46] = 1;
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

