open Prims
type z3_err =
  (FStar_SMTEncoding_Term.error_labels* FStar_SMTEncoding_Z3.error_kind)
type z3_result = (FStar_SMTEncoding_Z3.unsat_core,z3_err) FStar_Util.either
type z3_replay_result =
  (FStar_SMTEncoding_Z3.unsat_core,FStar_SMTEncoding_Term.error_labels)
    FStar_Util.either
let z3_result_as_replay_result uu___84_27 =
  match uu___84_27 with
  | FStar_Util.Inl l -> FStar_Util.Inl l
  | FStar_Util.Inr (r,uu____36) -> FStar_Util.Inr r
type hint_stat =
  {
  hint: FStar_Util.hint option;
  replay_result: z3_replay_result;
  elapsed_time: Prims.int;
  source_location: FStar_Range.range;}
let __proj__Mkhint_stat__item__hint: hint_stat -> FStar_Util.hint option =
  fun projectee  ->
    match projectee with
    | { hint = __fname__hint; replay_result = __fname__replay_result;
        elapsed_time = __fname__elapsed_time;
        source_location = __fname__source_location;_} -> __fname__hint
let __proj__Mkhint_stat__item__replay_result: hint_stat -> z3_replay_result =
  fun projectee  ->
    match projectee with
    | { hint = __fname__hint; replay_result = __fname__replay_result;
        elapsed_time = __fname__elapsed_time;
        source_location = __fname__source_location;_} ->
        __fname__replay_result
let __proj__Mkhint_stat__item__elapsed_time: hint_stat -> Prims.int =
  fun projectee  ->
    match projectee with
    | { hint = __fname__hint; replay_result = __fname__replay_result;
        elapsed_time = __fname__elapsed_time;
        source_location = __fname__source_location;_} ->
        __fname__elapsed_time
let __proj__Mkhint_stat__item__source_location:
  hint_stat -> FStar_Range.range =
  fun projectee  ->
    match projectee with
    | { hint = __fname__hint; replay_result = __fname__replay_result;
        elapsed_time = __fname__elapsed_time;
        source_location = __fname__source_location;_} ->
        __fname__source_location
type hint_stats_t = hint_stat Prims.list
let recorded_hints: FStar_Util.hints option FStar_ST.ref =
  FStar_Util.mk_ref None
let replaying_hints: FStar_Util.hints option FStar_ST.ref =
  FStar_Util.mk_ref None
let hint_stats: hint_stat Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let format_hints_file_name: Prims.string -> Prims.string =
  fun src_filename  -> FStar_Util.format1 "%s.hints" src_filename
let initialize_hints_db src_filename force_record =
  FStar_ST.write hint_stats [];
  (let uu____134 = FStar_Options.record_hints () in
   if uu____134 then FStar_ST.write recorded_hints (Some []) else ());
  (let uu____142 = FStar_Options.use_hints () in
   if uu____142
   then
     let norm_src_filename = FStar_Util.normalize_file_path src_filename in
     let val_filename = format_hints_file_name norm_src_filename in
     let uu____145 = FStar_Util.read_hints val_filename in
     match uu____145 with
     | Some hints ->
         let expected_digest = FStar_Util.digest_of_file norm_src_filename in
         ((let uu____150 = FStar_Options.hint_info () in
           if uu____150
           then
             (if hints.FStar_Util.module_digest = expected_digest
              then
                FStar_Util.print1 "(%s) digest is valid; using hints db.\n"
                  norm_src_filename
              else
                FStar_Util.print1
                  "(%s) digest is invalid; using potentially stale hints\n"
                  norm_src_filename)
           else ());
          FStar_ST.write replaying_hints (Some (hints.FStar_Util.hints)))
     | None  ->
         let uu____156 = FStar_Options.hint_info () in
         (if uu____156
          then
            FStar_Util.print1 "(%s) Unable to read hints db.\n"
              norm_src_filename
          else ())
   else ())
let finalize_hints_db: Prims.string -> Prims.unit =
  fun src_filename  ->
    (let uu____164 = FStar_Options.record_hints () in
     if uu____164
     then
       let hints =
         let uu____166 = FStar_ST.read recorded_hints in
         FStar_Option.get uu____166 in
       let hints_db =
         let uu____172 = FStar_Util.digest_of_file src_filename in
         { FStar_Util.module_digest = uu____172; FStar_Util.hints = hints } in
       let hints_file_name = format_hints_file_name src_filename in
       FStar_Util.write_hints hints_file_name hints_db
     else ());
    (let uu____176 = FStar_Options.hint_info () in
     if uu____176
     then
       let stats =
         let uu____179 = FStar_ST.read hint_stats in
         FStar_All.pipe_right uu____179 FStar_List.rev in
       FStar_All.pipe_right stats
         (FStar_List.iter
            (fun s  ->
               match s.replay_result with
               | FStar_Util.Inl _unsat_core ->
<<<<<<< HEAD
                   let uu____164 =
                     FStar_Range.string_of_range s.source_location in
                   let uu____165 = FStar_Util.string_of_int s.elapsed_time in
                   FStar_Util.print2
                     "Hint-info (%s): Replay succeeded in %s milliseconds\n"
                     uu____164 uu____165
               | FStar_Util.Inr _error ->
                   let uu____167 =
                     FStar_Range.string_of_range s.source_location in
                   let uu____168 = FStar_Util.string_of_int s.elapsed_time in
                   FStar_Util.print2
                     "Hint-info (%s): Replay failed in %s milliseconds\n"
                     uu____167 uu____168))
=======
                   let uu____189 =
                     FStar_Range.string_of_range s.source_location in
                   let uu____190 = FStar_Util.string_of_int s.elapsed_time in
                   FStar_Util.print2
                     "Hint-info (%s): Replay succeeded in %s milliseconds\n"
                     uu____189 uu____190
               | FStar_Util.Inr _error ->
                   let uu____192 =
                     FStar_Range.string_of_range s.source_location in
                   let uu____193 = FStar_Util.string_of_int s.elapsed_time in
                   FStar_Util.print2
                     "Hint-info (%s): Replay failed in %s milliseconds\n"
                     uu____192 uu____193))
>>>>>>> origin/guido_tactics
     else ());
    FStar_ST.write recorded_hints None;
    FStar_ST.write replaying_hints None;
    FStar_ST.write hint_stats []
let with_hints_db fname f =
  initialize_hints_db fname false;
  (let result = f () in finalize_hints_db fname; result)
let next_hint: Prims.string -> Prims.int -> FStar_Util.hint option =
  fun qname  ->
    fun qindex  ->
<<<<<<< HEAD
      let uu____208 = FStar_ST.read replaying_hints in
      match uu____208 with
      | Some hints ->
          FStar_Util.find_map hints
            (fun uu___84_218  ->
               match uu___84_218 with
=======
      let uu____238 = FStar_ST.read replaying_hints in
      match uu____238 with
      | Some hints ->
          FStar_Util.find_map hints
            (fun uu___85_246  ->
               match uu___85_246 with
>>>>>>> origin/guido_tactics
               | Some hint when
                   (hint.FStar_Util.hint_name = qname) &&
                     (hint.FStar_Util.hint_index = qindex)
                   -> Some hint
<<<<<<< HEAD
               | uu____222 -> None)
      | uu____224 -> None
=======
               | uu____250 -> None)
      | uu____252 -> None
>>>>>>> origin/guido_tactics
let record_hint: FStar_Util.hint option -> Prims.unit =
  fun hint  ->
    let hint1 =
      match hint with
      | None  -> None
      | Some h ->
          Some
<<<<<<< HEAD
            (let uu___89_236 = h in
             {
               FStar_Util.hint_name = (uu___89_236.FStar_Util.hint_name);
               FStar_Util.hint_index = (uu___89_236.FStar_Util.hint_index);
               FStar_Util.fuel = (uu___89_236.FStar_Util.fuel);
               FStar_Util.ifuel = (uu___89_236.FStar_Util.ifuel);
               FStar_Util.unsat_core = (uu___89_236.FStar_Util.unsat_core);
               FStar_Util.query_elapsed_time = (Prims.parse_int "0")
             }) in
    let uu____237 = FStar_ST.read recorded_hints in
    match uu____237 with
    | Some l ->
        FStar_ST.write recorded_hints (Some (FStar_List.append l [hint1]))
    | uu____251 -> ()
=======
            (let uu___89_264 = h in
             {
               FStar_Util.hint_name = (uu___89_264.FStar_Util.hint_name);
               FStar_Util.hint_index = (uu___89_264.FStar_Util.hint_index);
               FStar_Util.fuel = (uu___89_264.FStar_Util.fuel);
               FStar_Util.ifuel = (uu___89_264.FStar_Util.ifuel);
               FStar_Util.unsat_core = (uu___89_264.FStar_Util.unsat_core);
               FStar_Util.query_elapsed_time = (Prims.parse_int "0")
             }) in
    let uu____265 = FStar_ST.read recorded_hints in
    match uu____265 with
    | Some l ->
        FStar_ST.write recorded_hints (Some (FStar_List.append l [hint1]))
    | uu____279 -> ()
>>>>>>> origin/guido_tactics
let record_hint_stat:
  FStar_Util.hint option ->
    z3_result -> Prims.int -> FStar_Range.range -> Prims.unit
  =
  fun h  ->
    fun res  ->
      fun time  ->
        fun r  ->
          let s =
            {
              hint = h;
              replay_result = (z3_result_as_replay_result res);
              elapsed_time = time;
              source_location = r
            } in
<<<<<<< HEAD
          let uu____268 =
            let uu____270 = FStar_ST.read hint_stats in s :: uu____270 in
          FStar_ST.write hint_stats uu____268
