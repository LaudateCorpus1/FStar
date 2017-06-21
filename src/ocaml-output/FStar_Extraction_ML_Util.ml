open Prims
let pruneNones l =
  FStar_List.fold_right
    (fun x  -> fun ll  -> match x with | Some xs -> xs :: ll | None  -> ll) l
    []
let mlconst_of_const:
  FStar_Const.sconst -> FStar_Extraction_ML_Syntax.mlconstant =
  fun sctt  ->
    match sctt with
    | FStar_Const.Const_range uu____27 -> failwith "Unsupported constant"
    | FStar_Const.Const_effect  -> failwith "Unsupported constant"
    | FStar_Const.Const_unit  -> FStar_Extraction_ML_Syntax.MLC_Unit
    | FStar_Const.Const_char c -> FStar_Extraction_ML_Syntax.MLC_Char c
    | FStar_Const.Const_int (s,i) ->
        FStar_Extraction_ML_Syntax.MLC_Int (s, i)
    | FStar_Const.Const_bool b -> FStar_Extraction_ML_Syntax.MLC_Bool b
    | FStar_Const.Const_float d -> FStar_Extraction_ML_Syntax.MLC_Float d
    | FStar_Const.Const_bytearray (bytes,uu____43) ->
        FStar_Extraction_ML_Syntax.MLC_Bytes bytes
    | FStar_Const.Const_string (bytes,uu____47) ->
        FStar_Extraction_ML_Syntax.MLC_String
          (FStar_Util.string_of_unicode bytes)
    | FStar_Const.Const_reify  ->
        failwith "Unhandled constant: reify/reflect"
    | FStar_Const.Const_reflect uu____50 ->
        failwith "Unhandled constant: reify/reflect"
let mlconst_of_const':
  FStar_Range.range ->
    FStar_Const.sconst -> FStar_Extraction_ML_Syntax.mlconstant
  =
  fun p  ->
    fun c  ->
      try mlconst_of_const c
      with
<<<<<<< HEAD
      | uu____63 ->
          let uu____64 =
            let uu____65 = FStar_Range.string_of_range p in
            let uu____66 = FStar_Syntax_Print.const_to_string c in
            FStar_Util.format2 "(%s) Failed to translate constant %s "
              uu____65 uu____66 in
          failwith uu____64
=======
      | uu____61 ->
          let uu____62 =
            let uu____63 = FStar_Range.string_of_range p in
            let uu____64 = FStar_Syntax_Print.const_to_string c in
            FStar_Util.format2 "(%s) Failed to translate constant %s "
              uu____63 uu____64 in
          failwith uu____62
>>>>>>> origin/guido_tactics
let rec subst_aux:
  (FStar_Extraction_ML_Syntax.mlident* FStar_Extraction_ML_Syntax.mlty)
    Prims.list ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty
  =
  fun subst1  ->
    fun t  ->
      match t with
      | FStar_Extraction_ML_Syntax.MLTY_Var x ->
          let uu____80 =
            FStar_Util.find_opt
<<<<<<< HEAD
              (fun uu____89  -> match uu____89 with | (y,uu____93) -> y = x)
              subst1 in
          (match uu____80 with | Some ts -> snd ts | None  -> t)
      | FStar_Extraction_ML_Syntax.MLTY_Fun (t1,f,t2) ->
          let uu____104 =
            let uu____108 = subst_aux subst1 t1 in
            let uu____109 = subst_aux subst1 t2 in (uu____108, f, uu____109) in
          FStar_Extraction_ML_Syntax.MLTY_Fun uu____104
      | FStar_Extraction_ML_Syntax.MLTY_Named (args,path) ->
          let uu____114 =
            let uu____118 = FStar_List.map (subst_aux subst1) args in
            (uu____118, path) in
          FStar_Extraction_ML_Syntax.MLTY_Named uu____114
      | FStar_Extraction_ML_Syntax.MLTY_Tuple ts ->
          let uu____123 = FStar_List.map (subst_aux subst1) ts in
          FStar_Extraction_ML_Syntax.MLTY_Tuple uu____123
=======
              (fun uu____86  -> match uu____86 with | (y,uu____90) -> y = x)
              subst1 in
          (match uu____80 with | Some ts -> snd ts | None  -> t)
      | FStar_Extraction_ML_Syntax.MLTY_Fun (t1,f,t2) ->
          let uu____101 =
            let uu____105 = subst_aux subst1 t1 in
            let uu____106 = subst_aux subst1 t2 in (uu____105, f, uu____106) in
          FStar_Extraction_ML_Syntax.MLTY_Fun uu____101
      | FStar_Extraction_ML_Syntax.MLTY_Named (args,path) ->
          let uu____111 =
            let uu____115 = FStar_List.map (subst_aux subst1) args in
            (uu____115, path) in
          FStar_Extraction_ML_Syntax.MLTY_Named uu____111
      | FStar_Extraction_ML_Syntax.MLTY_Tuple ts ->
          let uu____120 = FStar_List.map (subst_aux subst1) ts in
          FStar_Extraction_ML_Syntax.MLTY_Tuple uu____120
>>>>>>> origin/guido_tactics
      | FStar_Extraction_ML_Syntax.MLTY_Top  ->
          FStar_Extraction_ML_Syntax.MLTY_Top
