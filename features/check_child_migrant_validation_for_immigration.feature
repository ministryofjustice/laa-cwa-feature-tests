Feature: Check Child Migrant Validation for Immigration claims

  Background: On the outcome screen enter an Immigration claim

  All Immigration matter type codes can be used
  with the child migrant exemption criteria satisfied code (i.e. CM001)

  Given user is on their submission details page

  @delete_outcome_after
  Scenario Outline: As a provider I want to successfully save a child migrant Immigration and Asylum claim as part of a monthly submission
    When user adds an outcome for Immigration with "<case id>", "<matter type>", "<exemption criteria satisfied>", "ecf ref", "<case start date>", "<pa>" and "<ap>"
    Then the outcome saves successfully

    Examples: All Immigration and Asylum (IMMAS) MT1/MT2 codes can be used with the new child migrant code
    Immigration and Asylum claims do not require an ECF Ref when submitted as a child migrant case

    |	 case id 	|	matter type	|	 exemption criteria satisfied 	|	ecf ref	|	 case start date 	|	 pa 	|	 ap 	|
    |	300	|	IAAP:IEAP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	301	|	IAAP:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	302	|	IAAP:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	303	|	IAAP:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	304	|	IAAP:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	305	|	IAAP:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	306	|	IAAP:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	307	|	IAAP:IRAR	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	308	|	IAAP:IRHO	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	309	|	IAAP:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	310	|	IAAP:IUAD	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	311	|	IAAP:IUAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	312	|	IACA:IASY	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	313	|	IACA:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	314	|	IACA:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	315	|	IACA:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	316	|	IACA:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	317	|	IACA:ILEA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	318	|	IACA:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	319	|	IACA:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	320	|	IACA:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	321	|	IACB:IASY	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	322	|	IACB:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	323	|	IACB:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	324	|	IACB:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	325	|	IACB:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	326	|	IACB:ILEA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	327	|	IACB:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	328	|	IACB:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	329	|	IACB:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	330	|	IALB:IASY	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	331	|	IALB:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	332	|	IALB:IFRB	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	333	|	IALB:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	334	|	IALB:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	335	|	IALB:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	336	|	IALB:ILEA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	337	|	IALB:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	338	|	IALB:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	339	|	IALB:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	340	|	IALH:IASU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	341	|	IALH:ICOA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	342	|	IALH:IEAP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	343	|	IALH:IFFL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	344	|	IALH:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	345	|	IALH:IFRB	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	346	|	IALH:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	347	|	IALH:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	348	|	IALH:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	349	|	IALH:IJRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	350	|	IALH:IMER	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	351	|	IALH:INAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	352	|	IALH:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	353	|	IALH:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	354	|	IALH:IPAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	355	|	IALH:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	356	|	IALH:IUAD	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	357	|	IALH:IUAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	358	|	IAXC:IASU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	359	|	IAXC:IASY	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	360	|	IAXC:IBAI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	361	|	IAXC:IEAP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	362	|	IAXC:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	363	|	IAXC:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	364	|	IAXC:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	365	|	IAXC:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	366	|	IAXC:ILEA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	367	|	IAXC:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	368	|	IAXC:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	369	|	IAXC:IRAR	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	370	|	IAXC:IREM	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	371	|	IAXC:IRHO	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	372	|	IAXC:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	373	|	IAXC:IUAD	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	374	|	IAXC:IUAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	375	|	IAXL:IASU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	376	|	IAXL:IASY	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	377	|	IAXL:IBAI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	378	|	IAXL:ICOA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	379	|	IAXL:IDAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	380	|	IAXL:IEAP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	381	|	IAXL:IFFL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	382	|	IAXL:IFRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	383	|	IAXL:IFRB	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	384	|	IAXL:IFST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	385	|	IAXL:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	386	|	IAXL:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	387	|	IAXL:IJRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	388	|	IAXL:ILEA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	389	|	IAXL:IMER	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	390	|	IAXL:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	391	|	IAXL:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	392	|	IAXL:IPAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	393	|	IAXL:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	394	|	IAXL:IUAD	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
    |	395	|	IAXL:IUAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|

    @delete_outcome_after
    Scenario Outline: As a provider I want to successfully save a child migrant Immigration claim as part of a monthly submission
      When user adds an outcome for Immigration with "<case id>", "<matter type>", "<exemption criteria satisfied>", "ecf ref", "<case start date>", "<pa>" and "<ap>"
      Then the outcome saves successfully

      Examples: All Immigration (IMMOT) MT1/MT2 codes can be used with the new child migrant code
      Immigration claims do not require an ECF Ref when submitted as a child migrant case

      |	 case id 	|	 matter type 	|	 exemption criteria satisfied 	|	ecf ref	|	 case start date 	|	 pa 	|	 ap 	|
      |	400	|	IMAP:IEMP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	401	|	IMAP:IEUL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	402	|	IMAP:IFME	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	403	|	IMAP:IFVI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	404	|	IMAP:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	405	|	IMAP:IILL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	406	|	IMAP:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	407	|	IMAP:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	408	|	IMAP:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	409	|	IMAP:IRAR	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	410	|	IMAP:IRHO	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	411	|	IMAP:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	412	|	IMAP:ISTU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	413	|	IMAP:ITWE	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	414	|	IMCA:ICZN	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	415	|	IMCA:IDOM	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	416	|	IMCA:IEMP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	417	|	IMCA:IEUL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	418	|	IMCA:IFME	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	419	|	IMCA:IFVI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	420	|	IMCA:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	421	|	IMCA:IILL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	422	|	IMCA:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	423	|	IMCA:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	424	|	IMCA:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	425	|	IMCA:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	426	|	IMCA:ISTU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	427	|	IMCA:ITWE	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	428	|	IMCB:IDOM	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	429	|	IMCB:IEMP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	430	|	IMCB:IEUL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	431	|	IMCB:IFME	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	432	|	IMCB:IFVI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	433	|	IMCB:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	434	|	IMCB:IILL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	435	|	IMCB:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	436	|	IMCB:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	437	|	IMCB:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	438	|	IMCB:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	439	|	IMCB:ISTU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	440	|	IMCB:ITWE	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	441	|	IMLB:ICZN	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	442	|	IMLB:IDOM	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	443	|	IMLB:IEMP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	444	|	IMLB:IEUL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	445	|	IMLB:IFME	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	446	|	IMLB:IFVI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	447	|	IMLB:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	448	|	IMLB:IILL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	449	|	IMLB:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	450	|	IMLB:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	451	|	IMLB:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	452	|	IMLB:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	453	|	IMLB:ISTU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	454	|	IMLB:ITWE	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	455	|	IMLH:ICOA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	456	|	IMLH:ICZN	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	457	|	IMLH:IEMP	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	458	|	IMLH:IEUL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	459	|	IMLH:IFFL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	460	|	IMLH:IFME	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	461	|	IMLH:IFVI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	462	|	IMLH:IGOL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	463	|	IMLH:IILL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	464	|	IMLH:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	465	|	IMLH:IJRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	466	|	IMLH:IMER	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	467	|	IMLH:INAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	468	|	IMLH:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	469	|	IMLH:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	470	|	IMLH:IPAS	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	471	|	IMLH:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	472	|	IMLH:ISTU	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	473	|	IMLH:ITWE	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	474	|	IMXC:IBAI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	475	|	IMXC:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	476	|	IMXC:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	477	|	IMXC:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	478	|	IMXC:IRAR	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	479	|	IMXC:IREM	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	480	|	IMXC:IRHO	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	481	|	IMXC:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	482	|	IMXL:IBAI	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	483	|	IMXL:ICOA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	484	|	IMXL:IFFL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	485	|	IMXL:IIRC	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	486	|	IMXL:IJRA	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	487	|	IMXL:IMER	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	488	|	IMXL:IOTH	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	489	|	IMXL:IOUT	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	490	|	IMXL:IPST	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
      |	491	|	IMXL:IRVL	|	CM001	|		|	01/11/19	|	 PA00140 	|	 AP00198 	|