let filter_using_facts_from:
  FStar_SMTEncoding_Term.decls_t -> FStar_SMTEncoding_Term.decls_t =
  fun theory  ->
    let uu____281 = FStar_Options.using_facts_from () in
    match uu____281 with
    | None  -> theory
    | Some namespace_strings ->
        let fact_id_in_namespace ns uu___85_294 =
          match uu___85_294 with
          | FStar_SMTEncoding_Term.Namespace lid ->
              FStar_Util.starts_with (FStar_Ident.text_of_lid lid) ns
          | FStar_SMTEncoding_Term.Name _lid -> false
          | FStar_SMTEncoding_Term.Tag _s -> false in
        let matches_fact_ids include_assumption_names a =
          match a.FStar_SMTEncoding_Term.assumption_fact_ids with
          | [] -> true
          | uu____307 ->
              (FStar_List.contains a.FStar_SMTEncoding_Term.assumption_name
                 include_assumption_names)
                ||
                (FStar_All.pipe_right
                   a.FStar_SMTEncoding_Term.assumption_fact_ids
                   (FStar_Util.for_some
                      (fun fid  ->
                         FStar_All.pipe_right namespace_strings
                           (FStar_Util.for_some
                              (fun ns  -> fact_id_in_namespace ns fid))))) in
        let theory_rev = FStar_List.rev theory in
        let uu____317 =
          FStar_List.fold_left
            (fun uu____332  ->
               fun d  ->
                 match uu____332 with
                 | (out,include_assumption_names) ->
                     (match d with
                      | FStar_SMTEncoding_Term.Assume a ->
                          let uu____353 =
                            matches_fact_ids include_assumption_names a in
                          if uu____353
                          then ((d :: out), include_assumption_names)
                          else (out, include_assumption_names)
                      | FStar_SMTEncoding_Term.RetainAssumptions names ->
                          ((d :: out),
                            (FStar_List.append names include_assumption_names))
                      | uu____367 -> ((d :: out), include_assumption_names)))
            ([], []) theory_rev in
        (match uu____317 with | (pruned_theory,uu____373) -> pruned_theory)
let filter_assertions:
  FStar_SMTEncoding_Z3.unsat_core ->
    FStar_SMTEncoding_Term.decls_t ->
      (FStar_SMTEncoding_Term.decls_t* Prims.bool)
=======
          let uu____300 =
            let uu____302 = FStar_ST.read hint_stats in s :: uu____302 in
          FStar_ST.write hint_stats uu____300
let filter_using_facts_from:
  FStar_TypeChecker_Env.env ->
    FStar_SMTEncoding_Term.decls_t -> FStar_SMTEncoding_Term.decl Prims.list
>>>>>>> origin/guido_tactics
  =
  fun e  ->
    fun theory  ->