let subst:
  FStar_Extraction_ML_Syntax.mltyscheme ->
    FStar_Extraction_ML_Syntax.mlty Prims.list ->
      FStar_Extraction_ML_Syntax.mlty
  =
<<<<<<< HEAD
  fun uu____130  ->
    fun args  ->
      match uu____130 with
=======
  fun uu____129  ->
    fun args  ->
      match uu____129 with
>>>>>>> origin/guido_tactics
      | (formals,t) ->
          if (FStar_List.length formals) <> (FStar_List.length args)
          then
            failwith
              "Substitution must be fully applied (see GitHub issue #490)"
          else
<<<<<<< HEAD
            (let uu____140 = FStar_List.zip formals args in
             subst_aux uu____140 t)
=======
            (let uu____143 = FStar_List.zip formals args in
             subst_aux uu____143 t)
>>>>>>> origin/guido_tactics
let udelta_unfold:
  FStar_Extraction_ML_UEnv.env ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty option
  =
  fun g  ->
<<<<<<< HEAD
    fun uu___111_150  ->
      match uu___111_150 with
      | FStar_Extraction_ML_Syntax.MLTY_Named (args,n1) ->
          let uu____156 = FStar_Extraction_ML_UEnv.lookup_ty_const g n1 in
          (match uu____156 with
           | Some ts -> let uu____160 = subst ts args in Some uu____160
           | uu____161 -> None)
      | uu____163 -> None
=======
    fun uu___112_155  ->
      match uu___112_155 with
      | FStar_Extraction_ML_Syntax.MLTY_Named (args,n1) ->
          let uu____161 = FStar_Extraction_ML_UEnv.lookup_ty_const g n1 in
          (match uu____161 with
           | Some ts -> let uu____165 = subst ts args in Some uu____165
           | uu____166 -> None)
      | uu____168 -> None
>>>>>>> origin/guido_tactics
let eff_leq:
  FStar_Extraction_ML_Syntax.e_tag ->
    FStar_Extraction_ML_Syntax.e_tag -> Prims.bool
  =
  fun f  ->
    fun f'  ->
      match (f, f') with
<<<<<<< HEAD
      | (FStar_Extraction_ML_Syntax.E_PURE ,uu____170) -> true
=======
      | (FStar_Extraction_ML_Syntax.E_PURE ,uu____177) -> true
>>>>>>> origin/guido_tactics
      | (FStar_Extraction_ML_Syntax.E_GHOST
         ,FStar_Extraction_ML_Syntax.E_GHOST ) -> true
      | (FStar_Extraction_ML_Syntax.E_IMPURE
         ,FStar_Extraction_ML_Syntax.E_IMPURE ) -> true
<<<<<<< HEAD
      | uu____171 -> false
let eff_to_string: FStar_Extraction_ML_Syntax.e_tag -> Prims.string =
  fun uu___112_176  ->
    match uu___112_176 with
=======
      | uu____178 -> false
let eff_to_string: FStar_Extraction_ML_Syntax.e_tag -> Prims.string =
  fun uu___113_184  ->
    match uu___113_184 with
>>>>>>> origin/guido_tactics
    | FStar_Extraction_ML_Syntax.E_PURE  -> "Pure"
    | FStar_Extraction_ML_Syntax.E_GHOST  -> "Ghost"
    | FStar_Extraction_ML_Syntax.E_IMPURE  -> "Impure"
let join:
  FStar_Range.range ->
    FStar_Extraction_ML_Syntax.e_tag ->
      FStar_Extraction_ML_Syntax.e_tag -> FStar_Extraction_ML_Syntax.e_tag
  =
  fun r  ->
    fun f  ->
      fun f'  ->
        match (f, f') with
        | (FStar_Extraction_ML_Syntax.E_IMPURE
           ,FStar_Extraction_ML_Syntax.E_PURE ) ->
            FStar_Extraction_ML_Syntax.E_IMPURE
        | (FStar_Extraction_ML_Syntax.E_PURE
           ,FStar_Extraction_ML_Syntax.E_IMPURE ) ->
            FStar_Extraction_ML_Syntax.E_IMPURE
        | (FStar_Extraction_ML_Syntax.E_IMPURE
           ,FStar_Extraction_ML_Syntax.E_IMPURE ) ->
            FStar_Extraction_ML_Syntax.E_IMPURE
        | (FStar_Extraction_ML_Syntax.E_GHOST
           ,FStar_Extraction_ML_Syntax.E_GHOST ) ->
            FStar_Extraction_ML_Syntax.E_GHOST
        | (FStar_Extraction_ML_Syntax.E_PURE
           ,FStar_Extraction_ML_Syntax.E_GHOST ) ->
            FStar_Extraction_ML_Syntax.E_GHOST
        | (FStar_Extraction_ML_Syntax.E_GHOST
           ,FStar_Extraction_ML_Syntax.E_PURE ) ->
            FStar_Extraction_ML_Syntax.E_GHOST
        | (FStar_Extraction_ML_Syntax.E_PURE
           ,FStar_Extraction_ML_Syntax.E_PURE ) ->
            FStar_Extraction_ML_Syntax.E_PURE
<<<<<<< HEAD
        | uu____186 ->
            let uu____189 =
              let uu____190 = FStar_Range.string_of_range r in
              FStar_Util.format3
                "Impossible (%s): Inconsistent effects %s and %s" uu____190
                (eff_to_string f) (eff_to_string f') in
            failwith uu____189
=======
        | uu____197 ->
            let uu____200 =
              let uu____201 = FStar_Range.string_of_range r in
              FStar_Util.format3
                "Impossible (%s): Inconsistent effects %s and %s" uu____201
                (eff_to_string f) (eff_to_string f') in
            failwith uu____200
>>>>>>> origin/guido_tactics
let join_l:
  FStar_Range.range ->
    FStar_Extraction_ML_Syntax.e_tag Prims.list ->
      FStar_Extraction_ML_Syntax.e_tag
  =
  fun r  ->
    fun fs  ->
      FStar_List.fold_left (join r) FStar_Extraction_ML_Syntax.E_PURE fs
<<<<<<< HEAD
let mk_ty_fun uu____210 =
  FStar_List.fold_right
    (fun uu____217  ->
       fun t  ->
         match uu____217 with
         | (uu____221,t0) ->
=======
let mk_ty_fun uu____226 =
  FStar_List.fold_right
    (fun uu____229  ->
       fun t  ->
         match uu____229 with
         | (uu____233,t0) ->
>>>>>>> origin/guido_tactics
             FStar_Extraction_ML_Syntax.MLTY_Fun
               (t0, FStar_Extraction_ML_Syntax.E_PURE, t))
type unfold_t =
  FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty option
let rec type_leq_c:
  unfold_t ->
    FStar_Extraction_ML_Syntax.mlexpr option ->
      FStar_Extraction_ML_Syntax.mlty ->
        FStar_Extraction_ML_Syntax.mlty ->
          (Prims.bool* FStar_Extraction_ML_Syntax.mlexpr option)
  =
  fun unfold_ty  ->
    fun e  ->
      fun t  ->
        fun t'  ->
          match (t, t') with
          | (FStar_Extraction_ML_Syntax.MLTY_Var
             x,FStar_Extraction_ML_Syntax.MLTY_Var y) ->
              if (fst x) = (fst y) then (true, e) else (false, None)
          | (FStar_Extraction_ML_Syntax.MLTY_Fun
             (t1,f,t2),FStar_Extraction_ML_Syntax.MLTY_Fun (t1',f',t2')) ->
              let mk_fun xs body =
                match xs with
                | [] -> body
<<<<<<< HEAD
                | uu____286 ->
=======
                | uu____301 ->
>>>>>>> origin/guido_tactics
                    let e1 =
                      match body.FStar_Extraction_ML_Syntax.expr with
                      | FStar_Extraction_ML_Syntax.MLE_Fun (ys,body1) ->
                          FStar_Extraction_ML_Syntax.MLE_Fun
                            ((FStar_List.append xs ys), body1)
<<<<<<< HEAD
                      | uu____304 ->
                          FStar_Extraction_ML_Syntax.MLE_Fun (xs, body) in
                    let uu____308 =
                      (mk_ty_fun ()) xs body.FStar_Extraction_ML_Syntax.mlty in
                    FStar_Extraction_ML_Syntax.with_ty uu____308 e1 in
=======
                      | uu____319 ->
                          FStar_Extraction_ML_Syntax.MLE_Fun (xs, body) in
                    let uu____323 =
                      (mk_ty_fun ()) xs body.FStar_Extraction_ML_Syntax.mlty in
                    FStar_Extraction_ML_Syntax.with_ty uu____323 e1 in
>>>>>>> origin/guido_tactics
              (match e with
               | Some
                   {
                     FStar_Extraction_ML_Syntax.expr =
                       FStar_Extraction_ML_Syntax.MLE_Fun (x::xs,body);
<<<<<<< HEAD
                     FStar_Extraction_ML_Syntax.mlty = uu____315;
                     FStar_Extraction_ML_Syntax.loc = uu____316;_}
                   ->
                   let uu____327 =
                     (type_leq unfold_ty t1' t1) && (eff_leq f f') in
                   if uu____327
=======
                     FStar_Extraction_ML_Syntax.mlty = uu____330;
                     FStar_Extraction_ML_Syntax.loc = uu____331;_}
                   ->
                   let uu____342 =
                     (type_leq unfold_ty t1' t1) && (eff_leq f f') in
                   if uu____342
>>>>>>> origin/guido_tactics
                   then
                     (if
                        (f = FStar_Extraction_ML_Syntax.E_PURE) &&
                          (f' = FStar_Extraction_ML_Syntax.E_GHOST)
                      then
<<<<<<< HEAD
                        let uu____337 = type_leq unfold_ty t2 t2' in
                        (if uu____337
                         then
                           let body1 =
                             let uu____345 =
                               type_leq unfold_ty t2
                                 FStar_Extraction_ML_Syntax.ml_unit_ty in
                             if uu____345
=======
                        let uu____352 = type_leq unfold_ty t2 t2' in
                        (if uu____352
                         then
                           let body1 =
                             let uu____360 =
                               type_leq unfold_ty t2
                                 FStar_Extraction_ML_Syntax.ml_unit_ty in
                             if uu____360
>>>>>>> origin/guido_tactics
                             then FStar_Extraction_ML_Syntax.ml_unit
                             else
                               FStar_All.pipe_left
                                 (FStar_Extraction_ML_Syntax.with_ty t2')
                                 (FStar_Extraction_ML_Syntax.MLE_Coerce
                                    (FStar_Extraction_ML_Syntax.ml_unit,
                                      FStar_Extraction_ML_Syntax.ml_unit_ty,
                                      t2')) in
<<<<<<< HEAD
                           let uu____350 =
                             let uu____352 =
                               let uu____353 =
                                 let uu____356 =
                                   (mk_ty_fun ()) [x]
                                     body1.FStar_Extraction_ML_Syntax.mlty in
                                 FStar_Extraction_ML_Syntax.with_ty uu____356 in
                               FStar_All.pipe_left uu____353
                                 (FStar_Extraction_ML_Syntax.MLE_Fun
                                    ([x], body1)) in
                             Some uu____352 in
                           (true, uu____350)
                         else (false, None))
                      else
                        (let uu____372 =
                           let uu____376 =
                             let uu____378 = mk_fun xs body in
                             FStar_All.pipe_left (fun _0_30  -> Some _0_30)
                               uu____378 in
                           type_leq_c unfold_ty uu____376 t2 t2' in
                         match uu____372 with
=======
                           let uu____365 =
                             let uu____367 =
                               let uu____368 =
                                 let uu____371 =
                                   (mk_ty_fun ()) [x]
                                     body1.FStar_Extraction_ML_Syntax.mlty in
                                 FStar_Extraction_ML_Syntax.with_ty uu____371 in
                               FStar_All.pipe_left uu____368
                                 (FStar_Extraction_ML_Syntax.MLE_Fun
                                    ([x], body1)) in
                             Some uu____367 in
                           (true, uu____365)
                         else (false, None))
                      else
                        (let uu____387 =
                           let uu____391 =
                             let uu____393 = mk_fun xs body in
                             FStar_All.pipe_left (fun _0_40  -> Some _0_40)
                               uu____393 in
                           type_leq_c unfold_ty uu____391 t2 t2' in
                         match uu____387 with
>>>>>>> origin/guido_tactics
                         | (ok,body1) ->
                             let res =
                               match body1 with
                               | Some body2 ->
<<<<<<< HEAD
                                   let uu____394 = mk_fun [x] body2 in
                                   Some uu____394
                               | uu____399 -> None in
                             (ok, res)))
                   else (false, None)
               | uu____404 ->
                   let uu____406 =
                     ((type_leq unfold_ty t1' t1) && (eff_leq f f')) &&
                       (type_leq unfold_ty t2 t2') in
                   if uu____406 then (true, e) else (false, None))
=======
                                   let uu____409 = mk_fun [x] body2 in
                                   Some uu____409
                               | uu____414 -> None in
                             (ok, res)))
                   else (false, None)
               | uu____419 ->
                   let uu____421 =
                     ((type_leq unfold_ty t1' t1) && (eff_leq f f')) &&
                       (type_leq unfold_ty t2 t2') in
                   if uu____421 then (true, e) else (false, None))
>>>>>>> origin/guido_tactics
          | (FStar_Extraction_ML_Syntax.MLTY_Named
             (args,path),FStar_Extraction_ML_Syntax.MLTY_Named (args',path'))
              ->
              if path = path'
              then
<<<<<<< HEAD
                let uu____430 =
                  FStar_List.forall2 (type_leq unfold_ty) args args' in
                (if uu____430 then (true, e) else (false, None))
              else
                (let uu____441 = unfold_ty t in
                 match uu____441 with
                 | Some t1 -> type_leq_c unfold_ty e t1 t'
                 | None  ->
                     let uu____451 = unfold_ty t' in
                     (match uu____451 with
=======
                let uu____445 =
                  FStar_List.forall2 (type_leq unfold_ty) args args' in
                (if uu____445 then (true, e) else (false, None))
              else
                (let uu____456 = unfold_ty t in
                 match uu____456 with
                 | Some t1 -> type_leq_c unfold_ty e t1 t'
                 | None  ->
                     let uu____466 = unfold_ty t' in
                     (match uu____466 with
>>>>>>> origin/guido_tactics
                      | None  -> (false, None)
                      | Some t'1 -> type_leq_c unfold_ty e t t'1))
          | (FStar_Extraction_ML_Syntax.MLTY_Tuple
             ts,FStar_Extraction_ML_Syntax.MLTY_Tuple ts') ->
<<<<<<< HEAD
              let uu____466 = FStar_List.forall2 (type_leq unfold_ty) ts ts' in
              if uu____466 then (true, e) else (false, None)
          | (FStar_Extraction_ML_Syntax.MLTY_Top
             ,FStar_Extraction_ML_Syntax.MLTY_Top ) -> (true, e)
          | (FStar_Extraction_ML_Syntax.MLTY_Named uu____477,uu____478) ->
              let uu____482 = unfold_ty t in
              (match uu____482 with
               | Some t1 -> type_leq_c unfold_ty e t1 t'
               | uu____492 -> (false, None))
          | (uu____495,FStar_Extraction_ML_Syntax.MLTY_Named uu____496) ->
              let uu____500 = unfold_ty t' in
              (match uu____500 with
               | Some t'1 -> type_leq_c unfold_ty e t t'1
               | uu____510 -> (false, None))
          | uu____513 -> (false, None)
=======
              let uu____481 = FStar_List.forall2 (type_leq unfold_ty) ts ts' in
              if uu____481 then (true, e) else (false, None)
          | (FStar_Extraction_ML_Syntax.MLTY_Top
             ,FStar_Extraction_ML_Syntax.MLTY_Top ) -> (true, e)
          | (FStar_Extraction_ML_Syntax.MLTY_Named uu____492,uu____493) ->
              let uu____497 = unfold_ty t in
              (match uu____497 with
               | Some t1 -> type_leq_c unfold_ty e t1 t'
               | uu____507 -> (false, None))
          | (uu____510,FStar_Extraction_ML_Syntax.MLTY_Named uu____511) ->
              let uu____515 = unfold_ty t' in
              (match uu____515 with
               | Some t'1 -> type_leq_c unfold_ty e t t'1
               | uu____525 -> (false, None))
          | uu____528 -> (false, None)
>>>>>>> origin/guido_tactics
and type_leq:
  unfold_t ->
    FStar_Extraction_ML_Syntax.mlty ->
      FStar_Extraction_ML_Syntax.mlty -> Prims.bool
  =
  fun g  ->
    fun t1  ->
      fun t2  ->
<<<<<<< HEAD
        let uu____521 = type_leq_c g None t1 t2 in
        FStar_All.pipe_right uu____521 FStar_Pervasives.fst
let is_type_abstraction uu___113_547 =
  match uu___113_547 with
  | (FStar_Util.Inl uu____553,uu____554)::uu____555 -> true
  | uu____567 -> false
let is_xtuple: (Prims.string Prims.list* Prims.string) -> Prims.int option =
  fun uu____579  ->
    match uu____579 with
=======
        let uu____536 = type_leq_c g None t1 t2 in
        FStar_All.pipe_right uu____536 FStar_Pervasives.fst
let is_type_abstraction uu___114_566 =
  match uu___114_566 with
  | (FStar_Util.Inl uu____572,uu____573)::uu____574 -> true
  | uu____586 -> false
let is_xtuple: (Prims.string Prims.list* Prims.string) -> Prims.int option =
  fun uu____599  ->
    match uu____599 with
>>>>>>> origin/guido_tactics
    | (ns,n1) ->
        if (ns = ["Prims"]) || (ns = ["FStar"; "Pervasives"])
        then
          (match n1 with
           | "Mktuple2" -> Some (Prims.parse_int "2")
           | "Mktuple3" -> Some (Prims.parse_int "3")
           | "Mktuple4" -> Some (Prims.parse_int "4")
           | "Mktuple5" -> Some (Prims.parse_int "5")
           | "Mktuple6" -> Some (Prims.parse_int "6")
           | "Mktuple7" -> Some (Prims.parse_int "7")
           | "Mktuple8" -> Some (Prims.parse_int "8")
<<<<<<< HEAD
           | uu____592 -> None)
=======
           | uu____612 -> None)
>>>>>>> origin/guido_tactics
        else None
let resugar_exp:
  FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr =
  fun e  ->
    match e.FStar_Extraction_ML_Syntax.expr with
    | FStar_Extraction_ML_Syntax.MLE_CTor (mlp,args) ->
        (match is_xtuple mlp with
         | Some n1 ->
             FStar_All.pipe_left
               (FStar_Extraction_ML_Syntax.with_ty
                  e.FStar_Extraction_ML_Syntax.mlty)
               (FStar_Extraction_ML_Syntax.MLE_Tuple args)
<<<<<<< HEAD
         | uu____602 -> e)
    | uu____604 -> e
let record_field_path:
  FStar_Ident.lident Prims.list -> Prims.string Prims.list =
  fun uu___114_609  ->
    match uu___114_609 with
    | f::uu____613 ->
        let uu____615 = FStar_Util.prefix f.FStar_Ident.ns in
        (match uu____615 with
         | (ns,uu____621) ->
             FStar_All.pipe_right ns
               (FStar_List.map (fun id  -> id.FStar_Ident.idText)))
    | uu____628 -> failwith "impos"
=======
         | uu____623 -> e)
    | uu____625 -> e
let record_field_path:
  FStar_Ident.lident Prims.list -> Prims.string Prims.list =
  fun uu___115_631  ->
    match uu___115_631 with
    | f::uu____635 ->
        let uu____637 = FStar_Util.prefix f.FStar_Ident.ns in
        (match uu____637 with
         | (ns,uu____643) ->
             FStar_All.pipe_right ns
               (FStar_List.map (fun id  -> id.FStar_Ident.idText)))
    | uu____649 -> failwith "impos"
>>>>>>> origin/guido_tactics
let record_fields fs vs =
  FStar_List.map2
    (fun f  -> fun e  -> (((f.FStar_Ident.ident).FStar_Ident.idText), e)) fs
    vs
let is_xtuple_ty: (Prims.string Prims.list* Prims.string) -> Prims.int option
  =
<<<<<<< HEAD
  fun uu____662  ->
    match uu____662 with
=======
  fun uu____685  ->
    match uu____685 with
>>>>>>> origin/guido_tactics
    | (ns,n1) ->
        if ns = ["FStar"; "Pervasives"]
        then
          (match n1 with
           | "tuple2" -> Some (Prims.parse_int "2")
           | "tuple3" -> Some (Prims.parse_int "3")
           | "tuple4" -> Some (Prims.parse_int "4")
           | "tuple5" -> Some (Prims.parse_int "5")
           | "tuple6" -> Some (Prims.parse_int "6")
           | "tuple7" -> Some (Prims.parse_int "7")
           | "tuple8" -> Some (Prims.parse_int "8")
<<<<<<< HEAD
           | uu____674 -> None)
=======
           | uu____697 -> None)
>>>>>>> origin/guido_tactics
        else None
let resugar_mlty:
  FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty =
  fun t  ->
    match t with
    | FStar_Extraction_ML_Syntax.MLTY_Named (args,mlp) ->
        (match is_xtuple_ty mlp with
         | Some n1 -> FStar_Extraction_ML_Syntax.MLTY_Tuple args
<<<<<<< HEAD
         | uu____684 -> t)
    | uu____686 -> t
let codegen_fsharp: Prims.unit -> Prims.bool =
  fun uu____689  ->
    let uu____690 =
      let uu____691 = FStar_Options.codegen () in FStar_Option.get uu____691 in
    uu____690 = "FSharp"
let flatten_ns: Prims.string Prims.list -> Prims.string =
  fun ns  ->
    let uu____698 = codegen_fsharp () in
    if uu____698
    then FStar_String.concat "." ns
    else FStar_String.concat "_" ns
let flatten_mlpath: (Prims.string Prims.list* Prims.string) -> Prims.string =
  fun uu____705  ->
    match uu____705 with
    | (ns,n1) ->
        let uu____713 = codegen_fsharp () in
        if uu____713
=======
         | uu____708 -> t)
    | uu____710 -> t
let codegen_fsharp: Prims.unit -> Prims.bool =
  fun uu____714  ->
    let uu____715 =
      let uu____716 = FStar_Options.codegen () in FStar_Option.get uu____716 in
    uu____715 = "FSharp"
let flatten_ns: Prims.string Prims.list -> Prims.string =
  fun ns  ->
    let uu____724 = codegen_fsharp () in
    if uu____724
    then FStar_String.concat "." ns
    else FStar_String.concat "_" ns
let flatten_mlpath: (Prims.string Prims.list* Prims.string) -> Prims.string =
  fun uu____732  ->
    match uu____732 with
    | (ns,n1) ->
        let uu____740 = codegen_fsharp () in
        if uu____740
>>>>>>> origin/guido_tactics
        then FStar_String.concat "." (FStar_List.append ns [n1])
        else FStar_String.concat "_" (FStar_List.append ns [n1])
let mlpath_of_lid:
  FStar_Ident.lident -> (Prims.string Prims.list* Prims.string) =
  fun l  ->
<<<<<<< HEAD
    let uu____721 =
      FStar_All.pipe_right l.FStar_Ident.ns
        (FStar_List.map (fun i  -> i.FStar_Ident.idText)) in
    (uu____721, ((l.FStar_Ident.ident).FStar_Ident.idText))
=======
    let uu____749 =
      FStar_All.pipe_right l.FStar_Ident.ns
        (FStar_List.map (fun i  -> i.FStar_Ident.idText)) in
    (uu____749, ((l.FStar_Ident.ident).FStar_Ident.idText))
>>>>>>> origin/guido_tactics
let rec erasableType:
  unfold_t -> FStar_Extraction_ML_Syntax.mlty -> Prims.bool =
  fun unfold_ty  ->
    fun t  ->
      if FStar_Extraction_ML_UEnv.erasableTypeNoDelta t
      then true
      else
<<<<<<< HEAD
        (let uu____738 = unfold_ty t in
         match uu____738 with
=======
        (let uu____767 = unfold_ty t in
         match uu____767 with
>>>>>>> origin/guido_tactics
         | Some t1 -> erasableType unfold_ty t1
         | None  -> false)
let rec eraseTypeDeep:
  unfold_t ->
    FStar_Extraction_ML_Syntax.mlty -> FStar_Extraction_ML_Syntax.mlty
  =
  fun unfold_ty  ->
    fun t  ->
      match t with
      | FStar_Extraction_ML_Syntax.MLTY_Fun (tyd,etag,tycd) ->
          if etag = FStar_Extraction_ML_Syntax.E_PURE
          then
<<<<<<< HEAD
            let uu____757 =
              let uu____761 = eraseTypeDeep unfold_ty tyd in
              let uu____765 = eraseTypeDeep unfold_ty tycd in
              (uu____761, etag, uu____765) in
            FStar_Extraction_ML_Syntax.MLTY_Fun uu____757
          else t
      | FStar_Extraction_ML_Syntax.MLTY_Named (lty,mlp) ->
          let uu____774 = erasableType unfold_ty t in
          if uu____774
          then FStar_Extraction_ML_UEnv.erasedContent
          else
            (let uu____779 =
               let uu____783 = FStar_List.map (eraseTypeDeep unfold_ty) lty in
               (uu____783, mlp) in
             FStar_Extraction_ML_Syntax.MLTY_Named uu____779)
      | FStar_Extraction_ML_Syntax.MLTY_Tuple lty ->
          let uu____791 = FStar_List.map (eraseTypeDeep unfold_ty) lty in
          FStar_Extraction_ML_Syntax.MLTY_Tuple uu____791
      | uu____796 -> t
=======
            let uu____788 =
              let uu____792 = eraseTypeDeep unfold_ty tyd in
              let uu____796 = eraseTypeDeep unfold_ty tycd in
              (uu____792, etag, uu____796) in
            FStar_Extraction_ML_Syntax.MLTY_Fun uu____788
          else t
      | FStar_Extraction_ML_Syntax.MLTY_Named (lty,mlp) ->
          let uu____805 = erasableType unfold_ty t in
          if uu____805
          then FStar_Extraction_ML_UEnv.erasedContent
          else
            (let uu____810 =
               let uu____814 = FStar_List.map (eraseTypeDeep unfold_ty) lty in
               (uu____814, mlp) in
             FStar_Extraction_ML_Syntax.MLTY_Named uu____810)
      | FStar_Extraction_ML_Syntax.MLTY_Tuple lty ->
          let uu____822 = FStar_List.map (eraseTypeDeep unfold_ty) lty in
          FStar_Extraction_ML_Syntax.MLTY_Tuple uu____822
      | uu____827 -> t
>>>>>>> origin/guido_tactics
let prims_op_equality: FStar_Extraction_ML_Syntax.mlexpr =
  FStar_All.pipe_left
    (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.MLTY_Top)
    (FStar_Extraction_ML_Syntax.MLE_Name (["Prims"], "op_Equality"))
let prims_op_amp_amp: FStar_Extraction_ML_Syntax.mlexpr =
<<<<<<< HEAD
  let uu____798 =
    let uu____801 =
=======
  let uu____829 =
    let uu____832 =
>>>>>>> origin/guido_tactics
      (mk_ty_fun ())
        [(("x", (Prims.parse_int "0")),
           FStar_Extraction_ML_Syntax.ml_bool_ty);
        (("y", (Prims.parse_int "0")), FStar_Extraction_ML_Syntax.ml_bool_ty)]
        FStar_Extraction_ML_Syntax.ml_bool_ty in
<<<<<<< HEAD
    FStar_Extraction_ML_Syntax.with_ty uu____801 in
  FStar_All.pipe_left uu____798
=======
    FStar_Extraction_ML_Syntax.with_ty uu____832 in
  FStar_All.pipe_left uu____829
>>>>>>> origin/guido_tactics
    (FStar_Extraction_ML_Syntax.MLE_Name (["Prims"], "op_AmpAmp"))
let conjoin:
  FStar_Extraction_ML_Syntax.mlexpr ->
    FStar_Extraction_ML_Syntax.mlexpr -> FStar_Extraction_ML_Syntax.mlexpr
  =
  fun e1  ->
    fun e2  ->
      FStar_All.pipe_left
        (FStar_Extraction_ML_Syntax.with_ty
           FStar_Extraction_ML_Syntax.ml_bool_ty)
        (FStar_Extraction_ML_Syntax.MLE_App (prims_op_amp_amp, [e1; e2]))
let conjoin_opt:
  FStar_Extraction_ML_Syntax.mlexpr option ->
    FStar_Extraction_ML_Syntax.mlexpr option ->
      FStar_Extraction_ML_Syntax.mlexpr option
  =
  fun e1  ->
    fun e2  ->
      match (e1, e2) with
      | (None ,None ) -> None
      | (Some x,None ) -> Some x
      | (None ,Some x) -> Some x
<<<<<<< HEAD
      | (Some x,Some y) -> let uu____854 = conjoin x y in Some uu____854
=======
      | (Some x,Some y) -> let uu____889 = conjoin x y in Some uu____889
>>>>>>> origin/guido_tactics
let mlloc_of_range: FStar_Range.range -> (Prims.int* Prims.string) =
  fun r  ->
    let pos = FStar_Range.start_of_range r in
    let line = FStar_Range.line_of_pos pos in
<<<<<<< HEAD
    let uu____862 = FStar_Range.file_of_range r in (line, uu____862)
=======
    let uu____898 = FStar_Range.file_of_range r in (line, uu____898)
>>>>>>> origin/guido_tactics
let rec argTypes:
  FStar_Extraction_ML_Syntax.mlty ->
    FStar_Extraction_ML_Syntax.mlty Prims.list
  =
  fun t  ->
    match t with
<<<<<<< HEAD
    | FStar_Extraction_ML_Syntax.MLTY_Fun (a,uu____869,b) ->
        let uu____871 = argTypes b in a :: uu____871
    | uu____873 -> []
=======
    | FStar_Extraction_ML_Syntax.MLTY_Fun (a,uu____907,b) ->
        let uu____909 = argTypes b in a :: uu____909
    | uu____911 -> []
>>>>>>> origin/guido_tactics
let rec uncurry_mlty_fun:
  FStar_Extraction_ML_Syntax.mlty ->
    (FStar_Extraction_ML_Syntax.mlty Prims.list*
      FStar_Extraction_ML_Syntax.mlty)
  =
  fun t  ->
    match t with
<<<<<<< HEAD
    | FStar_Extraction_ML_Syntax.MLTY_Fun (a,uu____884,b) ->
        let uu____886 = uncurry_mlty_fun b in
        (match uu____886 with | (args,res) -> ((a :: args), res))
    | uu____898 -> ([], t)
=======
    | FStar_Extraction_ML_Syntax.MLTY_Fun (a,uu____923,b) ->
        let uu____925 = uncurry_mlty_fun b in
        (match uu____925 with | (args,res) -> ((a :: args), res))
    | uu____937 -> ([], t)
let lid_to_name: FStar_Ident.lident -> FStar_Extraction_ML_Syntax.mlexpr' =
  fun l  ->
    let uu____943 = FStar_Extraction_ML_Syntax.mlpath_of_lident l in
    FStar_Extraction_ML_Syntax.MLE_Name uu____943
let lid_to_top_name: FStar_Ident.lident -> FStar_Extraction_ML_Syntax.mlexpr
  =
  fun l  ->
    let uu____948 =
      let uu____949 = FStar_Extraction_ML_Syntax.mlpath_of_lident l in
      FStar_Extraction_ML_Syntax.MLE_Name uu____949 in
    FStar_All.pipe_left
      (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.MLTY_Top)
      uu____948
let str_to_name: Prims.string -> FStar_Extraction_ML_Syntax.mlexpr' =
  fun s  -> let uu____954 = FStar_Ident.lid_of_str s in lid_to_name uu____954
let str_to_top_name: Prims.string -> FStar_Extraction_ML_Syntax.mlexpr =
  fun s  ->
    let uu____959 = FStar_Ident.lid_of_str s in lid_to_top_name uu____959
let mk_tac_embedding_path:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax -> FStar_Extraction_ML_Syntax.mlexpr'
  =
  fun t  ->
    let uu____968 =
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid ->
          "FStar_Reflection_Basic.embed_unit"
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.string_lid ->
          "FStar_Reflection_Basic.embed_string"
      | uu____971 ->
          let uu____972 =
            let uu____973 = FStar_Syntax_Print.term_to_string t in
            FStar_Util.format1 "Embedding not defined for type %s" uu____973 in
          failwith uu____972 in
    FStar_All.pipe_right uu____968 str_to_name
let mk_tac_unembedding_path:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax -> FStar_Extraction_ML_Syntax.mlexpr'
  =
  fun t  ->
    let uu____982 =
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid ->
          "FStar_Reflection_Basic.unembed_unit"
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.string_lid ->
          "FStar_Reflection_Basic.unembed_string"
      | uu____985 ->
          let uu____986 =
            let uu____987 = FStar_Syntax_Print.term_to_string t in
            FStar_Util.format1 "Unembedding not defined for type %s"
              uu____987 in
          failwith uu____986 in
    FStar_All.pipe_right uu____982 str_to_name
let mk_tac_param_type t =
  let uu____1001 =
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_fvar fv when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid ->
        "FStar_TypeChecker_Common.t_unit"
    | uu____1003 -> failwith "Type term not defined for " in
  FStar_All.pipe_right uu____1001 str_to_name
let mk_interpretation_fun tac_lid assm_lid t bs =
  let arg_types =
    FStar_List.map (fun x  -> (fst x).FStar_Syntax_Syntax.sort) bs in
  let arity = FStar_List.length bs in
  let h =
    let uu____1058 =
      let uu____1059 = FStar_Util.string_of_int arity in
      Prims.strcat "FStar_Tactics_Interpreter.mk_tactic_interpretation_"
        uu____1059 in
    str_to_top_name uu____1058 in
  let tac_fun =
    let uu____1067 =
      let uu____1071 =
        let uu____1072 =
          let uu____1073 = FStar_Util.string_of_int arity in
          Prims.strcat "FStar_Tactics_Native.from_tactic_" uu____1073 in
        str_to_top_name uu____1072 in
      let uu____1080 =
        let uu____1082 = lid_to_top_name tac_lid in [uu____1082] in
      (uu____1071, uu____1080) in
    FStar_Extraction_ML_Syntax.MLE_App uu____1067 in
  let tac_lid_app =
    let uu____1085 =
      let uu____1089 = str_to_top_name "FStar_Ident.lid_of_str" in
      (uu____1089,
        [FStar_Extraction_ML_Syntax.with_ty
           FStar_Extraction_ML_Syntax.MLTY_Top assm_lid]) in
    FStar_Extraction_ML_Syntax.MLE_App uu____1085 in
  let args =
    let uu____1093 =
      let uu____1095 = str_to_name "ps" in [uu____1095; tac_fun] in
    let uu____1096 =
      let uu____1098 = FStar_List.map mk_tac_unembedding_path arg_types in
      let uu____1102 =
        let uu____1104 = mk_tac_embedding_path t in
        let uu____1105 =
          let uu____1107 = mk_tac_param_type t in
          let uu____1108 =
            let uu____1110 =
              let uu____1112 = str_to_name "args" in [uu____1112] in
            tac_lid_app :: uu____1110 in
          uu____1107 :: uu____1108 in
        uu____1104 :: uu____1105 in
      FStar_List.append uu____1098 uu____1102 in
    FStar_List.append uu____1093 uu____1096 in
  let app =
    let uu____1114 =
      let uu____1115 =
        let uu____1119 =
          FStar_List.map
            (FStar_Extraction_ML_Syntax.with_ty
               FStar_Extraction_ML_Syntax.MLTY_Top) args in
        (h, uu____1119) in
      FStar_Extraction_ML_Syntax.MLE_App uu____1115 in
    FStar_All.pipe_left
      (FStar_Extraction_ML_Syntax.with_ty FStar_Extraction_ML_Syntax.MLTY_Top)
      uu____1114 in
  FStar_Extraction_ML_Syntax.MLE_Fun
    ([(("ps", (Prims.parse_int "0")), FStar_Extraction_ML_Syntax.MLTY_Top);
     (("args", (Prims.parse_int "0")), FStar_Extraction_ML_Syntax.MLTY_Top)],
      app)
>>>>>>> origin/guido_tactics