<<<<<<< HEAD
      match core with
      | None  ->
          let uu____389 = filter_using_facts_from theory in
          (uu____389, false)
      | Some core1 ->
          let uu____393 =
            FStar_List.fold_right
              (fun d  ->
                 fun uu____409  ->
                   match uu____409 with
                   | (theory1,n_retained,n_pruned) ->
                       (match d with
                        | FStar_SMTEncoding_Term.Assume a ->
                            if
                              FStar_List.contains
                                a.FStar_SMTEncoding_Term.assumption_name
                                core1
                            then
                              ((d :: theory1),
                                (n_retained + (Prims.parse_int "1")),
                                n_pruned)
                            else
=======
      let should_enc_fid fid =
        match fid with
        | FStar_SMTEncoding_Term.Namespace lid ->
            FStar_TypeChecker_Env.should_enc_lid e lid
        | uu____324 -> false in
      let matches_fact_ids include_assumption_names a =
        match a.FStar_SMTEncoding_Term.assumption_fact_ids with
        | [] -> true
        | uu____334 ->
            (FStar_List.contains a.FStar_SMTEncoding_Term.assumption_name
               include_assumption_names)
              ||
              (FStar_All.pipe_right
                 a.FStar_SMTEncoding_Term.assumption_fact_ids
                 (FStar_Util.for_some (fun fid  -> should_enc_fid fid))) in
      let theory_rev = FStar_List.rev theory in
      let uu____340 =
        FStar_List.fold_left
          (fun uu____349  ->
             fun d  ->
               match uu____349 with
               | (out,include_assumption_names) ->
                   (match d with
                    | FStar_SMTEncoding_Term.Assume a ->
                        let uu____370 =
                          matches_fact_ids include_assumption_names a in
                        if uu____370
                        then ((d :: out), include_assumption_names)
                        else (out, include_assumption_names)
                    | FStar_SMTEncoding_Term.RetainAssumptions names1 ->
                        ((d :: out),
                          (FStar_List.append names1 include_assumption_names))
                    | uu____384 -> ((d :: out), include_assumption_names)))
          ([], []) theory_rev in
      match uu____340 with | (pruned_theory,uu____391) -> pruned_theory
let filter_assertions:
  FStar_TypeChecker_Env.env ->
    FStar_SMTEncoding_Z3.unsat_core ->
      FStar_SMTEncoding_Term.decls_t ->
        (FStar_SMTEncoding_Term.decl Prims.list* Prims.bool)
  =
  fun e  ->
    fun core  ->
      fun theory  ->
        match core with
        | None  ->
            let uu____415 = filter_using_facts_from e theory in
            (uu____415, false)
        | Some core1 ->
            let uu____421 =
              FStar_List.fold_right
                (fun d  ->
                   fun uu____431  ->
                     match uu____431 with
                     | (theory1,n_retained,n_pruned) ->
                         (match d with
                          | FStar_SMTEncoding_Term.Assume a ->
>>>>>>> origin/guido_tactics
                              if
                                FStar_List.contains
                                  a.FStar_SMTEncoding_Term.assumption_name
                                  core1
                              then
                                ((d :: theory1),
                                  (n_retained + (Prims.parse_int "1")),
                                  n_pruned)
                              else
<<<<<<< HEAD
                                (theory1, n_retained,
                                  (n_pruned + (Prims.parse_int "1")))
                        | uu____441 -> ((d :: theory1), n_retained, n_pruned)))
              theory ([], (Prims.parse_int "0"), (Prims.parse_int "0")) in
          (match uu____393 with
           | (theory',n_retained,n_pruned) ->
               let missed_assertions th core2 =
                 let missed =
                   let uu____463 =
                     FStar_All.pipe_right core2
                       (FStar_List.filter
                          (fun nm  ->
                             let uu____470 =
                               FStar_All.pipe_right th
                                 (FStar_Util.for_some
                                    (fun uu___86_474  ->
                                       match uu___86_474 with
                                       | FStar_SMTEncoding_Term.Assume a ->
                                           nm =
                                             a.FStar_SMTEncoding_Term.assumption_name
                                       | uu____476 -> false)) in
                             FStar_All.pipe_right uu____470 Prims.op_Negation)) in
                   FStar_All.pipe_right uu____463 (FStar_String.concat ", ") in
                 let included =
                   let uu____479 =
                     FStar_All.pipe_right th
                       (FStar_List.collect
                          (fun uu___87_485  ->
                             match uu___87_485 with
                             | FStar_SMTEncoding_Term.Assume a ->
                                 [a.FStar_SMTEncoding_Term.assumption_name]
                             | uu____488 -> [])) in
                   FStar_All.pipe_right uu____479 (FStar_String.concat ", ") in
                 FStar_Util.format2 "missed={%s}; included={%s}" missed
                   included in
               ((let uu____491 =
                   (FStar_Options.hint_info ()) &&
                     (FStar_Options.debug_any ()) in
                 if uu____491
                 then
                   let n1 = FStar_List.length core1 in
                   let missed =
                     if n1 <> n_retained
                     then missed_assertions theory' core1
                     else "" in
                   let uu____498 = FStar_Util.string_of_int n_retained in
                   let uu____499 =
                     if n1 <> n_retained
                     then
                       let uu____502 = FStar_Util.string_of_int n1 in
                       FStar_Util.format2
                         " (expected %s (%s); replay may be inaccurate)"
                         uu____502 missed
                     else "" in
                   let uu____507 = FStar_Util.string_of_int n_pruned in
                   FStar_Util.print3
                     "\tHint-info: Retained %s assertions%s and pruned %s assertions using recorded unsat core\n"
                     uu____498 uu____499 uu____507
                 else ());
                (let uu____509 =
                   let uu____511 =
                     let uu____513 =
                       let uu____514 =
                         let uu____515 =
                           FStar_All.pipe_right core1
                             (FStar_String.concat ", ") in
                         Prims.strcat "UNSAT CORE: " uu____515 in
                       FStar_SMTEncoding_Term.Caption uu____514 in
                     [uu____513] in
                   FStar_List.append theory' uu____511 in
                 (uu____509, true))))
let filter_facts_without_core:
  FStar_SMTEncoding_Term.decls_t ->
    (FStar_SMTEncoding_Term.decls_t* Prims.bool)
  = fun x  -> let uu____523 = filter_using_facts_from x in (uu____523, false)
=======
                                if
                                  FStar_Util.starts_with
                                    a.FStar_SMTEncoding_Term.assumption_name
                                    "@"
                                then ((d :: theory1), n_retained, n_pruned)
                                else
                                  (theory1, n_retained,
                                    (n_pruned + (Prims.parse_int "1")))
                          | uu____463 ->
                              ((d :: theory1), n_retained, n_pruned))) theory
                ([], (Prims.parse_int "0"), (Prims.parse_int "0")) in
            (match uu____421 with
             | (theory',n_retained,n_pruned) ->
                 let missed_assertions th core2 =
                   let missed =
                     let uu____486 =
                       FStar_All.pipe_right core2
                         (FStar_List.filter
                            (fun nm  ->
                               let uu____491 =
                                 FStar_All.pipe_right th
                                   (FStar_Util.for_some
                                      (fun uu___86_493  ->
                                         match uu___86_493 with
                                         | FStar_SMTEncoding_Term.Assume a ->
                                             nm =
                                               a.FStar_SMTEncoding_Term.assumption_name
                                         | uu____495 -> false)) in
                               FStar_All.pipe_right uu____491
                                 Prims.op_Negation)) in
                     FStar_All.pipe_right uu____486
                       (FStar_String.concat ", ") in
                   let included =
                     let uu____498 =
                       FStar_All.pipe_right th
                         (FStar_List.collect
                            (fun uu___87_502  ->
                               match uu___87_502 with
                               | FStar_SMTEncoding_Term.Assume a ->
                                   [a.FStar_SMTEncoding_Term.assumption_name]
                               | uu____505 -> [])) in
                     FStar_All.pipe_right uu____498
                       (FStar_String.concat ", ") in
                   FStar_Util.format2 "missed={%s}; included={%s}" missed
                     included in
                 ((let uu____508 =
                     (FStar_Options.hint_info ()) &&
                       (FStar_Options.debug_any ()) in
                   if uu____508
                   then
                     let n1 = FStar_List.length core1 in
                     let missed =
                       if n1 <> n_retained
                       then missed_assertions theory' core1
                       else "" in
                     let uu____518 = FStar_Util.string_of_int n_retained in
                     let uu____519 =
                       if n1 <> n_retained
                       then
                         let uu____524 = FStar_Util.string_of_int n1 in
                         FStar_Util.format2
                           " (expected %s (%s); replay may be inaccurate)"
                           uu____524 missed
                       else "" in
                     let uu____532 = FStar_Util.string_of_int n_pruned in
                     FStar_Util.print3
                       "\tHint-info: Retained %s assertions%s and pruned %s assertions using recorded unsat core\n"
                       uu____518 uu____519 uu____532
                   else ());
                  (let uu____534 =
                     let uu____536 =
                       let uu____538 =
                         let uu____539 =
                           let uu____540 =
                             FStar_All.pipe_right core1
                               (FStar_String.concat ", ") in
                           Prims.strcat "UNSAT CORE: " uu____540 in
                         FStar_SMTEncoding_Term.Caption uu____539 in
                       [uu____538] in
                     FStar_List.append theory' uu____536 in
                   (uu____534, true))))
let filter_facts_without_core:
  FStar_TypeChecker_Env.env ->
    FStar_SMTEncoding_Term.decls_t ->
      (FStar_SMTEncoding_Term.decl Prims.list* Prims.bool)
  =
  fun e  ->
    fun x  ->
      let uu____554 = filter_using_facts_from e x in (uu____554, false)
>>>>>>> origin/guido_tactics
let ask_and_report_errors:
  FStar_TypeChecker_Env.env ->
    FStar_SMTEncoding_Term.error_labels ->
      FStar_SMTEncoding_Term.decl Prims.list ->
        FStar_SMTEncoding_Term.decl ->
          FStar_SMTEncoding_Term.decl Prims.list -> Prims.unit
  =
  fun env  ->
    fun all_labels  ->
      fun prefix1  ->
        fun query  ->
          fun suffix  ->
            FStar_SMTEncoding_Z3.giveZ3 prefix1;
<<<<<<< HEAD
            (let uu____544 =
               match env.FStar_TypeChecker_Env.qname_and_index with
               | None  -> failwith "No query name set!"
               | Some (q,n1) -> ((FStar_Ident.text_of_lid q), n1) in
             match uu____544 with
             | (query_name,query_index) ->
                 let minimum_workable_fuel = FStar_Util.mk_ref None in
                 let set_minimum_workable_fuel f uu___88_600 =
                   match uu___88_600 with
                   | ([],uu____607) -> ()
                   | errs ->
                       let uu____613 = FStar_ST.read minimum_workable_fuel in
                       (match uu____613 with
                        | Some uu____634 -> ()
                        | None  ->
                            FStar_ST.write minimum_workable_fuel
                              (Some (f, errs))) in
                 let with_fuel label_assumptions p uu____698 =
                   match uu____698 with
                   | (n1,i,rlimit) ->
                       let uu____707 =
                         let uu____709 =
                           let uu____710 =
                             let uu____711 = FStar_Util.string_of_int n1 in
                             let uu____712 = FStar_Util.string_of_int i in
                             FStar_Util.format2 "<fuel='%s' ifuel='%s'>"
                               uu____711 uu____712 in
                           FStar_SMTEncoding_Term.Caption uu____710 in
                         let uu____713 =
                           let uu____715 =
                             let uu____716 =
                               let uu____720 =
                                 let uu____721 =
                                   let uu____724 =
                                     FStar_SMTEncoding_Util.mkApp
                                       ("MaxFuel", []) in
                                   let uu____726 =
                                     FStar_SMTEncoding_Term.n_fuel n1 in
                                   (uu____724, uu____726) in
                                 FStar_SMTEncoding_Util.mkEq uu____721 in
                               (uu____720, None, "@MaxFuel_assumption") in
                             FStar_SMTEncoding_Util.mkAssume uu____716 in
                           let uu____728 =
                             let uu____730 =
                               let uu____731 =
                                 let uu____735 =
                                   let uu____736 =
                                     let uu____739 =
                                       FStar_SMTEncoding_Util.mkApp
                                         ("MaxIFuel", []) in
                                     let uu____741 =
                                       FStar_SMTEncoding_Term.n_fuel i in
                                     (uu____739, uu____741) in
                                   FStar_SMTEncoding_Util.mkEq uu____736 in
                                 (uu____735, None, "@MaxIFuel_assumption") in
                               FStar_SMTEncoding_Util.mkAssume uu____731 in
                             [uu____730; p] in
                           uu____715 :: uu____728 in
                         uu____709 :: uu____713 in
                       let uu____743 =
                         let uu____745 =
                           let uu____747 =
                             let uu____749 =
                               let uu____750 =
                                 let uu____753 =
                                   FStar_Util.string_of_int rlimit in
                                 ("rlimit", uu____753) in
                               FStar_SMTEncoding_Term.SetOption uu____750 in
                             [uu____749] in
                           let uu____754 =
                             let uu____756 =
                               let uu____758 =
                                 let uu____760 =
                                   FStar_Options.record_hints () in
                                 if uu____760
                                 then [FStar_SMTEncoding_Term.GetUnsatCore]
                                 else [] in
                               let uu____763 =
                                 let uu____765 =
                                   let uu____767 =
                                     (FStar_Options.print_z3_statistics ())
                                       || (FStar_Options.check_hints ()) in
                                   if uu____767
                                   then
                                     [FStar_SMTEncoding_Term.GetStatistics]
                                   else [] in
                                 let uu____770 =
                                   let uu____772 =
                                     let uu____774 =
                                       FStar_Options.check_hints () in
                                     if uu____774
                                     then
                                       [FStar_SMTEncoding_Term.GetReasonUnknown]
                                     else [] in
                                   FStar_List.append uu____772 suffix in
                                 FStar_List.append uu____765 uu____770 in
                               FStar_List.append uu____758 uu____763 in
                             FStar_List.append
                               [FStar_SMTEncoding_Term.CheckSat] uu____756 in
                           FStar_List.append uu____747 uu____754 in
                         FStar_List.append label_assumptions uu____745 in
                       FStar_List.append uu____707 uu____743 in
                 let check p =
                   let rlimit =
                     let uu____782 = FStar_Options.z3_rlimit_factor () in
                     let uu____783 =
                       let uu____784 = FStar_Options.z3_rlimit () in
                       uu____784 * (Prims.parse_int "544656") in
                     uu____782 * uu____783 in
                   let default_initial_config =
                     let uu____789 = FStar_Options.initial_fuel () in
                     let uu____790 = FStar_Options.initial_ifuel () in
                     (uu____789, uu____790, rlimit) in
                   let hint_opt = next_hint query_name query_index in
                   let uu____793 =
                     match hint_opt with
                     | None  -> (None, default_initial_config)
                     | Some hint ->
                         let uu____815 =
=======
            (let uu____582 =
               match env.FStar_TypeChecker_Env.qname_and_index with
               | None  -> failwith "No query name set!"
               | Some (q,n1) -> ((FStar_Ident.text_of_lid q), n1) in
             match uu____582 with
             | (query_name,query_index) ->
                 let minimum_workable_fuel = FStar_Util.mk_ref None in
                 let set_minimum_workable_fuel f uu___88_638 =
                   match uu___88_638 with
                   | ([],uu____645) -> ()
                   | errs ->
                       let uu____651 = FStar_ST.read minimum_workable_fuel in
                       (match uu____651 with
                        | Some uu____672 -> ()
                        | None  ->
                            FStar_ST.write minimum_workable_fuel
                              (Some (f, errs))) in
                 let with_fuel label_assumptions p uu____736 =
                   match uu____736 with
                   | (n1,i,rlimit) ->
                       let uu____745 =
                         let uu____747 =
                           let uu____748 =
                             let uu____749 = FStar_Util.string_of_int n1 in
                             let uu____750 = FStar_Util.string_of_int i in
                             FStar_Util.format2 "<fuel='%s' ifuel='%s'>"
                               uu____749 uu____750 in
                           FStar_SMTEncoding_Term.Caption uu____748 in
                         let uu____751 =
                           let uu____753 =
                             let uu____754 =
                               let uu____758 =
                                 let uu____759 =
                                   let uu____762 =
                                     FStar_SMTEncoding_Util.mkApp
                                       ("MaxFuel", []) in
                                   let uu____764 =
                                     FStar_SMTEncoding_Term.n_fuel n1 in
                                   (uu____762, uu____764) in
                                 FStar_SMTEncoding_Util.mkEq uu____759 in
                               (uu____758, None, "@MaxFuel_assumption") in
                             FStar_SMTEncoding_Util.mkAssume uu____754 in
                           let uu____766 =
                             let uu____768 =
                               let uu____769 =
                                 let uu____773 =
                                   let uu____774 =
                                     let uu____777 =
                                       FStar_SMTEncoding_Util.mkApp
                                         ("MaxIFuel", []) in
                                     let uu____779 =
                                       FStar_SMTEncoding_Term.n_fuel i in
                                     (uu____777, uu____779) in
                                   FStar_SMTEncoding_Util.mkEq uu____774 in
                                 (uu____773, None, "@MaxIFuel_assumption") in
                               FStar_SMTEncoding_Util.mkAssume uu____769 in
                             [uu____768; p] in
                           uu____753 :: uu____766 in
                         uu____747 :: uu____751 in
                       let uu____781 =
                         let uu____783 =
                           let uu____785 =
                             let uu____787 =
                               let uu____788 =
                                 let uu____791 =
                                   FStar_Util.string_of_int rlimit in
                                 ("rlimit", uu____791) in
                               FStar_SMTEncoding_Term.SetOption uu____788 in
                             [uu____787] in
                           let uu____792 =
                             let uu____794 =
                               let uu____796 =
                                 let uu____798 =
                                   FStar_Options.record_hints () in
                                 if uu____798
                                 then [FStar_SMTEncoding_Term.GetUnsatCore]
                                 else [] in
                               let uu____801 =
                                 let uu____803 =
                                   let uu____805 =
                                     (FStar_Options.print_z3_statistics ())
                                       || (FStar_Options.check_hints ()) in
                                   if uu____805
                                   then
                                     [FStar_SMTEncoding_Term.GetStatistics]
                                   else [] in
                                 let uu____808 =
                                   let uu____810 =
                                     let uu____812 =
                                       FStar_Options.check_hints () in
                                     if uu____812
                                     then
                                       [FStar_SMTEncoding_Term.GetReasonUnknown]
                                     else [] in
                                   FStar_List.append uu____810 suffix in
                                 FStar_List.append uu____803 uu____808 in
                               FStar_List.append uu____796 uu____801 in
                             FStar_List.append
                               [FStar_SMTEncoding_Term.CheckSat] uu____794 in
                           FStar_List.append uu____785 uu____792 in
                         FStar_List.append label_assumptions uu____783 in
                       FStar_List.append uu____745 uu____781 in
                 let check p =
                   let rlimit =
                     let uu____820 = FStar_Options.z3_rlimit_factor () in
                     let uu____821 =
                       let uu____822 = FStar_Options.z3_rlimit () in
                       uu____822 * (Prims.parse_int "544656") in
                     uu____820 * uu____821 in
                   let default_initial_config =
                     let uu____827 = FStar_Options.initial_fuel () in
                     let uu____828 = FStar_Options.initial_ifuel () in
                     (uu____827, uu____828, rlimit) in
                   let hint_opt = next_hint query_name query_index in
                   let uu____831 =
                     match hint_opt with
                     | None  -> (None, default_initial_config)
                     | Some hint ->
                         let uu____853 =
>>>>>>> origin/guido_tactics
                           if FStar_Option.isSome hint.FStar_Util.unsat_core
                           then ((hint.FStar_Util.unsat_core), rlimit)
                           else
                             (None,
                               ((Prims.parse_int "60") *
                                  (Prims.parse_int "544656"))) in
<<<<<<< HEAD
                         (match uu____815 with
=======
                         (match uu____853 with
>>>>>>> origin/guido_tactics
                          | (core,timeout) ->
                              (core,
                                ((hint.FStar_Util.fuel),
                                  (hint.FStar_Util.ifuel), timeout))) in
<<<<<<< HEAD
                   match uu____793 with
                   | (unsat_core,initial_config) ->
                       let alt_configs =
                         let uu____866 =
                           let uu____872 =
                             let uu____878 =
                               let uu____883 =
                                 let uu____884 = FStar_Options.max_ifuel () in
                                 let uu____885 =
                                   FStar_Options.initial_ifuel () in
                                 uu____884 > uu____885 in
                               if uu____883
                               then
                                 let uu____890 =
                                   let uu____894 =
                                     FStar_Options.initial_fuel () in
                                   let uu____895 = FStar_Options.max_ifuel () in
                                   (uu____894, uu____895, rlimit) in
                                 [uu____890]
                               else [] in
                             let uu____906 =
                               let uu____912 =
                                 let uu____917 =
                                   let uu____918 =
                                     let uu____919 =
                                       FStar_Options.max_fuel () in
                                     uu____919 / (Prims.parse_int "2") in
                                   let uu____923 =
                                     FStar_Options.initial_fuel () in
                                   uu____918 > uu____923 in
                                 if uu____917
                                 then
                                   let uu____928 =
                                     let uu____932 =
                                       let uu____933 =
                                         FStar_Options.max_fuel () in
                                       uu____933 / (Prims.parse_int "2") in
                                     let uu____937 =
                                       FStar_Options.max_ifuel () in
                                     (uu____932, uu____937, rlimit) in
                                   [uu____928]
                                 else [] in
                               let uu____948 =
                                 let uu____954 =
                                   let uu____959 =
                                     (let uu____964 =
                                        FStar_Options.max_fuel () in
                                      let uu____965 =
                                        FStar_Options.initial_fuel () in
                                      uu____964 > uu____965) &&
                                       (let uu____968 =
                                          FStar_Options.max_ifuel () in
                                        let uu____969 =
                                          FStar_Options.initial_ifuel () in
                                        uu____968 >= uu____969) in
                                   if uu____959
                                   then
                                     let uu____974 =
                                       let uu____978 =
                                         FStar_Options.max_fuel () in
                                       let uu____979 =
                                         FStar_Options.max_ifuel () in
                                       (uu____978, uu____979, rlimit) in
                                     [uu____974]
                                   else [] in
                                 let uu____990 =
                                   let uu____996 =
                                     let uu____1001 =
                                       let uu____1002 =
                                         FStar_Options.min_fuel () in
                                       let uu____1003 =
                                         FStar_Options.initial_fuel () in
                                       uu____1002 < uu____1003 in
                                     if uu____1001
                                     then
                                       let uu____1008 =
                                         let uu____1012 =
                                           FStar_Options.min_fuel () in
                                         (uu____1012, (Prims.parse_int "1"),
                                           rlimit) in
                                       [uu____1008]
                                     else [] in
                                   [uu____996] in
                                 uu____954 :: uu____990 in
                               uu____912 :: uu____948 in
                             uu____878 :: uu____906 in
=======
                   match uu____831 with
                   | (unsat_core,initial_config) ->
                       let alt_configs =
                         let uu____904 =
                           let uu____910 =
                             let uu____916 =
                               let uu____921 =
                                 let uu____922 = FStar_Options.max_ifuel () in
                                 let uu____923 =
                                   FStar_Options.initial_ifuel () in
                                 uu____922 > uu____923 in
                               if uu____921
                               then
                                 let uu____928 =
                                   let uu____932 =
                                     FStar_Options.initial_fuel () in
                                   let uu____933 = FStar_Options.max_ifuel () in
                                   (uu____932, uu____933, rlimit) in
                                 [uu____928]
                               else [] in
                             let uu____944 =
                               let uu____950 =
                                 let uu____955 =
                                   let uu____956 =
                                     let uu____957 =
                                       FStar_Options.max_fuel () in
                                     uu____957 / (Prims.parse_int "2") in
                                   let uu____964 =
                                     FStar_Options.initial_fuel () in
                                   uu____956 > uu____964 in
                                 if uu____955
                                 then
                                   let uu____969 =
                                     let uu____973 =
                                       let uu____974 =
                                         FStar_Options.max_fuel () in
                                       uu____974 / (Prims.parse_int "2") in
                                     let uu____981 =
                                       FStar_Options.max_ifuel () in
                                     (uu____973, uu____981, rlimit) in
                                   [uu____969]
                                 else [] in
                               let uu____992 =
                                 let uu____998 =
                                   let uu____1003 =
                                     (let uu____1004 =
                                        FStar_Options.max_fuel () in
                                      let uu____1005 =
                                        FStar_Options.initial_fuel () in
                                      uu____1004 > uu____1005) &&
                                       (let uu____1006 =
                                          FStar_Options.max_ifuel () in
                                        let uu____1007 =
                                          FStar_Options.initial_ifuel () in
                                        uu____1006 >= uu____1007) in
                                   if uu____1003
                                   then
                                     let uu____1012 =
                                       let uu____1016 =
                                         FStar_Options.max_fuel () in
                                       let uu____1017 =
                                         FStar_Options.max_ifuel () in
                                       (uu____1016, uu____1017, rlimit) in
                                     [uu____1012]
                                   else [] in
                                 let uu____1028 =
                                   let uu____1034 =
                                     let uu____1039 =
                                       let uu____1040 =
                                         FStar_Options.min_fuel () in
                                       let uu____1041 =
                                         FStar_Options.initial_fuel () in
                                       uu____1040 < uu____1041 in
                                     if uu____1039
                                     then
                                       let uu____1046 =
                                         let uu____1050 =
                                           FStar_Options.min_fuel () in
                                         (uu____1050, (Prims.parse_int "1"),
                                           rlimit) in
                                       [uu____1046]
                                     else [] in
                                   [uu____1034] in
                                 uu____998 :: uu____1028 in
                               uu____950 :: uu____992 in
                             uu____916 :: uu____944 in
>>>>>>> origin/guido_tactics
                           (if
                              (default_initial_config <> initial_config) ||
                                (FStar_Option.isSome unsat_core)
                            then [default_initial_config]
<<<<<<< HEAD
                            else []) :: uu____872 in
                         FStar_List.flatten uu____866 in
                       let report1 p1 errs =
                         let errs1 =
                           let uu____1076 =
                             (FStar_Options.detail_errors ()) &&
                               (let uu____1078 = FStar_Options.n_cores () in
                                uu____1078 = (Prims.parse_int "1")) in
                           if uu____1076
                           then
                             let uu____1079 =
                               let uu____1088 =
                                 FStar_ST.read minimum_workable_fuel in
                               match uu____1088 with
                               | Some (f,errs1) -> (f, errs1)
                               | None  ->
                                   let uu____1153 =
                                     let uu____1157 =
                                       FStar_Options.min_fuel () in
                                     (uu____1157, (Prims.parse_int "1"),
                                       rlimit) in
                                   (uu____1153, errs) in
                             match uu____1079 with
                             | (min_fuel1,potential_errors) ->
                                 let ask_z3 label_assumptions =
                                   let res = FStar_Util.mk_ref None in
                                   (let uu____1187 =
                                      with_fuel label_assumptions p1
                                        min_fuel1 in
                                    FStar_SMTEncoding_Z3.ask
                                      filter_facts_without_core all_labels
                                      uu____1187 None
                                      (fun r  -> FStar_ST.write res (Some r)));
                                   (let uu____1194 = FStar_ST.read res in
                                    FStar_Option.get uu____1194) in
                                 let uu____1199 =
                                   FStar_SMTEncoding_ErrorReporting.detail_errors
                                     env all_labels ask_z3 in
                                 (uu____1199, FStar_SMTEncoding_Z3.Default)
=======
                            else []) :: uu____910 in
                         FStar_List.flatten uu____904 in
                       let report1 p1 errs =
                         let errs1 =
                           let uu____1114 =
                             (FStar_Options.detail_errors ()) &&
                               (let uu____1115 = FStar_Options.n_cores () in
                                uu____1115 = (Prims.parse_int "1")) in
                           if uu____1114
                           then
                             let uu____1116 =
                               let uu____1125 =
                                 FStar_ST.read minimum_workable_fuel in
                               match uu____1125 with
                               | Some (f,errs1) -> (f, errs1)
                               | None  ->
                                   let uu____1190 =
                                     let uu____1194 =
                                       FStar_Options.min_fuel () in
                                     (uu____1194, (Prims.parse_int "1"),
                                       rlimit) in
                                   (uu____1190, errs) in
                             match uu____1116 with
                             | (min_fuel1,potential_errors) ->
                                 let ask_z3 label_assumptions =
                                   let res = FStar_Util.mk_ref None in
                                   (let uu____1224 =
                                      with_fuel label_assumptions p1
                                        min_fuel1 in
                                    FStar_SMTEncoding_Z3.ask
                                      (filter_facts_without_core env)
                                      all_labels uu____1224 None
                                      (fun r  -> FStar_ST.write res (Some r)));
                                   (let uu____1230 = FStar_ST.read res in
                                    FStar_Option.get uu____1230) in
                                 let uu____1235 =
                                   FStar_SMTEncoding_ErrorReporting.detail_errors
                                     env all_labels ask_z3 in
                                 (uu____1235, FStar_SMTEncoding_Z3.Default)
>>>>>>> origin/guido_tactics
                           else
                             (match errs with
                              | ([],FStar_SMTEncoding_Z3.Timeout ) ->
                                  ([(("", FStar_SMTEncoding_Term.Term_sort),
                                      "Timeout: Unknown assertion failed",
                                      FStar_Range.dummyRange)], (snd errs))
                              | ([],FStar_SMTEncoding_Z3.Default ) ->
                                  ([(("", FStar_SMTEncoding_Term.Term_sort),
                                      "Unknown assertion failed",
                                      FStar_Range.dummyRange)], (snd errs))
<<<<<<< HEAD
                              | (uu____1239,FStar_SMTEncoding_Z3.Kill ) ->
                                  ([(("", FStar_SMTEncoding_Term.Term_sort),
                                      "Killed: Unknown assertion failed",
                                      FStar_Range.dummyRange)], (snd errs))
                              | uu____1258 -> errs) in
                         record_hint None;
                         (let uu____1261 = FStar_Options.print_fuels () in
                          if uu____1261
                          then
                            let uu____1262 =
                              let uu____1263 =
                                FStar_TypeChecker_Env.get_range env in
                              FStar_Range.string_of_range uu____1263 in
                            let uu____1264 =
                              let uu____1265 = FStar_Options.max_fuel () in
                              FStar_All.pipe_right uu____1265
                                FStar_Util.string_of_int in
                            let uu____1266 =
                              let uu____1267 = FStar_Options.max_ifuel () in
                              FStar_All.pipe_right uu____1267
                                FStar_Util.string_of_int in
                            FStar_Util.print3
                              "(%s) Query failed with maximum fuel %s and ifuel %s\n"
                              uu____1262 uu____1264 uu____1266
                          else ());
                         (let uu____1269 =
                            FStar_All.pipe_right (fst errs1)
                              (FStar_List.map
                                 (fun uu____1285  ->
                                    match uu____1285 with
                                    | (uu____1291,x,y) -> (x, y))) in
                          FStar_TypeChecker_Err.add_errors env uu____1269) in
                       let use_errors errs result =
                         match (errs, result) with
                         | (([],uu____1307),uu____1308) -> result
                         | (uu____1313,FStar_Util.Inl uu____1314) -> result
                         | (uu____1321,FStar_Util.Inr uu____1322) ->
=======
                              | (uu____1275,FStar_SMTEncoding_Z3.Kill ) ->
                                  ([(("", FStar_SMTEncoding_Term.Term_sort),
                                      "Killed: Unknown assertion failed",
                                      FStar_Range.dummyRange)], (snd errs))
                              | uu____1294 -> errs) in
                         record_hint None;
                         (let uu____1297 = FStar_Options.print_fuels () in
                          if uu____1297
                          then
                            let uu____1298 =
                              let uu____1299 =
                                FStar_TypeChecker_Env.get_range env in
                              FStar_Range.string_of_range uu____1299 in
                            let uu____1300 =
                              let uu____1301 = FStar_Options.max_fuel () in
                              FStar_All.pipe_right uu____1301
                                FStar_Util.string_of_int in
                            let uu____1302 =
                              let uu____1303 = FStar_Options.max_ifuel () in
                              FStar_All.pipe_right uu____1303
                                FStar_Util.string_of_int in
                            FStar_Util.print3
                              "(%s) Query failed with maximum fuel %s and ifuel %s\n"
                              uu____1298 uu____1300 uu____1302
                          else ());
                         (let uu____1305 =
                            FStar_All.pipe_right (fst errs1)
                              (FStar_List.map
                                 (fun uu____1317  ->
                                    match uu____1317 with
                                    | (uu____1323,x,y) -> (x, y))) in
                          FStar_TypeChecker_Err.add_errors env uu____1305) in
                       let use_errors errs result =
                         match (errs, result) with
                         | (([],uu____1339),uu____1340) -> result
                         | (uu____1345,FStar_Util.Inl uu____1346) -> result
                         | (uu____1353,FStar_Util.Inr uu____1354) ->
>>>>>>> origin/guido_tactics
                             FStar_Util.Inr errs in
                       let rec try_alt_configs prev_f p1 errs cfgs scope =
                         set_minimum_workable_fuel prev_f errs;
                         (match (cfgs, (snd errs)) with
<<<<<<< HEAD
                          | ([],uu____1389) -> report1 p1 errs
                          | (uu____1397,FStar_SMTEncoding_Z3.Kill ) ->
                              report1 p1 errs
                          | (mi::tl1,uu____1408) ->
                              let uu____1423 = with_fuel [] p1 mi in
                              FStar_SMTEncoding_Z3.ask
                                filter_facts_without_core all_labels
                                uu____1423 (Some scope)
                                (fun uu____1430  ->
                                   match uu____1430 with
                                   | (result,elapsed_time,statistics) ->
                                       let uu____1442 =
                                         let uu____1446 =
                                           use_errors errs result in
                                         (uu____1446, elapsed_time,
                                           statistics) in
                                       cb false mi p1 tl1 scope uu____1442))
                       and cb used_hint uu____1448 p1 alt scope uu____1452 =
                         match (uu____1448, uu____1452) with
=======
                          | ([],uu____1421) -> report1 p1 errs
                          | (uu____1429,FStar_SMTEncoding_Z3.Kill ) ->
                              report1 p1 errs
                          | (mi::tl1,uu____1440) ->
                              let uu____1455 = with_fuel [] p1 mi in
                              FStar_SMTEncoding_Z3.ask
                                (filter_facts_without_core env) all_labels
                                uu____1455 (Some scope)
                                (fun uu____1457  ->
                                   match uu____1457 with
                                   | (result,elapsed_time,statistics) ->
                                       let uu____1469 =
                                         let uu____1473 =
                                           use_errors errs result in
                                         (uu____1473, elapsed_time,
                                           statistics) in
                                       cb false mi p1 tl1 scope uu____1469))
                       and cb used_hint uu____1475 p1 alt scope uu____1479 =
                         match (uu____1475, uu____1479) with
>>>>>>> origin/guido_tactics
                         | ((prev_fuel,prev_ifuel,timeout),(result,elapsed_time,statistics))
                             ->
                             (if used_hint
                              then
                                (FStar_SMTEncoding_Z3.refresh ();
<<<<<<< HEAD
                                 (let uu____1483 =
                                    FStar_TypeChecker_Env.get_range env in
                                  record_hint_stat hint_opt result
                                    elapsed_time uu____1483))
                              else ();
                              (let uu____1486 =
                                 (FStar_Options.z3_refresh ()) ||
                                   (FStar_Options.check_hints ()) in
                               if uu____1486
                               then FStar_SMTEncoding_Z3.refresh ()
                               else ());
                              (let query_info env1 name tag statistics1 =
                                 let uu____1505 =
=======
                                 (let uu____1510 =
                                    FStar_TypeChecker_Env.get_range env in
                                  record_hint_stat hint_opt result
                                    elapsed_time uu____1510))
                              else ();
                              (let uu____1513 =
                                 (FStar_Options.z3_refresh ()) ||
                                   (FStar_Options.check_hints ()) in
                               if uu____1513
                               then FStar_SMTEncoding_Z3.refresh ()
                               else ());
                              (let query_info env1 name tag statistics1 =
                                 let uu____1532 =
>>>>>>> origin/guido_tactics
                                   ((FStar_Options.print_fuels ()) ||
                                      (FStar_Options.hint_info ()))
                                     ||
                                     (FStar_Options.print_z3_statistics ()) in
<<<<<<< HEAD
                                 if uu____1505
                                 then
                                   let uu____1506 =
                                     let uu____1508 =
                                       let uu____1510 =
                                         match env1 with
                                         | Some e ->
                                             let uu____1512 =
                                               let uu____1513 =
                                                 let uu____1514 =
                                                   FStar_TypeChecker_Env.get_range
                                                     e in
                                                 FStar_Range.string_of_range
                                                   uu____1514 in
                                               let uu____1515 =
                                                 let uu____1516 =
                                                   FStar_SMTEncoding_Z3.at_log_file
                                                     () in
                                                 Prims.strcat uu____1516 ")" in
                                               Prims.strcat uu____1513
                                                 uu____1515 in
                                             Prims.strcat "(" uu____1512
                                         | None  -> "" in
                                       let uu____1517 =
                                         let uu____1519 =
                                           let uu____1521 =
                                             let uu____1523 =
                                               FStar_Util.string_of_int
                                                 query_index in
                                             let uu____1524 =
                                               let uu____1526 =
                                                 let uu____1528 =
                                                   let uu____1530 =
                                                     FStar_Util.string_of_int
                                                       elapsed_time in
                                                   let uu____1531 =
                                                     let uu____1533 =
                                                       FStar_Util.string_of_int
                                                         prev_fuel in
                                                     let uu____1534 =
                                                       let uu____1536 =
                                                         FStar_Util.string_of_int
                                                           prev_ifuel in
                                                       let uu____1537 =
                                                         let uu____1539 =
                                                           FStar_Util.string_of_int
                                                             rlimit in
                                                         [uu____1539] in
                                                       uu____1536 ::
                                                         uu____1537 in
                                                     uu____1533 :: uu____1534 in
                                                   uu____1530 :: uu____1531 in
=======
                                 if uu____1532
                                 then
                                   let uu____1533 =
                                     let uu____1535 =
                                       let uu____1537 =
                                         match env1 with
                                         | Some e ->
                                             let uu____1539 =
                                               let uu____1540 =
                                                 let uu____1541 =
                                                   FStar_TypeChecker_Env.get_range
                                                     e in
                                                 FStar_Range.string_of_range
                                                   uu____1541 in
                                               let uu____1542 =
                                                 let uu____1543 =
                                                   FStar_SMTEncoding_Z3.at_log_file
                                                     () in
                                                 Prims.strcat uu____1543 ")" in
                                               Prims.strcat uu____1540
                                                 uu____1542 in
                                             Prims.strcat "(" uu____1539
                                         | None  -> "" in
                                       let uu____1544 =
                                         let uu____1546 =
                                           let uu____1548 =
                                             let uu____1550 =
                                               FStar_Util.string_of_int
                                                 query_index in
                                             let uu____1551 =
                                               let uu____1553 =
                                                 let uu____1555 =
                                                   let uu____1557 =
                                                     FStar_Util.string_of_int
                                                       elapsed_time in
                                                   let uu____1558 =
                                                     let uu____1560 =
                                                       FStar_Util.string_of_int
                                                         prev_fuel in
                                                     let uu____1561 =
                                                       let uu____1563 =
                                                         FStar_Util.string_of_int
                                                           prev_ifuel in
                                                       let uu____1564 =
                                                         let uu____1566 =
                                                           FStar_Util.string_of_int
                                                             rlimit in
                                                         [uu____1566] in
                                                       uu____1563 ::
                                                         uu____1564 in
                                                     uu____1560 :: uu____1561 in
                                                   uu____1557 :: uu____1558 in
>>>>>>> origin/guido_tactics
                                                 (match env1 with
                                                  | Some e ->
                                                      if used_hint
                                                      then " (with hint)"
                                                      else ""
                                                  | None  -> "") ::
<<<<<<< HEAD
                                                   uu____1528 in
                                               tag :: uu____1526 in
                                             uu____1523 :: uu____1524 in
                                           query_name :: uu____1521 in
                                         name :: uu____1519 in
                                       uu____1510 :: uu____1517 in
                                     let uu____1543 =
                                       let uu____1545 =
                                         let uu____1546 =
                                           FStar_Options.print_z3_statistics
                                             () in
                                         if uu____1546
=======
                                                   uu____1555 in
                                               tag :: uu____1553 in
                                             uu____1550 :: uu____1551 in
                                           query_name :: uu____1548 in
                                         name :: uu____1546 in
                                       uu____1537 :: uu____1544 in
                                     let uu____1569 =
                                       let uu____1571 =
                                         let uu____1572 =
                                           FStar_Options.print_z3_statistics
                                             () in
                                         if uu____1572
>>>>>>> origin/guido_tactics
                                         then
                                           let f k v1 a =
                                             Prims.strcat a
                                               (Prims.strcat k
                                                  (Prims.strcat "="
                                                     (Prims.strcat v1 " "))) in
                                           let str =
                                             FStar_Util.smap_fold statistics1
                                               f "statistics={" in
<<<<<<< HEAD
                                           let uu____1558 =
=======
                                           let uu____1584 =
>>>>>>> origin/guido_tactics
                                             FStar_Util.substring str
                                               (Prims.parse_int "0")
                                               ((FStar_String.length str) -
                                                  (Prims.parse_int "1")) in
<<<<<<< HEAD
                                           Prims.strcat uu____1558 "}"
                                         else
                                           (let uu____1563 =
                                              FStar_Util.smap_try_find
                                                statistics1 "reason-unknown" in
                                            match uu____1563 with
=======
                                           Prims.strcat uu____1584 "}"
                                         else
                                           (let uu____1592 =
                                              FStar_Util.smap_try_find
                                                statistics1 "reason-unknown" in
                                            match uu____1592 with
>>>>>>> origin/guido_tactics
                                            | Some v1 ->
                                                Prims.strcat
                                                  "(reason-unknown="
                                                  (Prims.strcat v1 ")")
<<<<<<< HEAD
                                            | uu____1566 -> "") in
                                       [uu____1545] in
                                     FStar_List.append uu____1508 uu____1543 in
                                   FStar_Util.print
                                     "%s\t%s (%s, %s)\t%s%s in %s milliseconds with fuel %s and ifuel %s and rlimit %s %s\n"
                                     uu____1506
=======
                                            | uu____1595 -> "") in
                                       [uu____1571] in
                                     FStar_List.append uu____1535 uu____1569 in
                                   FStar_Util.print
                                     "%s\t%s (%s, %s)\t%s%s in %s milliseconds with fuel %s and ifuel %s and rlimit %s %s\n"
                                     uu____1533
>>>>>>> origin/guido_tactics
                                 else () in
                               let refine_hint unsat_core1 scope1 =
                                 let current_core =
                                   FStar_Util.mk_ref unsat_core1 in
                                 let hint_worked = FStar_Util.mk_ref false in
                                 let rec refine_hint core_ext_max_dist =
<<<<<<< HEAD
                                   let uu____1586 =
                                     let uu____1587 =
                                       FStar_ST.read hint_worked in
                                     Prims.op_Negation uu____1587 in
                                   if uu____1586
                                   then
                                     let hint_check_cb uu____1601 =
                                       match uu____1601 with
=======
                                   let uu____1615 =
                                     let uu____1616 =
                                       FStar_ST.read hint_worked in
                                     Prims.op_Negation uu____1616 in
                                   if uu____1615
                                   then
                                     let hint_check_cb uu____1630 =
                                       match uu____1630 with
>>>>>>> origin/guido_tactics
                                       | (result1,elapsed_time1,statistics1)
                                           ->
                                           let tag =
                                             match result1 with
<<<<<<< HEAD
                                             | FStar_Util.Inl uu____1624 ->
                                                 (FStar_ST.write hint_worked
                                                    true;
                                                  "succeeded")
                                             | FStar_Util.Inr uu____1630 ->
                                                 "failed" in
                                           let uu____1635 =
                                             FStar_Options.hint_info () in
                                           if uu____1635
=======
                                             | FStar_Util.Inl uu____1653 ->
                                                 (FStar_ST.write hint_worked
                                                    true;
                                                  "succeeded")
                                             | FStar_Util.Inr uu____1659 ->
                                                 "failed" in
                                           let uu____1664 =
                                             FStar_Options.hint_info () in
                                           if uu____1664
>>>>>>> origin/guido_tactics
                                           then
                                             query_info None "Hint-check" tag
                                               statistics1
                                           else () in
                                     (FStar_SMTEncoding_Z3.refresh ();
<<<<<<< HEAD
                                      (let uu____1639 =
                                         let uu____1644 =
                                           FStar_ST.read current_core in
                                         filter_assertions uu____1644 in
                                       let uu____1647 =
                                         with_fuel [] p1
                                           (prev_fuel, prev_ifuel, rlimit) in
                                       FStar_SMTEncoding_Z3.ask uu____1639
                                         all_labels uu____1647 (Some scope1)
                                         hint_check_cb);
                                      (let uu____1649 =
                                         let uu____1650 =
                                           FStar_ST.read hint_worked in
                                         Prims.op_Negation uu____1650 in
                                       if uu____1649
                                       then
                                         let refinement_ok =
                                           FStar_Util.mk_ref false in
                                         ((let uu____1657 =
                                             let uu____1658 =
                                               let uu____1660 =
                                                 let uu____1662 =
                                                   let uu____1663 =
                                                     let uu____1664 =
                                                       let uu____1666 =
                                                         FStar_Util.string_of_int
                                                           core_ext_max_dist in
                                                       [uu____1666] in
                                                     FStar_Util.format
                                                       "smt.core.extend_patterns.max_distance=%s"
                                                       uu____1664 in
                                                   FStar_Options.String
                                                     uu____1663 in
                                                 [uu____1662] in
                                               (FStar_Options.String
                                                  "smt.core.extend_patterns=true")
                                                 :: uu____1660 in
                                             FStar_Options.List uu____1658 in
                                           FStar_Options.set_option
                                             "z3cliopt" uu____1657);
                                          (let hint_refinement_cb uu____1678
                                             =
                                             match uu____1678 with
                                             | (result1,elapsed_time1,statistics1)
                                                 ->
                                                 let uu____1700 =
                                                   FStar_Options.hint_info () in
                                                 if uu____1700
=======
                                      (let uu____1668 =
                                         let uu____1673 =
                                           FStar_ST.read current_core in
                                         filter_assertions env uu____1673 in
                                       let uu____1676 =
                                         with_fuel [] p1
                                           (prev_fuel, prev_ifuel, rlimit) in
                                       FStar_SMTEncoding_Z3.ask uu____1668
                                         all_labels uu____1676 (Some scope1)
                                         hint_check_cb);
                                      (let uu____1678 =
                                         let uu____1679 =
                                           FStar_ST.read hint_worked in
                                         Prims.op_Negation uu____1679 in
                                       if uu____1678
                                       then
                                         let refinement_ok =
                                           FStar_Util.mk_ref false in
                                         ((let uu____1686 =
                                             let uu____1687 =
                                               let uu____1689 =
                                                 let uu____1691 =
                                                   let uu____1692 =
                                                     let uu____1693 =
                                                       let uu____1695 =
                                                         FStar_Util.string_of_int
                                                           core_ext_max_dist in
                                                       [uu____1695] in
                                                     FStar_Util.format
                                                       "smt.core.extend_patterns.max_distance=%s"
                                                       uu____1693 in
                                                   FStar_Options.String
                                                     uu____1692 in
                                                 [uu____1691] in
                                               (FStar_Options.String
                                                  "smt.core.extend_patterns=true")
                                                 :: uu____1689 in
                                             FStar_Options.List uu____1687 in
                                           FStar_Options.set_option
                                             "z3cliopt" uu____1686);
                                          (let hint_refinement_cb uu____1707
                                             =
                                             match uu____1707 with
                                             | (result1,elapsed_time1,statistics1)
                                                 ->
                                                 let uu____1729 =
                                                   FStar_Options.hint_info () in
                                                 if uu____1729
>>>>>>> origin/guido_tactics
                                                 then
                                                   let tag =
                                                     match result1 with
                                                     | FStar_Util.Inl uc ->
                                                         (FStar_ST.write
                                                            refinement_ok
                                                            true;
                                                          FStar_ST.write
                                                            current_core uc;
<<<<<<< HEAD
                                                          (let uu____1711 =
=======
                                                          (let uu____1740 =
>>>>>>> origin/guido_tactics
                                                             FStar_Util.string_of_int
                                                               core_ext_max_dist in
                                                           FStar_Util.format1
                                                             "succeeded (with smt.core.extend_patterns.max_distance=%s)"
<<<<<<< HEAD
                                                             uu____1711))
=======
                                                             uu____1740))
>>>>>>> origin/guido_tactics
                                                     | FStar_Util.Inr errs ->
                                                         "failed" in
                                                   query_info None
                                                     "Hint-refinement" tag
                                                     statistics1
                                                 else () in
                                           FStar_SMTEncoding_Z3.refresh ();
<<<<<<< HEAD
                                           (let uu____1720 =
=======
                                           (let uu____1749 =
>>>>>>> origin/guido_tactics
                                              with_fuel [] p1
                                                (prev_fuel, prev_ifuel,
                                                  rlimit) in
                                            FStar_SMTEncoding_Z3.ask
<<<<<<< HEAD
                                              filter_facts_without_core
                                              all_labels uu____1720
                                              (Some scope1)
                                              hint_refinement_cb);
                                           (let uu____1722 =
                                              FStar_ST.read refinement_ok in
                                            if uu____1722
=======
                                              (filter_facts_without_core env)
                                              all_labels uu____1749
                                              (Some scope1)
                                              hint_refinement_cb);
                                           (let uu____1751 =
                                              FStar_ST.read refinement_ok in
                                            if uu____1751
>>>>>>> origin/guido_tactics
                                            then
                                              let cutoff =
                                                Prims.parse_int "10" in
                                              (if core_ext_max_dist >= cutoff
                                               then
<<<<<<< HEAD
                                                 ((let uu____1727 =
                                                     let uu____1729 =
                                                       FStar_Util.string_of_int
                                                         cutoff in
                                                     [uu____1729] in
                                                   FStar_Util.print
                                                     "\tHint-fallback smt.core.extend_patterns.max_distance=%s reached, aborting refinement."
                                                     uu____1727);
=======
                                                 ((let uu____1756 =
                                                     let uu____1758 =
                                                       FStar_Util.string_of_int
                                                         cutoff in
                                                     [uu____1758] in
                                                   FStar_Util.print
                                                     "\tHint-fallback smt.core.extend_patterns.max_distance=%s reached, aborting refinement."
                                                     uu____1756);
>>>>>>> origin/guido_tactics
                                                  FStar_ST.write current_core
                                                    None)
                                               else
                                                 refine_hint
                                                   (core_ext_max_dist +
                                                      (Prims.parse_int "1")))
                                            else ())))
                                       else ()))
                                   else () in
                                 (let z3cliopts_before =
                                    FStar_Options.z3_cliopt () in
                                  let log_queries_before =
                                    FStar_Options.log_queries () in
                                  FStar_Options.set_option "log_queries"
                                    (FStar_Options.Bool false);
                                  refine_hint (Prims.parse_int "1");
<<<<<<< HEAD
                                  (let uu____1744 =
                                     let uu____1745 =
                                       FStar_List.map
                                         (fun x  -> FStar_Options.String x)
                                         z3cliopts_before in
                                     FStar_Options.List uu____1745 in
                                   FStar_Options.set_option "z3cliopt"
                                     uu____1744);
                                  FStar_Options.set_option "log_queries"
                                    (FStar_Options.Bool log_queries_before));
                                 (let uu____1749 = FStar_ST.read current_core in
=======
                                  (let uu____1773 =
                                     let uu____1774 =
                                       FStar_List.map
                                         (fun x  -> FStar_Options.String x)
                                         z3cliopts_before in
                                     FStar_Options.List uu____1774 in
                                   FStar_Options.set_option "z3cliopt"
                                     uu____1773);
                                  FStar_Options.set_option "log_queries"
                                    (FStar_Options.Bool log_queries_before));
                                 (let uu____1777 = FStar_ST.read current_core in
>>>>>>> origin/guido_tactics
                                  {
                                    FStar_Util.hint_name = query_name;
                                    FStar_Util.hint_index = query_index;
                                    FStar_Util.fuel = prev_fuel;
                                    FStar_Util.ifuel = prev_ifuel;
<<<<<<< HEAD
                                    FStar_Util.unsat_core = uu____1749;
=======
                                    FStar_Util.unsat_core = uu____1777;
>>>>>>> origin/guido_tactics
                                    FStar_Util.query_elapsed_time =
                                      elapsed_time
                                  }) in
                               match result with
                               | FStar_Util.Inl unsat_core1 ->
                                   (query_info (Some env) "Query-stats"
                                      "succeeded" statistics;
<<<<<<< HEAD
                                    (let uu____1756 =
                                       let uu____1758 =
                                         (Prims.op_Negation used_hint) &&
                                           (FStar_Options.record_hints ()) in
                                       if uu____1758
                                       then
                                         let uu____1760 =
                                           let uu____1761 =
                                             FStar_Options.check_hints () in
                                           if uu____1761
=======
                                    (let uu____1784 =
                                       let uu____1786 =
                                         (Prims.op_Negation used_hint) &&
                                           (FStar_Options.record_hints ()) in
                                       if uu____1786
                                       then
                                         let uu____1788 =
                                           let uu____1789 =
                                             FStar_Options.check_hints () in
                                           if uu____1789
>>>>>>> origin/guido_tactics
                                           then refine_hint unsat_core1 scope
                                           else
                                             {
                                               FStar_Util.hint_name =
                                                 query_name;
                                               FStar_Util.hint_index =
                                                 query_index;
                                               FStar_Util.fuel = prev_fuel;
                                               FStar_Util.ifuel = prev_ifuel;
                                               FStar_Util.unsat_core =
                                                 unsat_core1;
                                               FStar_Util.query_elapsed_time
                                                 = elapsed_time
                                             } in
<<<<<<< HEAD
                                         Some uu____1760
                                       else hint_opt in
                                     record_hint uu____1756))
                               | FStar_Util.Inr errs ->
                                   (query_info (Some env) "Query-stats"
                                      "failed" statistics;
                                    (let uu____1767 =
                                       used_hint &&
                                         (FStar_Options.hint_info ()) in
                                     if uu____1767
=======
                                         Some uu____1788
                                       else hint_opt in
                                     record_hint uu____1784))
                               | FStar_Util.Inr errs ->
                                   (query_info (Some env) "Query-stats"
                                      "failed" statistics;
                                    (let uu____1795 =
                                       used_hint &&
                                         (FStar_Options.hint_info ()) in
                                     if uu____1795
>>>>>>> origin/guido_tactics
                                     then
                                       (FStar_Util.print_string
                                          "Failed hint:\n";
                                        (match unsat_core with
                                         | None  ->
                                             FStar_Util.print_string
                                               "<empty>"
                                         | Some core ->
<<<<<<< HEAD
                                             ((let uu____1774 =
=======
                                             ((let uu____1802 =
>>>>>>> origin/guido_tactics
                                                 FStar_List.map
                                                   (fun x  ->
                                                      FStar_Util.print_string
                                                        (Prims.strcat " " x))
                                                   core in
                                               ());
                                              FStar_Util.print_string "\n")))
                                     else ());
                                    try_alt_configs
                                      (prev_fuel, prev_ifuel, timeout) p1
                                      errs alt scope))) in
<<<<<<< HEAD
                       ((let uu____1781 =
                           (FStar_Option.isSome unsat_core) ||
                             (FStar_Options.z3_refresh ()) in
                         if uu____1781
                         then FStar_SMTEncoding_Z3.refresh ()
                         else ());
                        (let wf = with_fuel [] p initial_config in
                         let uu____1786 =
                           let uu____1787 =
                             FStar_SMTEncoding_Z3.mk_fresh_scope () in
                           cb (FStar_Option.isSome unsat_core) initial_config
                             p alt_configs uu____1787 in
                         FStar_SMTEncoding_Z3.ask
                           (filter_assertions unsat_core) all_labels wf None
                           uu____1786)) in
                 let process_query q = check q in
                 let uu____1795 = FStar_Options.admit_smt_queries () in
                 if uu____1795 then () else process_query query)
=======
                       ((let uu____1808 =
                           (FStar_Option.isSome unsat_core) ||
                             (FStar_Options.z3_refresh ()) in
                         if uu____1808
                         then FStar_SMTEncoding_Z3.refresh ()
                         else ());
                        (let wf = with_fuel [] p initial_config in
                         let uu____1813 =
                           let uu____1814 =
                             FStar_SMTEncoding_Z3.mk_fresh_scope () in
                           cb (FStar_Option.isSome unsat_core) initial_config
                             p alt_configs uu____1814 in
                         FStar_SMTEncoding_Z3.ask
                           (filter_assertions env unsat_core) all_labels wf
                           None uu____1813)) in
                 let process_query q = check q in
                 let uu____1822 = FStar_Options.admit_smt_queries () in
                 if uu____1822 then () else process_query query)
>>>>>>> origin/guido_tactics
let solve:
  (Prims.unit -> Prims.string) option ->
    FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.unit
  =
  fun use_env_msg  ->
    fun tcenv  ->
      fun q  ->
<<<<<<< HEAD
        (let uu____1814 =
           let uu____1815 =
             let uu____1816 = FStar_TypeChecker_Env.get_range tcenv in
             FStar_All.pipe_left FStar_Range.string_of_range uu____1816 in
           FStar_Util.format1 "Starting query at %s" uu____1815 in
         FStar_SMTEncoding_Encode.push uu____1814);
        (let tcenv1 = FStar_TypeChecker_Env.incr_query_index tcenv in
         let uu____1818 =
           FStar_SMTEncoding_Encode.encode_query use_env_msg tcenv1 q in
         match uu____1818 with
         | (prefix1,labels,qry,suffix) ->
             let pop1 uu____1839 =
               let uu____1840 =
                 let uu____1841 =
                   let uu____1842 = FStar_TypeChecker_Env.get_range tcenv1 in
                   FStar_All.pipe_left FStar_Range.string_of_range uu____1842 in
                 FStar_Util.format1 "Ending query at %s" uu____1841 in
               FStar_SMTEncoding_Encode.pop uu____1840 in
=======
        (let uu____1844 =
           let uu____1845 =
             let uu____1846 = FStar_TypeChecker_Env.get_range tcenv in
             FStar_All.pipe_left FStar_Range.string_of_range uu____1846 in
           FStar_Util.format1 "Starting query at %s" uu____1845 in
         FStar_SMTEncoding_Encode.push uu____1844);
        (let tcenv1 = FStar_TypeChecker_Env.incr_query_index tcenv in
         let uu____1848 =
           FStar_SMTEncoding_Encode.encode_query use_env_msg tcenv1 q in
         match uu____1848 with
         | (prefix1,labels,qry,suffix) ->
             let pop1 uu____1869 =
               let uu____1870 =
                 let uu____1871 =
                   let uu____1872 = FStar_TypeChecker_Env.get_range tcenv1 in
                   FStar_All.pipe_left FStar_Range.string_of_range uu____1872 in
                 FStar_Util.format1 "Ending query at %s" uu____1871 in
               FStar_SMTEncoding_Encode.pop uu____1870 in
>>>>>>> origin/guido_tactics
             (match qry with
              | FStar_SMTEncoding_Term.Assume
                  {
                    FStar_SMTEncoding_Term.assumption_term =
                      {
                        FStar_SMTEncoding_Term.tm =
                          FStar_SMTEncoding_Term.App
<<<<<<< HEAD
                          (FStar_SMTEncoding_Term.FalseOp ,uu____1843);
                        FStar_SMTEncoding_Term.freevars = uu____1844;
                        FStar_SMTEncoding_Term.rng = uu____1845;_};
                    FStar_SMTEncoding_Term.assumption_caption = uu____1846;
                    FStar_SMTEncoding_Term.assumption_name = uu____1847;
                    FStar_SMTEncoding_Term.assumption_fact_ids = uu____1848;_}
                  -> pop1 ()
              | uu____1856 when tcenv1.FStar_TypeChecker_Env.admit -> pop1 ()
              | FStar_SMTEncoding_Term.Assume uu____1857 ->
                  (ask_and_report_errors tcenv1 labels prefix1 qry suffix;
                   pop1 ())
              | uu____1859 -> failwith "Impossible"))
=======
                          (FStar_SMTEncoding_Term.FalseOp ,uu____1873);
                        FStar_SMTEncoding_Term.freevars = uu____1874;
                        FStar_SMTEncoding_Term.rng = uu____1875;_};
                    FStar_SMTEncoding_Term.assumption_caption = uu____1876;
                    FStar_SMTEncoding_Term.assumption_name = uu____1877;
                    FStar_SMTEncoding_Term.assumption_fact_ids = uu____1878;_}
                  -> pop1 ()
              | uu____1886 when tcenv1.FStar_TypeChecker_Env.admit -> pop1 ()
              | FStar_SMTEncoding_Term.Assume uu____1887 ->
                  (ask_and_report_errors tcenv1 labels prefix1 qry suffix;
                   pop1 ())
              | uu____1889 -> failwith "Impossible"))
>>>>>>> origin/guido_tactics
let solver: FStar_TypeChecker_Env.solver_t =
  {
    FStar_TypeChecker_Env.init = FStar_SMTEncoding_Encode.init;
    FStar_TypeChecker_Env.push = FStar_SMTEncoding_Encode.push;
    FStar_TypeChecker_Env.pop = FStar_SMTEncoding_Encode.pop;
    FStar_TypeChecker_Env.mark = FStar_SMTEncoding_Encode.mark;
    FStar_TypeChecker_Env.reset_mark = FStar_SMTEncoding_Encode.reset_mark;
    FStar_TypeChecker_Env.commit_mark = FStar_SMTEncoding_Encode.commit_mark;
    FStar_TypeChecker_Env.encode_modul =
      FStar_SMTEncoding_Encode.encode_modul;
    FStar_TypeChecker_Env.encode_sig = FStar_SMTEncoding_Encode.encode_sig;
    FStar_TypeChecker_Env.preprocess =
      (fun e  ->
         fun g  ->
           let uu____1892 =
             let uu____1896 = FStar_Options.peek () in (e, g, uu____1896) in
           [uu____1892]);
    FStar_TypeChecker_Env.solve = solve;
    FStar_TypeChecker_Env.is_trivial = FStar_SMTEncoding_Encode.is_trivial;
    FStar_TypeChecker_Env.finish = FStar_SMTEncoding_Z3.finish;
    FStar_TypeChecker_Env.refresh = FStar_SMTEncoding_Z3.refresh
  }
let dummy: FStar_TypeChecker_Env.solver_t =
  {
<<<<<<< HEAD
    FStar_TypeChecker_Env.init = (fun uu____1870  -> ());
    FStar_TypeChecker_Env.push = (fun uu____1872  -> ());
    FStar_TypeChecker_Env.pop = (fun uu____1874  -> ());
    FStar_TypeChecker_Env.mark = (fun uu____1876  -> ());
    FStar_TypeChecker_Env.reset_mark = (fun uu____1878  -> ());
    FStar_TypeChecker_Env.commit_mark = (fun uu____1880  -> ());
    FStar_TypeChecker_Env.encode_modul =
      (fun uu____1883  -> fun uu____1884  -> ());
    FStar_TypeChecker_Env.encode_sig =
      (fun uu____1887  -> fun uu____1888  -> ());
    FStar_TypeChecker_Env.preprocess = (fun e  -> fun g  -> [(e, g)]);
    FStar_TypeChecker_Env.solve =
      (fun uu____1900  -> fun uu____1901  -> fun uu____1902  -> ());
    FStar_TypeChecker_Env.is_trivial =
      (fun uu____1908  -> fun uu____1909  -> false);
    FStar_TypeChecker_Env.finish = (fun uu____1911  -> ());
    FStar_TypeChecker_Env.refresh = (fun uu____1913  -> ())
=======
    FStar_TypeChecker_Env.init = (fun uu____1903  -> ());
    FStar_TypeChecker_Env.push = (fun uu____1904  -> ());
    FStar_TypeChecker_Env.pop = (fun uu____1905  -> ());
    FStar_TypeChecker_Env.mark = (fun uu____1906  -> ());
    FStar_TypeChecker_Env.reset_mark = (fun uu____1907  -> ());
    FStar_TypeChecker_Env.commit_mark = (fun uu____1908  -> ());
    FStar_TypeChecker_Env.encode_modul =
      (fun uu____1909  -> fun uu____1910  -> ());
    FStar_TypeChecker_Env.encode_sig =
      (fun uu____1911  -> fun uu____1912  -> ());
    FStar_TypeChecker_Env.preprocess =
      (fun e  ->
         fun g  ->
           let uu____1915 =
             let uu____1919 = FStar_Options.peek () in (e, g, uu____1919) in
           [uu____1915]);
    FStar_TypeChecker_Env.solve =
      (fun uu____1926  -> fun uu____1927  -> fun uu____1928  -> ());
    FStar_TypeChecker_Env.is_trivial =
      (fun uu____1932  -> fun uu____1933  -> false);
    FStar_TypeChecker_Env.finish = (fun uu____1934  -> ());
    FStar_TypeChecker_Env.refresh = (fun uu____1935  -> ())
>>>>>>> origin/guido_tactics
  }