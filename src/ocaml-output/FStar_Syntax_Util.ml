open Prims
let qual_id: FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident =
  fun lid  ->
    fun id  ->
      let uu____9 =
        FStar_Ident.lid_of_ids
          (FStar_List.append lid.FStar_Ident.ns [lid.FStar_Ident.ident; id]) in
      FStar_Ident.set_lid_range uu____9 id.FStar_Ident.idRange
let mk_discriminator: FStar_Ident.lident -> FStar_Ident.lident =
  fun lid  ->
    FStar_Ident.lid_of_ids
      (FStar_List.append lid.FStar_Ident.ns
         [FStar_Ident.mk_ident
            ((Prims.strcat FStar_Ident.reserved_prefix
                (Prims.strcat "is_"
                   (lid.FStar_Ident.ident).FStar_Ident.idText)),
              ((lid.FStar_Ident.ident).FStar_Ident.idRange))])
let is_name: FStar_Ident.lident -> Prims.bool =
  fun lid  ->
    let c =
      FStar_Util.char_at (lid.FStar_Ident.ident).FStar_Ident.idText
        (Prims.parse_int "0") in
    FStar_Util.is_upper c
let arg_of_non_null_binder uu____31 =
  match uu____31 with
  | (b,imp) ->
      let uu____36 = FStar_Syntax_Syntax.bv_to_name b in (uu____36, imp)
let args_of_non_null_binders:
  FStar_Syntax_Syntax.binders ->
    (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun binders  ->
    FStar_All.pipe_right binders
      (FStar_List.collect
         (fun b  ->
<<<<<<< HEAD
            let uu____45 = FStar_Syntax_Syntax.is_null_binder b in
            if uu____45
            then []
            else (let uu____52 = arg_of_non_null_binder b in [uu____52])))
=======
            let uu____50 = FStar_Syntax_Syntax.is_null_binder b in
            if uu____50
            then []
            else (let uu____57 = arg_of_non_null_binder b in [uu____57])))
>>>>>>> origin/guido_tactics
let args_of_binders:
  FStar_Syntax_Syntax.binders ->
    ((FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list*
      (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.aqual) Prims.list)
  =
  fun binders  ->
<<<<<<< HEAD
    let uu____66 =
      FStar_All.pipe_right binders
        (FStar_List.map
           (fun b  ->
              let uu____92 = FStar_Syntax_Syntax.is_null_binder b in
              if uu____92
              then
                let b1 =
                  let uu____102 =
                    FStar_Syntax_Syntax.new_bv None
                      (fst b).FStar_Syntax_Syntax.sort in
                  (uu____102, (snd b)) in
                let uu____103 = arg_of_non_null_binder b1 in (b1, uu____103)
              else
                (let uu____111 = arg_of_non_null_binder b in (b, uu____111)))) in
    FStar_All.pipe_right uu____66 FStar_List.unzip
=======
    let uu____72 =
      FStar_All.pipe_right binders
        (FStar_List.map
           (fun b  ->
              let uu____94 = FStar_Syntax_Syntax.is_null_binder b in
              if uu____94
              then
                let b1 =
                  let uu____104 =
                    FStar_Syntax_Syntax.new_bv None
                      (fst b).FStar_Syntax_Syntax.sort in
                  (uu____104, (snd b)) in
                let uu____105 = arg_of_non_null_binder b1 in (b1, uu____105)
              else
                (let uu____113 = arg_of_non_null_binder b in (b, uu____113)))) in
    FStar_All.pipe_right uu____72 FStar_List.unzip
>>>>>>> origin/guido_tactics
let name_binders:
  FStar_Syntax_Syntax.binder Prims.list ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun binders  ->
    FStar_All.pipe_right binders
      (FStar_List.mapi
         (fun i  ->
            fun b  ->
<<<<<<< HEAD
              let uu____159 = FStar_Syntax_Syntax.is_null_binder b in
              if uu____159
              then
                let uu____162 = b in
                match uu____162 with
                | (a,imp) ->
                    let b1 =
                      let uu____168 =
                        let uu____169 = FStar_Util.string_of_int i in
                        Prims.strcat "_" uu____169 in
                      FStar_Ident.id_of_text uu____168 in
=======
              let uu____154 = FStar_Syntax_Syntax.is_null_binder b in
              if uu____154
              then
                let uu____157 = b in
                match uu____157 with
                | (a,imp) ->
                    let b1 =
                      let uu____163 =
                        let uu____164 = FStar_Util.string_of_int i in
                        Prims.strcat "_" uu____164 in
                      FStar_Ident.id_of_text uu____163 in
>>>>>>> origin/guido_tactics
                    let b2 =
                      {
                        FStar_Syntax_Syntax.ppname = b1;
                        FStar_Syntax_Syntax.index = (Prims.parse_int "0");
                        FStar_Syntax_Syntax.sort =
                          (a.FStar_Syntax_Syntax.sort)
                      } in
                    (b2, imp)
              else b))
let name_function_binders t =
  match t.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_arrow (binders,comp) ->
<<<<<<< HEAD
      let uu____197 =
        let uu____200 =
          let uu____201 =
            let uu____209 = name_binders binders in (uu____209, comp) in
          FStar_Syntax_Syntax.Tm_arrow uu____201 in
        FStar_Syntax_Syntax.mk uu____200 in
      uu____197 None t.FStar_Syntax_Syntax.pos
  | uu____226 -> t
=======
      let uu____194 =
        let uu____197 =
          let uu____198 =
            let uu____206 = name_binders binders in (uu____206, comp) in
          FStar_Syntax_Syntax.Tm_arrow uu____198 in
        FStar_Syntax_Syntax.mk uu____197 in
      uu____194 None t.FStar_Syntax_Syntax.pos
  | uu____223 -> t
>>>>>>> origin/guido_tactics
let null_binders_of_tks:
  (FStar_Syntax_Syntax.typ* FStar_Syntax_Syntax.aqual) Prims.list ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun tks  ->
    FStar_All.pipe_right tks
      (FStar_List.map
<<<<<<< HEAD
         (fun uu____250  ->
            match uu____250 with
            | (t,imp) ->
                let uu____257 =
                  let uu____258 = FStar_Syntax_Syntax.null_binder t in
                  FStar_All.pipe_left FStar_Pervasives.fst uu____258 in
                (uu____257, imp)))
=======
         (fun uu____244  ->
            match uu____244 with
            | (t,imp) ->
                let uu____251 =
                  let uu____252 = FStar_Syntax_Syntax.null_binder t in
                  FStar_All.pipe_left FStar_Pervasives.fst uu____252 in
                (uu____251, imp)))
>>>>>>> origin/guido_tactics
let binders_of_tks:
  (FStar_Syntax_Syntax.typ* FStar_Syntax_Syntax.aqual) Prims.list ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun tks  ->
    FStar_All.pipe_right tks
      (FStar_List.map
<<<<<<< HEAD
         (fun uu____288  ->
            match uu____288 with
            | (t,imp) ->
                let uu____301 =
                  FStar_Syntax_Syntax.new_bv
                    (Some (t.FStar_Syntax_Syntax.pos)) t in
                (uu____301, imp)))
=======
         (fun uu____279  ->
            match uu____279 with
            | (t,imp) ->
                let uu____292 =
                  FStar_Syntax_Syntax.new_bv
                    (Some (t.FStar_Syntax_Syntax.pos)) t in
                (uu____292, imp)))
>>>>>>> origin/guido_tactics
let binders_of_freevars:
  FStar_Syntax_Syntax.bv FStar_Util.set ->
    FStar_Syntax_Syntax.binder Prims.list
  =
  fun fvs  ->
<<<<<<< HEAD
    let uu____308 = FStar_Util.set_elements fvs in
    FStar_All.pipe_right uu____308
=======
    let uu____300 = FStar_Util.set_elements fvs in
    FStar_All.pipe_right uu____300
>>>>>>> origin/guido_tactics
      (FStar_List.map FStar_Syntax_Syntax.mk_binder)
let mk_subst s = [s]
let subst_of_list:
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.subst_t
  =
  fun formals  ->
    fun actuals  ->
      if (FStar_List.length formals) = (FStar_List.length actuals)
      then
        FStar_List.fold_right2
          (fun f  ->
             fun a  ->
               fun out  -> (FStar_Syntax_Syntax.NT ((fst f), (fst a))) :: out)
          formals actuals []
      else failwith "Ill-formed substitution"
let rename_binders:
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.subst_t
  =
  fun replace_xs  ->
    fun with_ys  ->
      if (FStar_List.length replace_xs) = (FStar_List.length with_ys)
      then
        FStar_List.map2
<<<<<<< HEAD
          (fun uu____386  ->
             fun uu____387  ->
               match (uu____386, uu____387) with
               | ((x,uu____397),(y,uu____399)) ->
                   let uu____404 =
                     let uu____409 = FStar_Syntax_Syntax.bv_to_name y in
                     (x, uu____409) in
                   FStar_Syntax_Syntax.NT uu____404) replace_xs with_ys
=======
          (fun uu____382  ->
             fun uu____383  ->
               match (uu____382, uu____383) with
               | ((x,uu____393),(y,uu____395)) ->
                   let uu____400 =
                     let uu____405 = FStar_Syntax_Syntax.bv_to_name y in
                     (x, uu____405) in
                   FStar_Syntax_Syntax.NT uu____400) replace_xs with_ys
>>>>>>> origin/guido_tactics
      else failwith "Ill-formed substitution"
let rec unmeta: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun e  ->
    let e1 = FStar_Syntax_Subst.compress e in
    match e1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_meta (e2,uu____416) -> unmeta e2
    | FStar_Syntax_Syntax.Tm_ascribed (e2,uu____422,uu____423) -> unmeta e2
    | uu____452 -> e1
=======
    | FStar_Syntax_Syntax.Tm_meta (e2,uu____413) -> unmeta e2
    | FStar_Syntax_Syntax.Tm_ascribed (e2,uu____419,uu____420) -> unmeta e2
    | uu____449 -> e1
>>>>>>> origin/guido_tactics
let rec univ_kernel:
  FStar_Syntax_Syntax.universe -> (FStar_Syntax_Syntax.universe* Prims.int) =
  fun u  ->
    match u with
    | FStar_Syntax_Syntax.U_unknown  -> (u, (Prims.parse_int "0"))
<<<<<<< HEAD
    | FStar_Syntax_Syntax.U_name uu____460 -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_unif uu____461 -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_zero  -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_succ u1 ->
        let uu____467 = univ_kernel u1 in
        (match uu____467 with | (k,n1) -> (k, (n1 + (Prims.parse_int "1"))))
    | FStar_Syntax_Syntax.U_max uu____474 ->
        failwith "Imposible: univ_kernel (U_max _)"
    | FStar_Syntax_Syntax.U_bvar uu____478 ->
        failwith "Imposible: univ_kernel (U_bvar _)"
let constant_univ_as_nat: FStar_Syntax_Syntax.universe -> Prims.int =
  fun u  -> let uu____484 = univ_kernel u in snd uu____484
=======
    | FStar_Syntax_Syntax.U_name uu____458 -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_unif uu____459 -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_zero  -> (u, (Prims.parse_int "0"))
    | FStar_Syntax_Syntax.U_succ u1 ->
        let uu____463 = univ_kernel u1 in
        (match uu____463 with | (k,n1) -> (k, (n1 + (Prims.parse_int "1"))))
    | FStar_Syntax_Syntax.U_max uu____470 ->
        failwith "Imposible: univ_kernel (U_max _)"
    | FStar_Syntax_Syntax.U_bvar uu____474 ->
        failwith "Imposible: univ_kernel (U_bvar _)"
let constant_univ_as_nat: FStar_Syntax_Syntax.universe -> Prims.int =
  fun u  -> let uu____481 = univ_kernel u in snd uu____481
>>>>>>> origin/guido_tactics
let rec compare_univs:
  FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe -> Prims.int =
  fun u1  ->
    fun u2  ->
      match (u1, u2) with
<<<<<<< HEAD
      | (FStar_Syntax_Syntax.U_bvar uu____493,uu____494) ->
          failwith "Impossible: compare_univs"
      | (uu____495,FStar_Syntax_Syntax.U_bvar uu____496) ->
          failwith "Impossible: compare_univs"
      | (FStar_Syntax_Syntax.U_unknown ,FStar_Syntax_Syntax.U_unknown ) ->
          Prims.parse_int "0"
      | (FStar_Syntax_Syntax.U_unknown ,uu____497) -> - (Prims.parse_int "1")
      | (uu____498,FStar_Syntax_Syntax.U_unknown ) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_zero ) ->
          Prims.parse_int "0"
      | (FStar_Syntax_Syntax.U_zero ,uu____499) -> - (Prims.parse_int "1")
      | (uu____500,FStar_Syntax_Syntax.U_zero ) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_name u11,FStar_Syntax_Syntax.U_name u21) ->
          FStar_String.compare u11.FStar_Ident.idText u21.FStar_Ident.idText
      | (FStar_Syntax_Syntax.U_name uu____503,FStar_Syntax_Syntax.U_unif
         uu____504) -> - (Prims.parse_int "1")
      | (FStar_Syntax_Syntax.U_unif uu____509,FStar_Syntax_Syntax.U_name
         uu____510) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_unif u11,FStar_Syntax_Syntax.U_unif u21) ->
          let uu____525 = FStar_Syntax_Unionfind.univ_uvar_id u11 in
          let uu____526 = FStar_Syntax_Unionfind.univ_uvar_id u21 in
          uu____525 - uu____526
=======
      | (FStar_Syntax_Syntax.U_bvar uu____492,uu____493) ->
          failwith "Impossible: compare_univs"
      | (uu____494,FStar_Syntax_Syntax.U_bvar uu____495) ->
          failwith "Impossible: compare_univs"
      | (FStar_Syntax_Syntax.U_unknown ,FStar_Syntax_Syntax.U_unknown ) ->
          Prims.parse_int "0"
      | (FStar_Syntax_Syntax.U_unknown ,uu____496) -> - (Prims.parse_int "1")
      | (uu____497,FStar_Syntax_Syntax.U_unknown ) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_zero ) ->
          Prims.parse_int "0"
      | (FStar_Syntax_Syntax.U_zero ,uu____498) -> - (Prims.parse_int "1")
      | (uu____499,FStar_Syntax_Syntax.U_zero ) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_name u11,FStar_Syntax_Syntax.U_name u21) ->
          FStar_String.compare u11.FStar_Ident.idText u21.FStar_Ident.idText
      | (FStar_Syntax_Syntax.U_name uu____502,FStar_Syntax_Syntax.U_unif
         uu____503) -> - (Prims.parse_int "1")
      | (FStar_Syntax_Syntax.U_unif uu____506,FStar_Syntax_Syntax.U_name
         uu____507) -> Prims.parse_int "1"
      | (FStar_Syntax_Syntax.U_unif u11,FStar_Syntax_Syntax.U_unif u21) ->
          let uu____516 = FStar_Syntax_Unionfind.univ_uvar_id u11 in
          let uu____517 = FStar_Syntax_Unionfind.univ_uvar_id u21 in
          uu____516 - uu____517
>>>>>>> origin/guido_tactics
      | (FStar_Syntax_Syntax.U_max us1,FStar_Syntax_Syntax.U_max us2) ->
          let n1 = FStar_List.length us1 in
          let n2 = FStar_List.length us2 in
          if n1 <> n2
          then n1 - n2
          else
            (let copt =
<<<<<<< HEAD
               let uu____547 = FStar_List.zip us1 us2 in
               FStar_Util.find_map uu____547
                 (fun uu____557  ->
                    match uu____557 with
=======
               let uu____549 = FStar_List.zip us1 us2 in
               FStar_Util.find_map uu____549
                 (fun uu____555  ->
                    match uu____555 with
>>>>>>> origin/guido_tactics
                    | (u11,u21) ->
                        let c = compare_univs u11 u21 in
                        if c <> (Prims.parse_int "0") then Some c else None) in
             match copt with | None  -> Prims.parse_int "0" | Some c -> c)
<<<<<<< HEAD
      | (FStar_Syntax_Syntax.U_max uu____567,uu____568) ->
          - (Prims.parse_int "1")
      | (uu____570,FStar_Syntax_Syntax.U_max uu____571) ->
          Prims.parse_int "1"
      | uu____573 ->
          let uu____576 = univ_kernel u1 in
          (match uu____576 with
           | (k1,n1) ->
               let uu____581 = univ_kernel u2 in
               (match uu____581 with
=======
      | (FStar_Syntax_Syntax.U_max uu____565,uu____566) ->
          - (Prims.parse_int "1")
      | (uu____568,FStar_Syntax_Syntax.U_max uu____569) ->
          Prims.parse_int "1"
      | uu____571 ->
          let uu____574 = univ_kernel u1 in
          (match uu____574 with
           | (k1,n1) ->
               let uu____579 = univ_kernel u2 in
               (match uu____579 with
>>>>>>> origin/guido_tactics
                | (k2,n2) ->
                    let r = compare_univs k1 k2 in
                    if r = (Prims.parse_int "0") then n1 - n2 else r))
let eq_univs:
  FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe -> Prims.bool
  =
  fun u1  ->
    fun u2  ->
      let uu____594 = compare_univs u1 u2 in
      uu____594 = (Prims.parse_int "0")
let ml_comp:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax ->
    FStar_Range.range -> FStar_Syntax_Syntax.comp
  =
  fun t  ->
    fun r  ->
      FStar_Syntax_Syntax.mk_Comp
        {
          FStar_Syntax_Syntax.comp_univs = [FStar_Syntax_Syntax.U_zero];
          FStar_Syntax_Syntax.effect_name =
            (FStar_Ident.set_lid_range FStar_Syntax_Const.effect_ML_lid r);
          FStar_Syntax_Syntax.result_typ = t;
          FStar_Syntax_Syntax.effect_args = [];
          FStar_Syntax_Syntax.flags = [FStar_Syntax_Syntax.MLEFFECT]
        }
let comp_effect_name c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp c1 -> c1.FStar_Syntax_Syntax.effect_name
<<<<<<< HEAD
  | FStar_Syntax_Syntax.Total uu____621 -> FStar_Syntax_Const.effect_Tot_lid
  | FStar_Syntax_Syntax.GTotal uu____627 ->
      FStar_Syntax_Const.effect_GTot_lid
let comp_flags c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____645 -> [FStar_Syntax_Syntax.TOTAL]
  | FStar_Syntax_Syntax.GTotal uu____651 -> [FStar_Syntax_Syntax.SOMETRIVIAL]
=======
  | FStar_Syntax_Syntax.Total uu____625 -> FStar_Syntax_Const.effect_Tot_lid
  | FStar_Syntax_Syntax.GTotal uu____631 ->
      FStar_Syntax_Const.effect_GTot_lid
let comp_flags c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____651 -> [FStar_Syntax_Syntax.TOTAL]
  | FStar_Syntax_Syntax.GTotal uu____657 -> [FStar_Syntax_Syntax.SOMETRIVIAL]
>>>>>>> origin/guido_tactics
  | FStar_Syntax_Syntax.Comp ct -> ct.FStar_Syntax_Syntax.flags
let comp_set_flags:
  FStar_Syntax_Syntax.comp ->
    FStar_Syntax_Syntax.cflags Prims.list ->
      (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax
  =
  fun c  ->
    fun f  ->
      let comp_to_comp_typ c1 =
        match c1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Comp c2 -> c2
        | FStar_Syntax_Syntax.Total (t,u_opt) ->
<<<<<<< HEAD
            let uu____681 =
              let uu____682 = FStar_Util.map_opt u_opt (fun x  -> [x]) in
              FStar_Util.dflt [] uu____682 in
            {
              FStar_Syntax_Syntax.comp_univs = uu____681;
=======
            let uu____689 =
              let uu____690 = FStar_Util.map_opt u_opt (fun x  -> [x]) in
              FStar_Util.dflt [] uu____690 in
            {
              FStar_Syntax_Syntax.comp_univs = uu____689;
>>>>>>> origin/guido_tactics
              FStar_Syntax_Syntax.effect_name = (comp_effect_name c1);
              FStar_Syntax_Syntax.result_typ = t;
              FStar_Syntax_Syntax.effect_args = [];
              FStar_Syntax_Syntax.flags = (comp_flags c1)
            }
        | FStar_Syntax_Syntax.GTotal (t,u_opt) ->
<<<<<<< HEAD
            let uu____701 =
              let uu____702 = FStar_Util.map_opt u_opt (fun x  -> [x]) in
              FStar_Util.dflt [] uu____702 in
            {
              FStar_Syntax_Syntax.comp_univs = uu____701;
=======
            let uu____708 =
              let uu____709 = FStar_Util.map_opt u_opt (fun x  -> [x]) in
              FStar_Util.dflt [] uu____709 in
            {
              FStar_Syntax_Syntax.comp_univs = uu____708;
>>>>>>> origin/guido_tactics
              FStar_Syntax_Syntax.effect_name = (comp_effect_name c1);
              FStar_Syntax_Syntax.result_typ = t;
              FStar_Syntax_Syntax.effect_args = [];
              FStar_Syntax_Syntax.flags = (comp_flags c1)
            } in
<<<<<<< HEAD
      let uu___164_713 = c in
      let uu____714 =
        let uu____715 =
          let uu___165_716 = comp_to_comp_typ c in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___165_716.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___165_716.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ =
              (uu___165_716.FStar_Syntax_Syntax.result_typ);
            FStar_Syntax_Syntax.effect_args =
              (uu___165_716.FStar_Syntax_Syntax.effect_args);
            FStar_Syntax_Syntax.flags = f
          } in
        FStar_Syntax_Syntax.Comp uu____715 in
      {
        FStar_Syntax_Syntax.n = uu____714;
        FStar_Syntax_Syntax.tk = (uu___164_713.FStar_Syntax_Syntax.tk);
        FStar_Syntax_Syntax.pos = (uu___164_713.FStar_Syntax_Syntax.pos);
        FStar_Syntax_Syntax.vars = (uu___164_713.FStar_Syntax_Syntax.vars)
=======
      let uu___174_719 = c in
      let uu____720 =
        let uu____721 =
          let uu___175_722 = comp_to_comp_typ c in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___175_722.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___175_722.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ =
              (uu___175_722.FStar_Syntax_Syntax.result_typ);
            FStar_Syntax_Syntax.effect_args =
              (uu___175_722.FStar_Syntax_Syntax.effect_args);
            FStar_Syntax_Syntax.flags = f
          } in
        FStar_Syntax_Syntax.Comp uu____721 in
      {
        FStar_Syntax_Syntax.n = uu____720;
        FStar_Syntax_Syntax.tk = (uu___174_719.FStar_Syntax_Syntax.tk);
        FStar_Syntax_Syntax.pos = (uu___174_719.FStar_Syntax_Syntax.pos);
        FStar_Syntax_Syntax.vars = (uu___174_719.FStar_Syntax_Syntax.vars)
>>>>>>> origin/guido_tactics
      }
let comp_to_comp_typ:
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp_typ =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Comp c1 -> c1
    | FStar_Syntax_Syntax.Total (t,Some u) ->
        {
          FStar_Syntax_Syntax.comp_univs = [u];
          FStar_Syntax_Syntax.effect_name = (comp_effect_name c);
          FStar_Syntax_Syntax.result_typ = t;
          FStar_Syntax_Syntax.effect_args = [];
          FStar_Syntax_Syntax.flags = (comp_flags c)
        }
    | FStar_Syntax_Syntax.GTotal (t,Some u) ->
        {
          FStar_Syntax_Syntax.comp_univs = [u];
          FStar_Syntax_Syntax.effect_name = (comp_effect_name c);
          FStar_Syntax_Syntax.result_typ = t;
          FStar_Syntax_Syntax.effect_args = [];
          FStar_Syntax_Syntax.flags = (comp_flags c)
        }
<<<<<<< HEAD
    | uu____747 ->
=======
    | uu____754 ->
>>>>>>> origin/guido_tactics
        failwith "Assertion failed: Computation type without universe"
let is_named_tot c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp c1 ->
      FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name
        FStar_Syntax_Const.effect_Tot_lid
<<<<<<< HEAD
  | FStar_Syntax_Syntax.Total uu____760 -> true
  | FStar_Syntax_Syntax.GTotal uu____766 -> false
let is_total_comp c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
       (fun uu___152_785  ->
          match uu___152_785 with
          | FStar_Syntax_Syntax.TOTAL  -> true
          | FStar_Syntax_Syntax.RETURN  -> true
          | uu____786 -> false))
=======
  | FStar_Syntax_Syntax.Total uu____769 -> true
  | FStar_Syntax_Syntax.GTotal uu____775 -> false
let is_total_comp c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
       (fun uu___162_795  ->
          match uu___162_795 with
          | FStar_Syntax_Syntax.TOTAL  -> true
          | FStar_Syntax_Syntax.RETURN  -> true
          | uu____796 -> false))
>>>>>>> origin/guido_tactics
let is_total_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c  ->
    (FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name
       FStar_Syntax_Const.effect_Tot_lid)
      ||
      (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags
         (FStar_Util.for_some
<<<<<<< HEAD
            (fun uu___153_792  ->
               match uu___153_792 with
               | FStar_Syntax_Syntax.TOTAL  -> true
               | FStar_Syntax_Syntax.RETURN  -> true
               | uu____793 -> false)))
=======
            (fun uu___163_802  ->
               match uu___163_802 with
               | FStar_Syntax_Syntax.TOTAL  -> true
               | FStar_Syntax_Syntax.RETURN  -> true
               | uu____803 -> false)))
>>>>>>> origin/guido_tactics
let is_tot_or_gtot_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c  ->
    ((FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name
        FStar_Syntax_Const.effect_Tot_lid)
       ||
       (FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name
          FStar_Syntax_Const.effect_GTot_lid))
      ||
      (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags
         (FStar_Util.for_some
<<<<<<< HEAD
            (fun uu___154_799  ->
               match uu___154_799 with
               | FStar_Syntax_Syntax.TOTAL  -> true
               | FStar_Syntax_Syntax.RETURN  -> true
               | uu____800 -> false)))
let is_partial_return c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
       (fun uu___155_814  ->
          match uu___155_814 with
          | FStar_Syntax_Syntax.RETURN  -> true
          | FStar_Syntax_Syntax.PARTIAL_RETURN  -> true
          | uu____815 -> false))
=======
            (fun uu___164_809  ->
               match uu___164_809 with
               | FStar_Syntax_Syntax.TOTAL  -> true
               | FStar_Syntax_Syntax.RETURN  -> true
               | uu____810 -> false)))
let is_partial_return c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
       (fun uu___165_825  ->
          match uu___165_825 with
          | FStar_Syntax_Syntax.RETURN  -> true
          | FStar_Syntax_Syntax.PARTIAL_RETURN  -> true
          | uu____826 -> false))
>>>>>>> origin/guido_tactics
let is_lcomp_partial_return: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c  ->
    FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags
      (FStar_Util.for_some
<<<<<<< HEAD
         (fun uu___156_821  ->
            match uu___156_821 with
            | FStar_Syntax_Syntax.RETURN  -> true
            | FStar_Syntax_Syntax.PARTIAL_RETURN  -> true
            | uu____822 -> false))
=======
         (fun uu___166_832  ->
            match uu___166_832 with
            | FStar_Syntax_Syntax.RETURN  -> true
            | FStar_Syntax_Syntax.PARTIAL_RETURN  -> true
            | uu____833 -> false))
>>>>>>> origin/guido_tactics
let is_tot_or_gtot_comp c =
  (is_total_comp c) ||
    (FStar_Ident.lid_equals FStar_Syntax_Const.effect_GTot_lid
       (comp_effect_name c))
let is_pure_effect: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    ((FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Tot_lid) ||
       (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_PURE_lid))
      || (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Pure_lid)
let is_pure_comp c =
  match c.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
  | FStar_Syntax_Syntax.Total uu____848 -> true
  | FStar_Syntax_Syntax.GTotal uu____854 -> false
=======
  | FStar_Syntax_Syntax.Total uu____864 -> true
  | FStar_Syntax_Syntax.GTotal uu____870 -> false
>>>>>>> origin/guido_tactics
  | FStar_Syntax_Syntax.Comp ct ->
      ((is_total_comp c) ||
         (is_pure_effect ct.FStar_Syntax_Syntax.effect_name))
        ||
        (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
           (FStar_Util.for_some
<<<<<<< HEAD
              (fun uu___157_863  ->
                 match uu___157_863 with
                 | FStar_Syntax_Syntax.LEMMA  -> true
                 | uu____864 -> false)))
=======
              (fun uu___167_878  ->
                 match uu___167_878 with
                 | FStar_Syntax_Syntax.LEMMA  -> true
                 | uu____879 -> false)))
>>>>>>> origin/guido_tactics
let is_ghost_effect: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    ((FStar_Ident.lid_equals FStar_Syntax_Const.effect_GTot_lid l) ||
       (FStar_Ident.lid_equals FStar_Syntax_Const.effect_GHOST_lid l))
      || (FStar_Ident.lid_equals FStar_Syntax_Const.effect_Ghost_lid l)
let is_pure_or_ghost_comp c =
  (is_pure_comp c) || (is_ghost_effect (comp_effect_name c))
let is_pure_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun lc  ->
    ((is_total_lcomp lc) || (is_pure_effect lc.FStar_Syntax_Syntax.eff_name))
      ||
      (FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
         (FStar_Util.for_some
<<<<<<< HEAD
            (fun uu___158_884  ->
               match uu___158_884 with
               | FStar_Syntax_Syntax.LEMMA  -> true
               | uu____885 -> false)))
=======
            (fun uu___168_902  ->
               match uu___168_902 with
               | FStar_Syntax_Syntax.LEMMA  -> true
               | uu____903 -> false)))
>>>>>>> origin/guido_tactics
let is_pure_or_ghost_lcomp: FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun lc  ->
    (is_pure_lcomp lc) || (is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
let is_pure_or_ghost_function: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
<<<<<<< HEAD
    let uu____892 =
      let uu____893 = FStar_Syntax_Subst.compress t in
      uu____893.FStar_Syntax_Syntax.n in
    match uu____892 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____896,c) -> is_pure_or_ghost_comp c
    | uu____908 -> true
let is_lemma: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____912 =
      let uu____913 = FStar_Syntax_Subst.compress t in
      uu____913.FStar_Syntax_Syntax.n in
    match uu____912 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____916,c) ->
        (match c.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Comp ct ->
             FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
               FStar_Syntax_Const.effect_Lemma_lid
         | uu____929 -> false)
    | uu____930 -> false
=======
    let uu____912 =
      let uu____913 = FStar_Syntax_Subst.compress t in
      uu____913.FStar_Syntax_Syntax.n in
    match uu____912 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____916,c) -> is_pure_or_ghost_comp c
    | uu____928 -> true
let is_lemma_comp c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp ct ->
      FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
        FStar_Syntax_Const.effect_Lemma_lid
  | uu____943 -> false
let is_lemma: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____948 =
      let uu____949 = FStar_Syntax_Subst.compress t in
      uu____949.FStar_Syntax_Syntax.n in
    match uu____948 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____952,c) -> is_lemma_comp c
    | uu____964 -> false
>>>>>>> origin/guido_tactics
let head_and_args:
  FStar_Syntax_Syntax.term ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax*
      ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list)
  =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_app (head1,args) -> (head1, args)
<<<<<<< HEAD
    | uu____976 -> (t1, [])
=======
    | uu____1011 -> (t1, [])
let rec head_and_args':
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.term*
      ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list)
  =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_app (head1,args) ->
        let uu____1056 = head_and_args' head1 in
        (match uu____1056 with
         | (head2,args') -> (head2, (FStar_List.append args' args)))
    | uu____1092 -> (t1, [])
>>>>>>> origin/guido_tactics
let un_uinst: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_uinst (t2,uu____991) ->
        FStar_Syntax_Subst.compress t2
    | uu____996 -> t1
let is_smt_lemma: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1000 =
      let uu____1001 = FStar_Syntax_Subst.compress t in
      uu____1001.FStar_Syntax_Syntax.n in
    match uu____1000 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____1004,c) ->
=======
    | FStar_Syntax_Syntax.Tm_uinst (t2,uu____1108) ->
        FStar_Syntax_Subst.compress t2
    | uu____1113 -> t1
let is_smt_lemma: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1118 =
      let uu____1119 = FStar_Syntax_Subst.compress t in
      uu____1119.FStar_Syntax_Syntax.n in
    match uu____1118 with
    | FStar_Syntax_Syntax.Tm_arrow (uu____1122,c) ->
>>>>>>> origin/guido_tactics
        (match c.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Comp ct when
             FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
               FStar_Syntax_Const.effect_Lemma_lid
             ->
             (match ct.FStar_Syntax_Syntax.effect_args with
<<<<<<< HEAD
              | _req::_ens::(pats,uu____1020)::uu____1021 ->
                  let pats' = unmeta pats in
                  let uu____1052 = head_and_args pats' in
                  (match uu____1052 with
                   | (head1,uu____1063) ->
                       let uu____1078 =
                         let uu____1079 = un_uinst head1 in
                         uu____1079.FStar_Syntax_Syntax.n in
                       (match uu____1078 with
                        | FStar_Syntax_Syntax.Tm_fvar fv ->
                            FStar_Syntax_Syntax.fv_eq_lid fv
                              FStar_Syntax_Const.cons_lid
                        | uu____1083 -> false))
              | uu____1084 -> false)
         | uu____1090 -> false)
    | uu____1091 -> false
=======
              | _req::_ens::(pats,uu____1138)::uu____1139 ->
                  let pats' = unmeta pats in
                  let uu____1170 = head_and_args pats' in
                  (match uu____1170 with
                   | (head1,uu____1181) ->
                       let uu____1196 =
                         let uu____1197 = un_uinst head1 in
                         uu____1197.FStar_Syntax_Syntax.n in
                       (match uu____1196 with
                        | FStar_Syntax_Syntax.Tm_fvar fv ->
                            FStar_Syntax_Syntax.fv_eq_lid fv
                              FStar_Syntax_Const.cons_lid
                        | uu____1201 -> false))
              | uu____1202 -> false)
         | uu____1208 -> false)
    | uu____1209 -> false
>>>>>>> origin/guido_tactics
let is_ml_comp c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Comp c1 ->
      (FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name
         FStar_Syntax_Const.effect_ML_lid)
        ||
        (FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags
           (FStar_Util.for_some
<<<<<<< HEAD
              (fun uu___159_1106  ->
                 match uu___159_1106 with
                 | FStar_Syntax_Syntax.MLEFFECT  -> true
                 | uu____1107 -> false)))
  | uu____1108 -> false
let comp_result c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total (t,uu____1123) -> t
  | FStar_Syntax_Syntax.GTotal (t,uu____1131) -> t
  | FStar_Syntax_Syntax.Comp ct -> ct.FStar_Syntax_Syntax.result_typ
let set_result_typ c t =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____1155 -> FStar_Syntax_Syntax.mk_Total t
  | FStar_Syntax_Syntax.GTotal uu____1161 -> FStar_Syntax_Syntax.mk_GTotal t
  | FStar_Syntax_Syntax.Comp ct ->
      FStar_Syntax_Syntax.mk_Comp
        (let uu___166_1170 = ct in
         {
           FStar_Syntax_Syntax.comp_univs =
             (uu___166_1170.FStar_Syntax_Syntax.comp_univs);
           FStar_Syntax_Syntax.effect_name =
             (uu___166_1170.FStar_Syntax_Syntax.effect_name);
           FStar_Syntax_Syntax.result_typ = t;
           FStar_Syntax_Syntax.effect_args =
             (uu___166_1170.FStar_Syntax_Syntax.effect_args);
           FStar_Syntax_Syntax.flags =
             (uu___166_1170.FStar_Syntax_Syntax.flags)
=======
              (fun uu___169_1225  ->
                 match uu___169_1225 with
                 | FStar_Syntax_Syntax.MLEFFECT  -> true
                 | uu____1226 -> false)))
  | uu____1227 -> false
let comp_result c =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total (t,uu____1244) -> t
  | FStar_Syntax_Syntax.GTotal (t,uu____1252) -> t
  | FStar_Syntax_Syntax.Comp ct -> ct.FStar_Syntax_Syntax.result_typ
let set_result_typ c t =
  match c.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Total uu____1279 -> FStar_Syntax_Syntax.mk_Total t
  | FStar_Syntax_Syntax.GTotal uu____1285 -> FStar_Syntax_Syntax.mk_GTotal t
  | FStar_Syntax_Syntax.Comp ct ->
      FStar_Syntax_Syntax.mk_Comp
        (let uu___176_1292 = ct in
         {
           FStar_Syntax_Syntax.comp_univs =
             (uu___176_1292.FStar_Syntax_Syntax.comp_univs);
           FStar_Syntax_Syntax.effect_name =
             (uu___176_1292.FStar_Syntax_Syntax.effect_name);
           FStar_Syntax_Syntax.result_typ = t;
           FStar_Syntax_Syntax.effect_args =
             (uu___176_1292.FStar_Syntax_Syntax.effect_args);
           FStar_Syntax_Syntax.flags =
             (uu___176_1292.FStar_Syntax_Syntax.flags)
>>>>>>> origin/guido_tactics
         })
let is_trivial_wp c =
  FStar_All.pipe_right (comp_flags c)
    (FStar_Util.for_some
<<<<<<< HEAD
       (fun uu___160_1184  ->
          match uu___160_1184 with
          | FStar_Syntax_Syntax.TOTAL  -> true
          | FStar_Syntax_Syntax.RETURN  -> true
          | uu____1185 -> false))
=======
       (fun uu___170_1307  ->
          match uu___170_1307 with
          | FStar_Syntax_Syntax.TOTAL  -> true
          | FStar_Syntax_Syntax.RETURN  -> true
          | uu____1308 -> false))
>>>>>>> origin/guido_tactics
let primops: FStar_Ident.lident Prims.list =
  [FStar_Syntax_Const.op_Eq;
  FStar_Syntax_Const.op_notEq;
  FStar_Syntax_Const.op_LT;
  FStar_Syntax_Const.op_LTE;
  FStar_Syntax_Const.op_GT;
  FStar_Syntax_Const.op_GTE;
  FStar_Syntax_Const.op_Subtraction;
  FStar_Syntax_Const.op_Minus;
  FStar_Syntax_Const.op_Addition;
  FStar_Syntax_Const.op_Multiply;
  FStar_Syntax_Const.op_Division;
  FStar_Syntax_Const.op_Modulus;
  FStar_Syntax_Const.op_And;
  FStar_Syntax_Const.op_Or;
  FStar_Syntax_Const.op_Negation]
let is_primop_lid: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    FStar_All.pipe_right primops
      (FStar_Util.for_some (FStar_Ident.lid_equals l))
let is_primop f =
  match f.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_fvar fv ->
      is_primop_lid (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
<<<<<<< HEAD
  | uu____1203 -> false
=======
  | uu____1333 -> false
>>>>>>> origin/guido_tactics
let rec unascribe: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun e  ->
    let e1 = FStar_Syntax_Subst.compress e in
    match e1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_ascribed (e2,uu____1209,uu____1210) ->
        unascribe e2
    | uu____1239 -> e1
let rec ascribe t k =
  match t.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_ascribed (t',uu____1281,uu____1282) ->
      ascribe t' k
  | uu____1311 ->
=======
    | FStar_Syntax_Syntax.Tm_ascribed (e2,uu____1340,uu____1341) ->
        unascribe e2
    | uu____1370 -> e1
let rec ascribe t k =
  match t.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_ascribed (t',uu____1415,uu____1416) ->
      ascribe t' k
  | uu____1445 ->
>>>>>>> origin/guido_tactics
      FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed (t, k, None))
        None t.FStar_Syntax_Syntax.pos
type eq_result =
  | Equal
  | NotEqual
  | Unknown
let uu___is_Equal: eq_result -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | Equal  -> true | uu____1333 -> false
let uu___is_NotEqual: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | NotEqual  -> true | uu____1337 -> false
let uu___is_Unknown: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | Unknown  -> true | uu____1341 -> false
=======
    match projectee with | Equal  -> true | uu____1468 -> false
let uu___is_NotEqual: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | NotEqual  -> true | uu____1473 -> false
let uu___is_Unknown: eq_result -> Prims.bool =
  fun projectee  ->
    match projectee with | Unknown  -> true | uu____1478 -> false
>>>>>>> origin/guido_tactics
let rec eq_tm:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term -> eq_result =
  fun t1  ->
    fun t2  ->
<<<<<<< HEAD
      let t11 = unascribe t1 in
      let t21 = unascribe t2 in
      let equal_if uu___161_1361 = if uu___161_1361 then Equal else Unknown in
      let equal_iff uu___162_1366 = if uu___162_1366 then Equal else NotEqual in
      let eq_and f g = match f with | Equal  -> g () | uu____1380 -> Unknown in
=======
      let canon_app t =
        let uu____1499 =
          let uu____1507 = unascribe t in head_and_args' uu____1507 in
        match uu____1499 with
        | (hd1,args) ->
            FStar_Syntax_Syntax.mk_Tm_app hd1 args None
              t.FStar_Syntax_Syntax.pos in
      let t11 = canon_app t1 in
      let t21 = canon_app t2 in
      let equal_if uu___171_1533 = if uu___171_1533 then Equal else Unknown in
      let equal_iff uu___172_1538 = if uu___172_1538 then Equal else NotEqual in
      let eq_and f g = match f with | Equal  -> g () | uu____1552 -> Unknown in
      let eq_inj f g =
        match (f, g) with
        | (Equal ,Equal ) -> Equal
        | (NotEqual ,uu____1560) -> NotEqual
        | (uu____1561,NotEqual ) -> NotEqual
        | (Unknown ,uu____1562) -> Unknown
        | (uu____1563,Unknown ) -> Unknown in
>>>>>>> origin/guido_tactics
      match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n)) with
      | (FStar_Syntax_Syntax.Tm_name a,FStar_Syntax_Syntax.Tm_name b) ->
          equal_if (FStar_Syntax_Syntax.bv_eq a b)
      | (FStar_Syntax_Syntax.Tm_fvar f,FStar_Syntax_Syntax.Tm_fvar g) ->
<<<<<<< HEAD
          let uu____1385 = FStar_Syntax_Syntax.fv_eq f g in
          equal_if uu____1385
      | (FStar_Syntax_Syntax.Tm_uinst (f,us),FStar_Syntax_Syntax.Tm_uinst
         (g,vs)) ->
          let uu____1398 = eq_tm f g in
          eq_and uu____1398
            (fun uu____1401  ->
               let uu____1402 = eq_univs_list us vs in equal_if uu____1402)
      | (FStar_Syntax_Syntax.Tm_constant c,FStar_Syntax_Syntax.Tm_constant d)
          ->
          let uu____1405 = FStar_Const.eq_const c d in equal_iff uu____1405
      | (FStar_Syntax_Syntax.Tm_uvar
         (u1,uu____1407),FStar_Syntax_Syntax.Tm_uvar (u2,uu____1409)) ->
          let uu____1442 = FStar_Syntax_Unionfind.equiv u1 u2 in
          equal_if uu____1442
      | (FStar_Syntax_Syntax.Tm_app (h1,args1),FStar_Syntax_Syntax.Tm_app
         (h2,args2)) ->
          let uu____1475 = eq_tm h1 h2 in
          eq_and uu____1475 (fun uu____1477  -> eq_args args1 args2)
      | (FStar_Syntax_Syntax.Tm_type u,FStar_Syntax_Syntax.Tm_type v1) ->
          let uu____1480 = eq_univs u v1 in equal_if uu____1480
      | (FStar_Syntax_Syntax.Tm_meta (t12,uu____1482),uu____1483) ->
          eq_tm t12 t21
      | (uu____1488,FStar_Syntax_Syntax.Tm_meta (t22,uu____1490)) ->
          eq_tm t11 t22
      | uu____1495 -> Unknown
=======
          let uu____1568 = FStar_Syntax_Syntax.fv_eq f g in
          equal_if uu____1568
      | (FStar_Syntax_Syntax.Tm_uinst (f,us),FStar_Syntax_Syntax.Tm_uinst
         (g,vs)) ->
          let uu____1581 = eq_tm f g in
          eq_and uu____1581
            (fun uu____1582  ->
               let uu____1583 = eq_univs_list us vs in equal_if uu____1583)
      | (FStar_Syntax_Syntax.Tm_constant c,FStar_Syntax_Syntax.Tm_constant d)
          ->
          let uu____1586 = FStar_Const.eq_const c d in equal_iff uu____1586
      | (FStar_Syntax_Syntax.Tm_uvar
         (u1,uu____1588),FStar_Syntax_Syntax.Tm_uvar (u2,uu____1590)) ->
          let uu____1615 = FStar_Syntax_Unionfind.equiv u1 u2 in
          equal_if uu____1615
      | (FStar_Syntax_Syntax.Tm_app (h1,args1),FStar_Syntax_Syntax.Tm_app
         (h2,args2)) ->
          let uu____1648 =
            let uu____1651 =
              let uu____1652 = un_uinst h1 in
              uu____1652.FStar_Syntax_Syntax.n in
            let uu____1655 =
              let uu____1656 = un_uinst h2 in
              uu____1656.FStar_Syntax_Syntax.n in
            (uu____1651, uu____1655) in
          (match uu____1648 with
           | (FStar_Syntax_Syntax.Tm_fvar f1,FStar_Syntax_Syntax.Tm_fvar f2)
               when
               (f1.FStar_Syntax_Syntax.fv_qual =
                  (Some FStar_Syntax_Syntax.Data_ctor))
                 &&
                 (f2.FStar_Syntax_Syntax.fv_qual =
                    (Some FStar_Syntax_Syntax.Data_ctor))
               ->
               let uu____1663 = FStar_Syntax_Syntax.fv_eq f1 f2 in
               if uu____1663
               then
                 let uu____1665 = FStar_List.zip args1 args2 in
                 FStar_All.pipe_left
                   (FStar_List.fold_left
                      (fun acc  ->
                         fun uu____1695  ->
                           match uu____1695 with
                           | ((a1,q1),(a2,q2)) ->
                               let uu____1711 = eq_tm a1 a2 in
                               eq_inj acc uu____1711) Equal) uu____1665
               else NotEqual
           | uu____1713 ->
               let uu____1716 = eq_tm h1 h2 in
               eq_and uu____1716 (fun uu____1717  -> eq_args args1 args2))
      | (FStar_Syntax_Syntax.Tm_type u,FStar_Syntax_Syntax.Tm_type v1) ->
          let uu____1720 = eq_univs u v1 in equal_if uu____1720
      | (FStar_Syntax_Syntax.Tm_meta (t12,uu____1722),uu____1723) ->
          eq_tm t12 t21
      | (uu____1728,FStar_Syntax_Syntax.Tm_meta (t22,uu____1730)) ->
          eq_tm t11 t22
      | uu____1735 -> Unknown
>>>>>>> origin/guido_tactics
and eq_args:
  FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.args -> eq_result =
  fun a1  ->
    fun a2  ->
      match (a1, a2) with
      | ([],[]) -> Equal
<<<<<<< HEAD
      | ((a,uu____1519)::a11,(b,uu____1522)::b1) ->
          let uu____1560 = eq_tm a b in
          (match uu____1560 with
           | Equal  -> eq_args a11 b1
           | uu____1561 -> Unknown)
      | uu____1562 -> Unknown
=======
      | ((a,uu____1759)::a11,(b,uu____1762)::b1) ->
          let uu____1800 = eq_tm a b in
          (match uu____1800 with
           | Equal  -> eq_args a11 b1
           | uu____1801 -> Unknown)
      | uu____1802 -> Unknown
>>>>>>> origin/guido_tactics
and eq_univs_list:
  FStar_Syntax_Syntax.universes ->
    FStar_Syntax_Syntax.universes -> Prims.bool
  =
  fun us  ->
    fun vs  ->
      ((FStar_List.length us) = (FStar_List.length vs)) &&
        (FStar_List.forall2 eq_univs us vs)
let rec unrefine: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_refine (x,uu____1576) ->
        unrefine x.FStar_Syntax_Syntax.sort
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____1582,uu____1583) ->
        unrefine t2
    | uu____1612 -> t1
let rec is_unit: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1616 =
      let uu____1617 = unrefine t in uu____1617.FStar_Syntax_Syntax.n in
    match uu____1616 with
    | FStar_Syntax_Syntax.Tm_type uu____1620 -> true
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid) ||
          (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.squash_lid)
    | FStar_Syntax_Syntax.Tm_uinst (t1,uu____1623) -> is_unit t1
    | uu____1628 -> false
let rec non_informative: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1632 =
      let uu____1633 = unrefine t in uu____1633.FStar_Syntax_Syntax.n in
    match uu____1632 with
    | FStar_Syntax_Syntax.Tm_type uu____1636 -> true
=======
    | FStar_Syntax_Syntax.Tm_refine (x,uu____1821) ->
        unrefine x.FStar_Syntax_Syntax.sort
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____1827,uu____1828) ->
        unrefine t2
    | uu____1857 -> t1
let rec is_unit: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1862 =
      let uu____1863 = unrefine t in uu____1863.FStar_Syntax_Syntax.n in
    match uu____1862 with
    | FStar_Syntax_Syntax.Tm_type uu____1866 -> true
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid) ||
          (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.squash_lid)
    | FStar_Syntax_Syntax.Tm_uinst (t1,uu____1869) -> is_unit t1
    | uu____1874 -> false
let rec non_informative: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1879 =
      let uu____1880 = unrefine t in uu____1880.FStar_Syntax_Syntax.n in
    match uu____1879 with
    | FStar_Syntax_Syntax.Tm_type uu____1883 -> true
>>>>>>> origin/guido_tactics
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        ((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid) ||
           (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.squash_lid))
          || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.erased_lid)
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_app (head1,uu____1639) -> non_informative head1
    | FStar_Syntax_Syntax.Tm_uinst (t1,uu____1655) -> non_informative t1
    | FStar_Syntax_Syntax.Tm_arrow (uu____1660,c) ->
        (is_tot_or_gtot_comp c) && (non_informative (comp_result c))
    | uu____1672 -> false
let is_fun: FStar_Syntax_Syntax.term -> Prims.bool =
  fun e  ->
    let uu____1676 =
      let uu____1677 = FStar_Syntax_Subst.compress e in
      uu____1677.FStar_Syntax_Syntax.n in
    match uu____1676 with
    | FStar_Syntax_Syntax.Tm_abs uu____1680 -> true
    | uu____1695 -> false
let is_function_typ: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1699 =
      let uu____1700 = FStar_Syntax_Subst.compress t in
      uu____1700.FStar_Syntax_Syntax.n in
    match uu____1699 with
    | FStar_Syntax_Syntax.Tm_arrow uu____1703 -> true
    | uu____1711 -> false
=======
    | FStar_Syntax_Syntax.Tm_app (head1,uu____1886) -> non_informative head1
    | FStar_Syntax_Syntax.Tm_uinst (t1,uu____1902) -> non_informative t1
    | FStar_Syntax_Syntax.Tm_arrow (uu____1907,c) ->
        (is_tot_or_gtot_comp c) && (non_informative (comp_result c))
    | uu____1919 -> false
let is_fun: FStar_Syntax_Syntax.term -> Prims.bool =
  fun e  ->
    let uu____1924 =
      let uu____1925 = FStar_Syntax_Subst.compress e in
      uu____1925.FStar_Syntax_Syntax.n in
    match uu____1924 with
    | FStar_Syntax_Syntax.Tm_abs uu____1928 -> true
    | uu____1938 -> false
let is_function_typ: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____1943 =
      let uu____1944 = FStar_Syntax_Subst.compress t in
      uu____1944.FStar_Syntax_Syntax.n in
    match uu____1943 with
    | FStar_Syntax_Syntax.Tm_arrow uu____1947 -> true
    | uu____1955 -> false
>>>>>>> origin/guido_tactics
let rec pre_typ: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_refine (x,uu____1717) ->
        pre_typ x.FStar_Syntax_Syntax.sort
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____1723,uu____1724) ->
        pre_typ t2
    | uu____1753 -> t1
=======
    | FStar_Syntax_Syntax.Tm_refine (x,uu____1962) ->
        pre_typ x.FStar_Syntax_Syntax.sort
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____1968,uu____1969) ->
        pre_typ t2
    | uu____1998 -> t1
>>>>>>> origin/guido_tactics
let destruct:
  FStar_Syntax_Syntax.term ->
    FStar_Ident.lident ->
      ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list
        option
  =
  fun typ  ->
    fun lid  ->
      let typ1 = FStar_Syntax_Subst.compress typ in
<<<<<<< HEAD
      let uu____1767 =
        let uu____1768 = un_uinst typ1 in uu____1768.FStar_Syntax_Syntax.n in
      match uu____1767 with
=======
      let uu____2014 =
        let uu____2015 = un_uinst typ1 in uu____2015.FStar_Syntax_Syntax.n in
      match uu____2014 with
>>>>>>> origin/guido_tactics
      | FStar_Syntax_Syntax.Tm_app (head1,args) ->
          let head2 = un_uinst head1 in
          (match head2.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_fvar tc when
               FStar_Syntax_Syntax.fv_eq_lid tc lid -> Some args
<<<<<<< HEAD
           | uu____1806 -> None)
      | FStar_Syntax_Syntax.Tm_fvar tc when
          FStar_Syntax_Syntax.fv_eq_lid tc lid -> Some []
      | uu____1822 -> None
=======
           | uu____2053 -> None)
      | FStar_Syntax_Syntax.Tm_fvar tc when
          FStar_Syntax_Syntax.fv_eq_lid tc lid -> Some []
      | uu____2069 -> None
>>>>>>> origin/guido_tactics
let lids_of_sigelt:
  FStar_Syntax_Syntax.sigelt -> FStar_Ident.lident Prims.list =
  fun se  ->
    match se.FStar_Syntax_Syntax.sigel with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Sig_let (uu____1833,lids,uu____1835) -> lids
    | FStar_Syntax_Syntax.Sig_bundle (uu____1840,lids) -> lids
    | FStar_Syntax_Syntax.Sig_inductive_typ
        (lid,uu____1847,uu____1848,uu____1849,uu____1850,uu____1851) -> 
        [lid]
    | FStar_Syntax_Syntax.Sig_effect_abbrev
        (lid,uu____1857,uu____1858,uu____1859,uu____1860) -> [lid]
    | FStar_Syntax_Syntax.Sig_datacon
        (lid,uu____1864,uu____1865,uu____1866,uu____1867,uu____1868) -> 
        [lid]
    | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____1872,uu____1873) ->
        [lid]
    | FStar_Syntax_Syntax.Sig_assume (lid,uu____1875,uu____1876) -> [lid]
    | FStar_Syntax_Syntax.Sig_new_effect_for_free n1 ->
        [n1.FStar_Syntax_Syntax.mname]
    | FStar_Syntax_Syntax.Sig_new_effect n1 -> [n1.FStar_Syntax_Syntax.mname]
    | FStar_Syntax_Syntax.Sig_sub_effect uu____1879 -> []
    | FStar_Syntax_Syntax.Sig_pragma uu____1880 -> []
    | FStar_Syntax_Syntax.Sig_main uu____1881 -> []
let lid_of_sigelt: FStar_Syntax_Syntax.sigelt -> FStar_Ident.lident option =
  fun se  ->
    match lids_of_sigelt se with | l::[] -> Some l | uu____1889 -> None
=======
    | FStar_Syntax_Syntax.Sig_let (uu____2081,lids,uu____2083) -> lids
    | FStar_Syntax_Syntax.Sig_bundle (uu____2088,lids) -> lids
    | FStar_Syntax_Syntax.Sig_inductive_typ
        (lid,uu____2095,uu____2096,uu____2097,uu____2098,uu____2099) -> 
        [lid]
    | FStar_Syntax_Syntax.Sig_effect_abbrev
        (lid,uu____2105,uu____2106,uu____2107,uu____2108) -> [lid]
    | FStar_Syntax_Syntax.Sig_datacon
        (lid,uu____2112,uu____2113,uu____2114,uu____2115,uu____2116) -> 
        [lid]
    | FStar_Syntax_Syntax.Sig_declare_typ (lid,uu____2120,uu____2121) ->
        [lid]
    | FStar_Syntax_Syntax.Sig_assume (lid,uu____2123) -> [lid]
    | FStar_Syntax_Syntax.Sig_new_effect_for_free n1 ->
        [n1.FStar_Syntax_Syntax.mname]
    | FStar_Syntax_Syntax.Sig_new_effect n1 -> [n1.FStar_Syntax_Syntax.mname]
    | FStar_Syntax_Syntax.Sig_sub_effect uu____2126 -> []
    | FStar_Syntax_Syntax.Sig_pragma uu____2127 -> []
    | FStar_Syntax_Syntax.Sig_main uu____2128 -> []
let lid_of_sigelt: FStar_Syntax_Syntax.sigelt -> FStar_Ident.lident option =
  fun se  ->
    match lids_of_sigelt se with | l::[] -> Some l | uu____2137 -> None
>>>>>>> origin/guido_tactics
let quals_of_sigelt:
  FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.qualifier Prims.list =
  fun x  -> x.FStar_Syntax_Syntax.sigquals
let range_of_sigelt: FStar_Syntax_Syntax.sigelt -> FStar_Range.range =
  fun x  -> x.FStar_Syntax_Syntax.sigrng
<<<<<<< HEAD
let range_of_lb uu___163_1911 =
  match uu___163_1911 with
  | (FStar_Util.Inl x,uu____1918,uu____1919) ->
      FStar_Syntax_Syntax.range_of_bv x
  | (FStar_Util.Inr l,uu____1923,uu____1924) -> FStar_Ident.range_of_lid l
let range_of_arg uu____1941 =
  match uu____1941 with | (hd1,uu____1947) -> hd1.FStar_Syntax_Syntax.pos
=======
let range_of_lb uu___173_2164 =
  match uu___173_2164 with
  | (FStar_Util.Inl x,uu____2171,uu____2172) ->
      FStar_Syntax_Syntax.range_of_bv x
  | (FStar_Util.Inr l,uu____2176,uu____2177) -> FStar_Ident.range_of_lid l
let range_of_arg uu____2198 =
  match uu____2198 with | (hd1,uu____2204) -> hd1.FStar_Syntax_Syntax.pos
>>>>>>> origin/guido_tactics
let range_of_args args r =
  FStar_All.pipe_right args
    (FStar_List.fold_left
       (fun r1  -> fun a  -> FStar_Range.union_ranges r1 (range_of_arg a)) r)
let mk_app f args =
  let r = range_of_args args f.FStar_Syntax_Syntax.pos in
  FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (f, args)) None r
let mk_data l args =
  match args with
  | [] ->
<<<<<<< HEAD
      let uu____2063 =
        let uu____2066 =
          let uu____2067 =
            let uu____2072 =
              FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
                (Some FStar_Syntax_Syntax.Data_ctor) in
            (uu____2072,
              (FStar_Syntax_Syntax.Meta_desugared
                 FStar_Syntax_Syntax.Data_app)) in
          FStar_Syntax_Syntax.Tm_meta uu____2067 in
        FStar_Syntax_Syntax.mk uu____2066 in
      uu____2063 None (FStar_Ident.range_of_lid l)
  | uu____2081 ->
      let e =
        let uu____2090 =
          FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
            (Some FStar_Syntax_Syntax.Data_ctor) in
        mk_app uu____2090 args in
=======
      let uu____2329 =
        let uu____2332 =
          let uu____2333 =
            let uu____2338 =
              FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
                (Some FStar_Syntax_Syntax.Data_ctor) in
            (uu____2338,
              (FStar_Syntax_Syntax.Meta_desugared
                 FStar_Syntax_Syntax.Data_app)) in
          FStar_Syntax_Syntax.Tm_meta uu____2333 in
        FStar_Syntax_Syntax.mk uu____2332 in
      uu____2329 None (FStar_Ident.range_of_lid l)
  | uu____2347 ->
      let e =
        let uu____2356 =
          FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant
            (Some FStar_Syntax_Syntax.Data_ctor) in
        mk_app uu____2356 args in
>>>>>>> origin/guido_tactics
      FStar_Syntax_Syntax.mk
        (FStar_Syntax_Syntax.Tm_meta
           (e,
             (FStar_Syntax_Syntax.Meta_desugared FStar_Syntax_Syntax.Data_app)))
        None e.FStar_Syntax_Syntax.pos
let mangle_field_name: FStar_Ident.ident -> FStar_Ident.ident =
  fun x  ->
    FStar_Ident.mk_ident
      ((Prims.strcat "__fname__" x.FStar_Ident.idText),
        (x.FStar_Ident.idRange))
let unmangle_field_name: FStar_Ident.ident -> FStar_Ident.ident =
  fun x  ->
    if FStar_Util.starts_with x.FStar_Ident.idText "__fname__"
    then
<<<<<<< HEAD
      let uu____2105 =
        let uu____2108 =
          FStar_Util.substring_from x.FStar_Ident.idText
            (Prims.parse_int "7") in
        (uu____2108, (x.FStar_Ident.idRange)) in
      FStar_Ident.mk_ident uu____2105
=======
      let uu____2373 =
        let uu____2376 =
          FStar_Util.substring_from x.FStar_Ident.idText
            (Prims.parse_int "9") in
        (uu____2376, (x.FStar_Ident.idRange)) in
      FStar_Ident.mk_ident uu____2373
>>>>>>> origin/guido_tactics
    else x
let field_projector_prefix: Prims.string = "__proj__"
let field_projector_sep: Prims.string = "__item__"
let field_projector_contains_constructor: Prims.string -> Prims.bool =
  fun s  -> FStar_Util.starts_with s field_projector_prefix
let mk_field_projector_name_from_string:
  Prims.string -> Prims.string -> Prims.string =
  fun constr  ->
    fun field  ->
      Prims.strcat field_projector_prefix
        (Prims.strcat constr (Prims.strcat field_projector_sep field))
let mk_field_projector_name_from_ident:
  FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident =
  fun lid  ->
    fun i  ->
      let j = unmangle_field_name i in
      let jtext = j.FStar_Ident.idText in
      let newi =
        if field_projector_contains_constructor jtext
        then j
        else
          FStar_Ident.mk_ident
            ((mk_field_projector_name_from_string
                (lid.FStar_Ident.ident).FStar_Ident.idText jtext),
              (i.FStar_Ident.idRange)) in
      FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns [newi])
let mk_field_projector_name:
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.bv ->
      Prims.int -> (FStar_Ident.lident* FStar_Syntax_Syntax.bv)
  =
  fun lid  ->
    fun x  ->
      fun i  ->
        let nm =
<<<<<<< HEAD
          let uu____2141 = FStar_Syntax_Syntax.is_null_bv x in
          if uu____2141
          then
            let uu____2142 =
              let uu____2145 =
                let uu____2146 = FStar_Util.string_of_int i in
                Prims.strcat "_" uu____2146 in
              let uu____2147 = FStar_Syntax_Syntax.range_of_bv x in
              (uu____2145, uu____2147) in
            FStar_Ident.mk_ident uu____2142
          else x.FStar_Syntax_Syntax.ppname in
        let y =
          let uu___167_2150 = x in
          {
            FStar_Syntax_Syntax.ppname = nm;
            FStar_Syntax_Syntax.index =
              (uu___167_2150.FStar_Syntax_Syntax.index);
            FStar_Syntax_Syntax.sort =
              (uu___167_2150.FStar_Syntax_Syntax.sort)
          } in
        let uu____2151 = mk_field_projector_name_from_ident lid nm in
        (uu____2151, y)
=======
          let uu____2417 = FStar_Syntax_Syntax.is_null_bv x in
          if uu____2417
          then
            let uu____2418 =
              let uu____2421 =
                let uu____2422 = FStar_Util.string_of_int i in
                Prims.strcat "_" uu____2422 in
              let uu____2423 = FStar_Syntax_Syntax.range_of_bv x in
              (uu____2421, uu____2423) in
            FStar_Ident.mk_ident uu____2418
          else x.FStar_Syntax_Syntax.ppname in
        let y =
          let uu___177_2426 = x in
          {
            FStar_Syntax_Syntax.ppname = nm;
            FStar_Syntax_Syntax.index =
              (uu___177_2426.FStar_Syntax_Syntax.index);
            FStar_Syntax_Syntax.sort =
              (uu___177_2426.FStar_Syntax_Syntax.sort)
          } in
        let uu____2427 = mk_field_projector_name_from_ident lid nm in
        (uu____2427, y)
>>>>>>> origin/guido_tactics
let set_uvar:
  FStar_Syntax_Syntax.uvar -> FStar_Syntax_Syntax.term -> Prims.unit =
  fun uv  ->
    fun t  ->
<<<<<<< HEAD
      let uu____2158 = FStar_Syntax_Unionfind.find uv in
      match uu____2158 with
      | Some uu____2160 ->
          let uu____2161 =
            let uu____2162 =
              let uu____2163 = FStar_Syntax_Unionfind.uvar_id uv in
              FStar_All.pipe_left FStar_Util.string_of_int uu____2163 in
            FStar_Util.format1 "Changing a fixed uvar! ?%s\n" uu____2162 in
          failwith uu____2161
      | uu____2164 -> FStar_Syntax_Unionfind.change uv t
=======
      let uu____2436 = FStar_Syntax_Unionfind.find uv in
      match uu____2436 with
      | Some uu____2438 ->
          let uu____2439 =
            let uu____2440 =
              let uu____2441 = FStar_Syntax_Unionfind.uvar_id uv in
              FStar_All.pipe_left FStar_Util.string_of_int uu____2441 in
            FStar_Util.format1 "Changing a fixed uvar! ?%s\n" uu____2440 in
          failwith uu____2439
      | uu____2442 -> FStar_Syntax_Unionfind.change uv t
>>>>>>> origin/guido_tactics
let qualifier_equal:
  FStar_Syntax_Syntax.qualifier ->
    FStar_Syntax_Syntax.qualifier -> Prims.bool
  =
  fun q1  ->
    fun q2  ->
      match (q1, q2) with
      | (FStar_Syntax_Syntax.Discriminator
         l1,FStar_Syntax_Syntax.Discriminator l2) ->
          FStar_Ident.lid_equals l1 l2
      | (FStar_Syntax_Syntax.Projector
         (l1a,l1b),FStar_Syntax_Syntax.Projector (l2a,l2b)) ->
          (FStar_Ident.lid_equals l1a l2a) &&
            (l1b.FStar_Ident.idText = l2b.FStar_Ident.idText)
      | (FStar_Syntax_Syntax.RecordType
         (ns1,f1),FStar_Syntax_Syntax.RecordType (ns2,f2)) ->
          ((((FStar_List.length ns1) = (FStar_List.length ns2)) &&
              (FStar_List.forall2
                 (fun x1  ->
                    fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
                 f1 f2))
             && ((FStar_List.length f1) = (FStar_List.length f2)))
            &&
            (FStar_List.forall2
               (fun x1  ->
                  fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
               f1 f2)
      | (FStar_Syntax_Syntax.RecordConstructor
         (ns1,f1),FStar_Syntax_Syntax.RecordConstructor (ns2,f2)) ->
          ((((FStar_List.length ns1) = (FStar_List.length ns2)) &&
              (FStar_List.forall2
                 (fun x1  ->
                    fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
                 f1 f2))
             && ((FStar_List.length f1) = (FStar_List.length f2)))
            &&
            (FStar_List.forall2
               (fun x1  ->
                  fun x2  -> x1.FStar_Ident.idText = x2.FStar_Ident.idText)
               f1 f2)
<<<<<<< HEAD
      | uu____2234 -> q1 = q2
=======
      | uu____2522 -> q1 = q2
>>>>>>> origin/guido_tactics
let abs:
  FStar_Syntax_Syntax.binders ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.residual_comp option -> FStar_Syntax_Syntax.term
  =
  fun bs  ->
    fun t  ->
      fun lopt  ->
        let close_lopt lopt1 =
          match lopt1 with
<<<<<<< HEAD
          | None  -> lopt1
          | Some (FStar_Util.Inr uu____2291) -> lopt1
          | Some (FStar_Util.Inl lc) ->
              let uu____2312 =
                let uu____2318 = FStar_Syntax_Subst.close_lcomp bs lc in
                FStar_Util.Inl uu____2318 in
              Some uu____2312 in
        match bs with
        | [] -> t
        | uu____2329 ->
            let body =
              let uu____2331 = FStar_Syntax_Subst.close bs t in
              FStar_Syntax_Subst.compress uu____2331 in
            (match ((body.FStar_Syntax_Syntax.n), lopt) with
             | (FStar_Syntax_Syntax.Tm_abs (bs',t1,lopt'),None ) ->
                 let uu____2374 =
                   let uu____2377 =
                     let uu____2378 =
                       let uu____2393 =
                         let uu____2397 = FStar_Syntax_Subst.close_binders bs in
                         FStar_List.append uu____2397 bs' in
                       let uu____2403 = close_lopt lopt' in
                       (uu____2393, t1, uu____2403) in
                     FStar_Syntax_Syntax.Tm_abs uu____2378 in
                   FStar_Syntax_Syntax.mk uu____2377 in
                 uu____2374 None t1.FStar_Syntax_Syntax.pos
             | uu____2429 ->
                 let uu____2438 =
                   let uu____2441 =
                     let uu____2442 =
                       let uu____2457 = FStar_Syntax_Subst.close_binders bs in
                       let uu____2458 = close_lopt lopt in
                       (uu____2457, body, uu____2458) in
                     FStar_Syntax_Syntax.Tm_abs uu____2442 in
                   FStar_Syntax_Syntax.mk uu____2441 in
                 uu____2438 None t.FStar_Syntax_Syntax.pos)
=======
          | None  -> None
          | Some rc ->
              let uu____2548 =
                let uu___178_2549 = rc in
                let uu____2550 =
                  FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                    (FStar_Syntax_Subst.close bs) in
                {
                  FStar_Syntax_Syntax.residual_effect =
                    (uu___178_2549.FStar_Syntax_Syntax.residual_effect);
                  FStar_Syntax_Syntax.residual_typ = uu____2550;
                  FStar_Syntax_Syntax.residual_flags =
                    (uu___178_2549.FStar_Syntax_Syntax.residual_flags)
                } in
              Some uu____2548 in
        match bs with
        | [] -> t
        | uu____2558 ->
            let body =
              let uu____2560 = FStar_Syntax_Subst.close bs t in
              FStar_Syntax_Subst.compress uu____2560 in
            (match ((body.FStar_Syntax_Syntax.n), lopt) with
             | (FStar_Syntax_Syntax.Tm_abs (bs',t1,lopt'),None ) ->
                 let uu____2578 =
                   let uu____2581 =
                     let uu____2582 =
                       let uu____2592 =
                         let uu____2596 = FStar_Syntax_Subst.close_binders bs in
                         FStar_List.append uu____2596 bs' in
                       let uu____2602 = close_lopt lopt' in
                       (uu____2592, t1, uu____2602) in
                     FStar_Syntax_Syntax.Tm_abs uu____2582 in
                   FStar_Syntax_Syntax.mk uu____2581 in
                 uu____2578 None t1.FStar_Syntax_Syntax.pos
             | uu____2618 ->
                 let uu____2622 =
                   let uu____2625 =
                     let uu____2626 =
                       let uu____2636 = FStar_Syntax_Subst.close_binders bs in
                       let uu____2637 = close_lopt lopt in
                       (uu____2636, body, uu____2637) in
                     FStar_Syntax_Syntax.Tm_abs uu____2626 in
                   FStar_Syntax_Syntax.mk uu____2625 in
                 uu____2622 None t.FStar_Syntax_Syntax.pos)
>>>>>>> origin/guido_tactics
let arrow:
  (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun bs  ->
    fun c  ->
      match bs with
      | [] -> comp_result c
<<<<<<< HEAD
      | uu____2501 ->
          let uu____2505 =
            let uu____2508 =
              let uu____2509 =
                let uu____2517 = FStar_Syntax_Subst.close_binders bs in
                let uu____2518 = FStar_Syntax_Subst.close_comp bs c in
                (uu____2517, uu____2518) in
              FStar_Syntax_Syntax.Tm_arrow uu____2509 in
            FStar_Syntax_Syntax.mk uu____2508 in
          uu____2505 None c.FStar_Syntax_Syntax.pos
=======
      | uu____2672 ->
          let uu____2676 =
            let uu____2679 =
              let uu____2680 =
                let uu____2688 = FStar_Syntax_Subst.close_binders bs in
                let uu____2689 = FStar_Syntax_Subst.close_comp bs c in
                (uu____2688, uu____2689) in
              FStar_Syntax_Syntax.Tm_arrow uu____2680 in
            FStar_Syntax_Syntax.mk uu____2679 in
          uu____2676 None c.FStar_Syntax_Syntax.pos
>>>>>>> origin/guido_tactics
let flat_arrow:
  (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun bs  ->
    fun c  ->
      let t = arrow bs c in
<<<<<<< HEAD
      let uu____2548 =
        let uu____2549 = FStar_Syntax_Subst.compress t in
        uu____2549.FStar_Syntax_Syntax.n in
      match uu____2548 with
      | FStar_Syntax_Syntax.Tm_arrow (bs1,c1) ->
          (match c1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Total (tres,uu____2569) ->
               let uu____2576 =
                 let uu____2577 = FStar_Syntax_Subst.compress tres in
                 uu____2577.FStar_Syntax_Syntax.n in
               (match uu____2576 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',c') ->
                    let uu____2594 = FStar_ST.read t.FStar_Syntax_Syntax.tk in
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_arrow
                         ((FStar_List.append bs1 bs'), c')) uu____2594
                      t.FStar_Syntax_Syntax.pos
                | uu____2610 -> t)
           | uu____2611 -> t)
      | uu____2612 -> t
=======
      let uu____2721 =
        let uu____2722 = FStar_Syntax_Subst.compress t in
        uu____2722.FStar_Syntax_Syntax.n in
      match uu____2721 with
      | FStar_Syntax_Syntax.Tm_arrow (bs1,c1) ->
          (match c1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Total (tres,uu____2742) ->
               let uu____2749 =
                 let uu____2750 = FStar_Syntax_Subst.compress tres in
                 uu____2750.FStar_Syntax_Syntax.n in
               (match uu____2749 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',c') ->
                    let uu____2767 = FStar_ST.read t.FStar_Syntax_Syntax.tk in
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_arrow
                         ((FStar_List.append bs1 bs'), c')) uu____2767
                      t.FStar_Syntax_Syntax.pos
                | uu____2783 -> t)
           | uu____2784 -> t)
      | uu____2785 -> t
>>>>>>> origin/guido_tactics
let refine:
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun b  ->
    fun t  ->
<<<<<<< HEAD
      let uu____2621 =
        FStar_ST.read (b.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.tk in
      let uu____2626 =
        let uu____2627 = FStar_Syntax_Syntax.range_of_bv b in
        FStar_Range.union_ranges uu____2627 t.FStar_Syntax_Syntax.pos in
      let uu____2628 =
        let uu____2631 =
          let uu____2632 =
            let uu____2637 =
              let uu____2638 =
                let uu____2639 = FStar_Syntax_Syntax.mk_binder b in
                [uu____2639] in
              FStar_Syntax_Subst.close uu____2638 t in
            (b, uu____2637) in
          FStar_Syntax_Syntax.Tm_refine uu____2632 in
        FStar_Syntax_Syntax.mk uu____2631 in
      uu____2628 uu____2621 uu____2626
=======
      let uu____2796 =
        FStar_ST.read (b.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.tk in
      let uu____2801 =
        let uu____2802 = FStar_Syntax_Syntax.range_of_bv b in
        FStar_Range.union_ranges uu____2802 t.FStar_Syntax_Syntax.pos in
      let uu____2803 =
        let uu____2806 =
          let uu____2807 =
            let uu____2812 =
              let uu____2813 =
                let uu____2814 = FStar_Syntax_Syntax.mk_binder b in
                [uu____2814] in
              FStar_Syntax_Subst.close uu____2813 t in
            (b, uu____2812) in
          FStar_Syntax_Syntax.Tm_refine uu____2807 in
        FStar_Syntax_Syntax.mk uu____2806 in
      uu____2803 uu____2796 uu____2801
>>>>>>> origin/guido_tactics
let branch: FStar_Syntax_Syntax.branch -> FStar_Syntax_Syntax.branch =
  fun b  -> FStar_Syntax_Subst.close_branch b
let rec arrow_formals_comp:
  FStar_Syntax_Syntax.term ->
    ((FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list*
      FStar_Syntax_Syntax.comp)
  =
  fun k  ->
    let k1 = FStar_Syntax_Subst.compress k in
    match k1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
<<<<<<< HEAD
        let uu____2677 = FStar_Syntax_Subst.open_comp bs c in
        (match uu____2677 with
         | (bs1,c1) ->
             let uu____2687 = is_tot_or_gtot_comp c1 in
             if uu____2687
             then
               let uu____2693 = arrow_formals_comp (comp_result c1) in
               (match uu____2693 with
                | (bs',k2) -> ((FStar_List.append bs1 bs'), k2))
             else (bs1, c1))
    | uu____2718 ->
        let uu____2719 = FStar_Syntax_Syntax.mk_Total k1 in ([], uu____2719)
=======
        let uu____2854 = FStar_Syntax_Subst.open_comp bs c in
        (match uu____2854 with
         | (bs1,c1) ->
             let uu____2864 = is_tot_or_gtot_comp c1 in
             if uu____2864
             then
               let uu____2870 = arrow_formals_comp (comp_result c1) in
               (match uu____2870 with
                | (bs',k2) -> ((FStar_List.append bs1 bs'), k2))
             else (bs1, c1))
    | uu____2895 ->
        let uu____2896 = FStar_Syntax_Syntax.mk_Total k1 in ([], uu____2896)
>>>>>>> origin/guido_tactics
let rec arrow_formals:
  FStar_Syntax_Syntax.term ->
    ((FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list*
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax)
  =
  fun k  ->
<<<<<<< HEAD
    let uu____2735 = arrow_formals_comp k in
    match uu____2735 with | (bs,c) -> (bs, (comp_result c))
=======
    let uu____2913 = arrow_formals_comp k in
    match uu____2913 with | (bs,c) -> (bs, (comp_result c))
>>>>>>> origin/guido_tactics
let abs_formals:
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.binders* FStar_Syntax_Syntax.term*
      FStar_Syntax_Syntax.residual_comp option)
  =
  fun t  ->
    let subst_lcomp_opt s l =
      match l with
<<<<<<< HEAD
      | Some (FStar_Util.Inl l1) ->
          let l2 =
            let uu___168_2816 = l1 in
            let uu____2817 =
              FStar_Syntax_Subst.subst s l1.FStar_Syntax_Syntax.res_typ in
            {
              FStar_Syntax_Syntax.eff_name =
                (uu___168_2816.FStar_Syntax_Syntax.eff_name);
              FStar_Syntax_Syntax.res_typ = uu____2817;
              FStar_Syntax_Syntax.cflags =
                (uu___168_2816.FStar_Syntax_Syntax.cflags);
              FStar_Syntax_Syntax.comp =
                (fun uu____2822  ->
                   let uu____2823 = l1.FStar_Syntax_Syntax.comp () in
                   FStar_Syntax_Subst.subst_comp s uu____2823)
            } in
          Some (FStar_Util.Inl l2)
      | uu____2832 -> l in
    let rec aux t1 abs_body_lcomp =
      let uu____2870 =
        let uu____2871 =
          let uu____2874 = FStar_Syntax_Subst.compress t1 in
          FStar_All.pipe_left unascribe uu____2874 in
        uu____2871.FStar_Syntax_Syntax.n in
      match uu____2870 with
      | FStar_Syntax_Syntax.Tm_abs (bs,t2,what) ->
          let uu____2912 = aux t2 what in
          (match uu____2912 with
           | (bs',t3,what1) -> ((FStar_List.append bs bs'), t3, what1))
      | uu____2969 -> ([], t1, abs_body_lcomp) in
    let uu____2981 = aux t None in
    match uu____2981 with
    | (bs,t1,abs_body_lcomp) ->
        let uu____3029 = FStar_Syntax_Subst.open_term' bs t1 in
        (match uu____3029 with
=======
      | Some rc ->
          let uu____2961 =
            let uu___179_2962 = rc in
            let uu____2963 =
              FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                (FStar_Syntax_Subst.subst s) in
            {
              FStar_Syntax_Syntax.residual_effect =
                (uu___179_2962.FStar_Syntax_Syntax.residual_effect);
              FStar_Syntax_Syntax.residual_typ = uu____2963;
              FStar_Syntax_Syntax.residual_flags =
                (uu___179_2962.FStar_Syntax_Syntax.residual_flags)
            } in
          Some uu____2961
      | uu____2969 -> l in
    let rec aux t1 abs_body_lcomp =
      let uu____2987 =
        let uu____2988 =
          let uu____2991 = FStar_Syntax_Subst.compress t1 in
          FStar_All.pipe_left unascribe uu____2991 in
        uu____2988.FStar_Syntax_Syntax.n in
      match uu____2987 with
      | FStar_Syntax_Syntax.Tm_abs (bs,t2,what) ->
          let uu____3014 = aux t2 what in
          (match uu____3014 with
           | (bs',t3,what1) -> ((FStar_List.append bs bs'), t3, what1))
      | uu____3046 -> ([], t1, abs_body_lcomp) in
    let uu____3053 = aux t None in
    match uu____3053 with
    | (bs,t1,abs_body_lcomp) ->
        let uu____3076 = FStar_Syntax_Subst.open_term' bs t1 in
        (match uu____3076 with
>>>>>>> origin/guido_tactics
         | (bs1,t2,opening) ->
             let abs_body_lcomp1 = subst_lcomp_opt opening abs_body_lcomp in
             (bs1, t2, abs_body_lcomp1))
let mk_letbinding:
  (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.fv) FStar_Util.either ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax ->
        FStar_Ident.lident ->
          (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
            FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.letbinding
  =
  fun lbname  ->
    fun univ_vars  ->
      fun typ  ->
        fun eff  ->
          fun def  ->
            {
              FStar_Syntax_Syntax.lbname = lbname;
              FStar_Syntax_Syntax.lbunivs = univ_vars;
              FStar_Syntax_Syntax.lbtyp = typ;
              FStar_Syntax_Syntax.lbeff = eff;
              FStar_Syntax_Syntax.lbdef = def
            }
let close_univs_and_mk_letbinding:
  FStar_Syntax_Syntax.fv Prims.list option ->
    (FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.fv) FStar_Util.either ->
      FStar_Ident.ident Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_Ident.lident ->
            FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.letbinding
  =
  fun recs  ->
    fun lbname  ->
      fun univ_vars  ->
        fun typ  ->
          fun eff  ->
            fun def  ->
              let def1 =
                match (recs, univ_vars) with
<<<<<<< HEAD
                | (None ,uu____3119) -> def
                | (uu____3125,[]) -> def
                | (Some fvs,uu____3132) ->
=======
                | (None ,uu____3162) -> def
                | (uu____3168,[]) -> def
                | (Some fvs,uu____3175) ->
>>>>>>> origin/guido_tactics
                    let universes =
                      FStar_All.pipe_right univ_vars
                        (FStar_List.map
                           (fun _0_26  -> FStar_Syntax_Syntax.U_name _0_26)) in
                    let inst1 =
                      FStar_All.pipe_right fvs
                        (FStar_List.map
                           (fun fv  ->
                              (((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v),
                                universes))) in
                    FStar_Syntax_InstFV.instantiate inst1 def in
              let typ1 = FStar_Syntax_Subst.close_univ_vars univ_vars typ in
              let def2 = FStar_Syntax_Subst.close_univ_vars univ_vars def1 in
              mk_letbinding lbname univ_vars typ1 eff def2
let open_univ_vars_binders_and_comp:
  FStar_Syntax_Syntax.univ_names ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list ->
      FStar_Syntax_Syntax.comp ->
        (FStar_Syntax_Syntax.univ_names* (FStar_Syntax_Syntax.bv*
          FStar_Syntax_Syntax.aqual) Prims.list* FStar_Syntax_Syntax.comp)
  =
  fun uvs  ->
    fun binders  ->
      fun c  ->
        match binders with
        | [] ->
<<<<<<< HEAD
            let uu____3190 = FStar_Syntax_Subst.open_univ_vars_comp uvs c in
            (match uu____3190 with | (uvs1,c1) -> (uvs1, [], c1))
        | uu____3206 ->
            let t' = arrow binders c in
            let uu____3213 = FStar_Syntax_Subst.open_univ_vars uvs t' in
            (match uu____3213 with
             | (uvs1,t'1) ->
                 let uu____3224 =
                   let uu____3225 = FStar_Syntax_Subst.compress t'1 in
                   uu____3225.FStar_Syntax_Syntax.n in
                 (match uu____3224 with
                  | FStar_Syntax_Syntax.Tm_arrow (binders1,c1) ->
                      (uvs1, binders1, c1)
                  | uu____3251 -> failwith "Impossible"))
=======
            let uu____3239 = FStar_Syntax_Subst.open_univ_vars_comp uvs c in
            (match uu____3239 with | (uvs1,c1) -> (uvs1, [], c1))
        | uu____3255 ->
            let t' = arrow binders c in
            let uu____3262 = FStar_Syntax_Subst.open_univ_vars uvs t' in
            (match uu____3262 with
             | (uvs1,t'1) ->
                 let uu____3273 =
                   let uu____3274 = FStar_Syntax_Subst.compress t'1 in
                   uu____3274.FStar_Syntax_Syntax.n in
                 (match uu____3273 with
                  | FStar_Syntax_Syntax.Tm_arrow (binders1,c1) ->
                      (uvs1, binders1, c1)
                  | uu____3300 -> failwith "Impossible"))
>>>>>>> origin/guido_tactics
let is_tuple_constructor_string: Prims.string -> Prims.bool =
  fun s  -> FStar_Util.starts_with s "FStar.Pervasives.tuple"
let is_dtuple_constructor_string: Prims.string -> Prims.bool =
  fun s  ->
    (s = "Prims.dtuple2") ||
      (FStar_Util.starts_with s "FStar.Pervasives.dtuple")
let is_tuple_datacon_string: Prims.string -> Prims.bool =
  fun s  -> FStar_Util.starts_with s "FStar.Pervasives.Mktuple"
let is_dtuple_datacon_string: Prims.string -> Prims.bool =
  fun s  ->
    (s = "Prims.Mkdtuple2") ||
      (FStar_Util.starts_with s "FStar.Pervasives.Mkdtuple")
let mod_prefix_dtuple: Prims.int -> Prims.string -> FStar_Ident.lident =
  fun n1  ->
    if n1 = (Prims.parse_int "2")
    then FStar_Syntax_Const.pconst
    else FStar_Syntax_Const.psconst
let is_tuple_constructor: FStar_Syntax_Syntax.typ -> Prims.bool =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        is_tuple_constructor_string
          ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v).FStar_Ident.str
<<<<<<< HEAD
    | uu____3284 -> false
=======
    | uu____3343 -> false
>>>>>>> origin/guido_tactics
let mk_tuple_lid: Prims.int -> FStar_Range.range -> FStar_Ident.lident =
  fun n1  ->
    fun r  ->
      let t =
<<<<<<< HEAD
        let uu____3292 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "tuple%s" uu____3292 in
      let uu____3293 = FStar_Syntax_Const.psconst t in
      FStar_Ident.set_lid_range uu____3293 r
=======
        let uu____3353 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "tuple%s" uu____3353 in
      let uu____3354 = FStar_Syntax_Const.psconst t in
      FStar_Ident.set_lid_range uu____3354 r
>>>>>>> origin/guido_tactics
let mk_tuple_data_lid: Prims.int -> FStar_Range.range -> FStar_Ident.lident =
  fun n1  ->
    fun r  ->
      let t =
<<<<<<< HEAD
        let uu____3301 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "Mktuple%s" uu____3301 in
      let uu____3302 = FStar_Syntax_Const.psconst t in
      FStar_Ident.set_lid_range uu____3302 r
let is_tuple_data_lid: FStar_Ident.lident -> Prims.int -> Prims.bool =
  fun f  ->
    fun n1  ->
      let uu____3309 = mk_tuple_data_lid n1 FStar_Range.dummyRange in
      FStar_Ident.lid_equals f uu____3309
=======
        let uu____3364 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "Mktuple%s" uu____3364 in
      let uu____3365 = FStar_Syntax_Const.psconst t in
      FStar_Ident.set_lid_range uu____3365 r
let is_tuple_data_lid: FStar_Ident.lident -> Prims.int -> Prims.bool =
  fun f  ->
    fun n1  ->
      let uu____3374 = mk_tuple_data_lid n1 FStar_Range.dummyRange in
      FStar_Ident.lid_equals f uu____3374
>>>>>>> origin/guido_tactics
let is_tuple_data_lid': FStar_Ident.lident -> Prims.bool =
  fun f  -> is_tuple_datacon_string f.FStar_Ident.str
let is_tuple_constructor_lid: FStar_Ident.ident -> Prims.bool =
  fun lid  -> is_tuple_constructor_string (FStar_Ident.text_of_id lid)
let is_dtuple_constructor_lid: FStar_Ident.lident -> Prims.bool =
  fun lid  -> is_dtuple_constructor_string lid.FStar_Ident.str
let is_dtuple_constructor: FStar_Syntax_Syntax.typ -> Prims.bool =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        is_dtuple_constructor_lid
          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
<<<<<<< HEAD
    | uu____3323 -> false
=======
    | uu____3396 -> false
>>>>>>> origin/guido_tactics
let mk_dtuple_lid: Prims.int -> FStar_Range.range -> FStar_Ident.lident =
  fun n1  ->
    fun r  ->
      let t =
<<<<<<< HEAD
        let uu____3331 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "dtuple%s" uu____3331 in
      let uu____3332 = let uu____3333 = mod_prefix_dtuple n1 in uu____3333 t in
      FStar_Ident.set_lid_range uu____3332 r
=======
        let uu____3406 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "dtuple%s" uu____3406 in
      let uu____3407 = let uu____3408 = mod_prefix_dtuple n1 in uu____3408 t in
      FStar_Ident.set_lid_range uu____3407 r
>>>>>>> origin/guido_tactics
let mk_dtuple_data_lid: Prims.int -> FStar_Range.range -> FStar_Ident.lident
  =
  fun n1  ->
    fun r  ->
      let t =
<<<<<<< HEAD
        let uu____3343 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "Mkdtuple%s" uu____3343 in
      let uu____3344 = let uu____3345 = mod_prefix_dtuple n1 in uu____3345 t in
      FStar_Ident.set_lid_range uu____3344 r
=======
        let uu____3420 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "Mkdtuple%s" uu____3420 in
      let uu____3421 = let uu____3422 = mod_prefix_dtuple n1 in uu____3422 t in
      FStar_Ident.set_lid_range uu____3421 r
>>>>>>> origin/guido_tactics
let is_dtuple_data_lid': FStar_Ident.lident -> Prims.bool =
  fun f  -> is_dtuple_datacon_string (FStar_Ident.text_of_lid f)
let is_lid_equality: FStar_Ident.lident -> Prims.bool =
  fun x  -> FStar_Ident.lid_equals x FStar_Syntax_Const.eq2_lid
let is_forall: FStar_Ident.lident -> Prims.bool =
  fun lid  -> FStar_Ident.lid_equals lid FStar_Syntax_Const.forall_lid
let is_exists: FStar_Ident.lident -> Prims.bool =
  fun lid  -> FStar_Ident.lid_equals lid FStar_Syntax_Const.exists_lid
let is_qlid: FStar_Ident.lident -> Prims.bool =
  fun lid  -> (is_forall lid) || (is_exists lid)
let is_equality:
  FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t -> Prims.bool =
  fun x  -> is_lid_equality x.FStar_Syntax_Syntax.v
let lid_is_connective: FStar_Ident.lident -> Prims.bool =
  let lst =
    [FStar_Syntax_Const.and_lid;
    FStar_Syntax_Const.or_lid;
    FStar_Syntax_Const.not_lid;
    FStar_Syntax_Const.iff_lid;
    FStar_Syntax_Const.imp_lid] in
  fun lid  -> FStar_Util.for_some (FStar_Ident.lid_equals lid) lst
let is_constructor:
  FStar_Syntax_Syntax.term -> FStar_Ident.lident -> Prims.bool =
  fun t  ->
    fun lid  ->
<<<<<<< HEAD
      let uu____3379 =
        let uu____3380 = pre_typ t in uu____3380.FStar_Syntax_Syntax.n in
      match uu____3379 with
      | FStar_Syntax_Syntax.Tm_fvar tc ->
          FStar_Ident.lid_equals
            (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v lid
      | uu____3384 -> false
=======
      let uu____3472 =
        let uu____3473 = pre_typ t in uu____3473.FStar_Syntax_Syntax.n in
      match uu____3472 with
      | FStar_Syntax_Syntax.Tm_fvar tc ->
          FStar_Ident.lid_equals
            (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v lid
      | uu____3481 -> false
>>>>>>> origin/guido_tactics
let rec is_constructed_typ:
  FStar_Syntax_Syntax.term -> FStar_Ident.lident -> Prims.bool =
  fun t  ->
    fun lid  ->
<<<<<<< HEAD
      let uu____3391 =
        let uu____3392 = pre_typ t in uu____3392.FStar_Syntax_Syntax.n in
      match uu____3391 with
      | FStar_Syntax_Syntax.Tm_fvar uu____3395 -> is_constructor t lid
      | FStar_Syntax_Syntax.Tm_app (t1,uu____3397) ->
          is_constructed_typ t1 lid
      | uu____3412 -> false
=======
      let uu____3490 =
        let uu____3491 = pre_typ t in uu____3491.FStar_Syntax_Syntax.n in
      match uu____3490 with
      | FStar_Syntax_Syntax.Tm_fvar uu____3494 -> is_constructor t lid
      | FStar_Syntax_Syntax.Tm_app (t1,uu____3496) ->
          is_constructed_typ t1 lid
      | uu____3511 -> false
>>>>>>> origin/guido_tactics
let rec get_tycon:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term option =
  fun t  ->
    let t1 = pre_typ t in
    match t1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_bvar uu____3419 -> Some t1
    | FStar_Syntax_Syntax.Tm_name uu____3420 -> Some t1
    | FStar_Syntax_Syntax.Tm_fvar uu____3421 -> Some t1
    | FStar_Syntax_Syntax.Tm_app (t2,uu____3423) -> get_tycon t2
    | uu____3438 -> None
=======
    | FStar_Syntax_Syntax.Tm_bvar uu____3519 -> Some t1
    | FStar_Syntax_Syntax.Tm_name uu____3520 -> Some t1
    | FStar_Syntax_Syntax.Tm_fvar uu____3521 -> Some t1
    | FStar_Syntax_Syntax.Tm_app (t2,uu____3523) -> get_tycon t2
    | uu____3538 -> None
>>>>>>> origin/guido_tactics
let is_interpreted: FStar_Ident.lident -> Prims.bool =
  fun l  ->
    let theory_syms =
      [FStar_Syntax_Const.op_Eq;
      FStar_Syntax_Const.op_notEq;
      FStar_Syntax_Const.op_LT;
      FStar_Syntax_Const.op_LTE;
      FStar_Syntax_Const.op_GT;
      FStar_Syntax_Const.op_GTE;
      FStar_Syntax_Const.op_Subtraction;
      FStar_Syntax_Const.op_Minus;
      FStar_Syntax_Const.op_Addition;
      FStar_Syntax_Const.op_Multiply;
      FStar_Syntax_Const.op_Division;
      FStar_Syntax_Const.op_Modulus;
      FStar_Syntax_Const.op_And;
      FStar_Syntax_Const.op_Or;
      FStar_Syntax_Const.op_Negation] in
    FStar_Util.for_some (FStar_Ident.lid_equals l) theory_syms
let is_fstar_tactics_embed: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____3549 =
      let uu____3550 = un_uinst t in uu____3550.FStar_Syntax_Syntax.n in
    match uu____3549 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Syntax_Syntax.fv_eq_lid fv
          FStar_Syntax_Const.fstar_refl_embed_lid
    | uu____3554 -> false
let is_fstar_tactics_by_tactic: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____3559 =
      let uu____3560 = un_uinst t in uu____3560.FStar_Syntax_Syntax.n in
    match uu____3559 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.by_tactic_lid
    | uu____3564 -> false
let ktype:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_type FStar_Syntax_Syntax.U_unknown) None
    FStar_Range.dummyRange
let ktype0:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax
  =
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_type FStar_Syntax_Syntax.U_zero) None
    FStar_Range.dummyRange
let type_u:
  Prims.unit ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.universe)
  =
<<<<<<< HEAD
  fun uu____3460  ->
    let u =
      let uu____3464 = FStar_Syntax_Unionfind.univ_fresh () in
      FStar_All.pipe_left (fun _0_27  -> FStar_Syntax_Syntax.U_unif _0_27)
        uu____3464 in
    let uu____3473 =
      FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type u) None
        FStar_Range.dummyRange in
    (uu____3473, u)
=======
  fun uu____3590  ->
    let u =
      let uu____3594 = FStar_Syntax_Unionfind.univ_fresh () in
      FStar_All.pipe_left (fun _0_27  -> FStar_Syntax_Syntax.U_unif _0_27)
        uu____3594 in
    let uu____3599 =
      FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type u) None
        FStar_Range.dummyRange in
    (uu____3599, u)
>>>>>>> origin/guido_tactics
let kt_kt: FStar_Syntax_Syntax.term = FStar_Syntax_Const.kunary ktype0 ktype0
let kt_kt_kt: FStar_Syntax_Syntax.term =
  FStar_Syntax_Const.kbin ktype0 ktype0 ktype0
let fvar_const: FStar_Ident.lident -> FStar_Syntax_Syntax.term =
  fun l  ->
    FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.Delta_constant None
let tand: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.and_lid
let tor: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.or_lid
let timp: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Syntax_Const.imp_lid
    (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1")) None
let tiff: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Syntax_Const.iff_lid
    (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "2")) None
let t_bool: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.bool_lid
let t_false: FStar_Syntax_Syntax.term =
  fvar_const FStar_Syntax_Const.false_lid
let t_true: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.true_lid
let b2t_v: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.b2t_lid
let t_not: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.not_lid
let mk_conj_opt:
  FStar_Syntax_Syntax.term option ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax option
  =
  fun phi1  ->
    fun phi2  ->
      match phi1 with
      | None  -> Some phi2
      | Some phi11 ->
<<<<<<< HEAD
          let uu____3496 =
            let uu____3499 =
              FStar_Range.union_ranges phi11.FStar_Syntax_Syntax.pos
                phi2.FStar_Syntax_Syntax.pos in
            let uu____3500 =
              let uu____3503 =
                let uu____3504 =
                  let uu____3514 =
                    let uu____3516 = FStar_Syntax_Syntax.as_arg phi11 in
                    let uu____3517 =
                      let uu____3519 = FStar_Syntax_Syntax.as_arg phi2 in
                      [uu____3519] in
                    uu____3516 :: uu____3517 in
                  (tand, uu____3514) in
                FStar_Syntax_Syntax.Tm_app uu____3504 in
              FStar_Syntax_Syntax.mk uu____3503 in
            uu____3500 None uu____3499 in
          Some uu____3496
let mk_binop op_t phi1 phi2 =
  let uu____3554 =
    FStar_Range.union_ranges phi1.FStar_Syntax_Syntax.pos
      phi2.FStar_Syntax_Syntax.pos in
  let uu____3555 =
    let uu____3558 =
      let uu____3559 =
        let uu____3569 =
          let uu____3571 = FStar_Syntax_Syntax.as_arg phi1 in
          let uu____3572 =
            let uu____3574 = FStar_Syntax_Syntax.as_arg phi2 in [uu____3574] in
          uu____3571 :: uu____3572 in
        (op_t, uu____3569) in
      FStar_Syntax_Syntax.Tm_app uu____3559 in
    FStar_Syntax_Syntax.mk uu____3558 in
  uu____3555 None uu____3554
let mk_neg phi =
  let uu____3595 =
    let uu____3598 =
      let uu____3599 =
        let uu____3609 =
          let uu____3611 = FStar_Syntax_Syntax.as_arg phi in [uu____3611] in
        (t_not, uu____3609) in
      FStar_Syntax_Syntax.Tm_app uu____3599 in
    FStar_Syntax_Syntax.mk uu____3598 in
  uu____3595 None phi.FStar_Syntax_Syntax.pos
=======
          let uu____3625 =
            let uu____3628 =
              FStar_Range.union_ranges phi11.FStar_Syntax_Syntax.pos
                phi2.FStar_Syntax_Syntax.pos in
            let uu____3629 =
              let uu____3632 =
                let uu____3633 =
                  let uu____3643 =
                    let uu____3645 = FStar_Syntax_Syntax.as_arg phi11 in
                    let uu____3646 =
                      let uu____3648 = FStar_Syntax_Syntax.as_arg phi2 in
                      [uu____3648] in
                    uu____3645 :: uu____3646 in
                  (tand, uu____3643) in
                FStar_Syntax_Syntax.Tm_app uu____3633 in
              FStar_Syntax_Syntax.mk uu____3632 in
            uu____3629 None uu____3628 in
          Some uu____3625
let mk_binop op_t phi1 phi2 =
  let uu____3687 =
    FStar_Range.union_ranges phi1.FStar_Syntax_Syntax.pos
      phi2.FStar_Syntax_Syntax.pos in
  let uu____3688 =
    let uu____3691 =
      let uu____3692 =
        let uu____3702 =
          let uu____3704 = FStar_Syntax_Syntax.as_arg phi1 in
          let uu____3705 =
            let uu____3707 = FStar_Syntax_Syntax.as_arg phi2 in [uu____3707] in
          uu____3704 :: uu____3705 in
        (op_t, uu____3702) in
      FStar_Syntax_Syntax.Tm_app uu____3692 in
    FStar_Syntax_Syntax.mk uu____3691 in
  uu____3688 None uu____3687
let mk_neg phi =
  let uu____3730 =
    let uu____3733 =
      let uu____3734 =
        let uu____3744 =
          let uu____3746 = FStar_Syntax_Syntax.as_arg phi in [uu____3746] in
        (t_not, uu____3744) in
      FStar_Syntax_Syntax.Tm_app uu____3734 in
    FStar_Syntax_Syntax.mk uu____3733 in
  uu____3730 None phi.FStar_Syntax_Syntax.pos
>>>>>>> origin/guido_tactics
let mk_conj phi1 phi2 = mk_binop tand phi1 phi2
let mk_conj_l:
  FStar_Syntax_Syntax.term Prims.list -> FStar_Syntax_Syntax.term =
  fun phi  ->
    match phi with
    | [] ->
        FStar_Syntax_Syntax.fvar FStar_Syntax_Const.true_lid
          FStar_Syntax_Syntax.Delta_constant None
    | hd1::tl1 -> FStar_List.fold_right mk_conj tl1 hd1
let mk_disj phi1 phi2 = mk_binop tor phi1 phi2
let mk_disj_l:
  FStar_Syntax_Syntax.term Prims.list -> FStar_Syntax_Syntax.term =
  fun phi  ->
    match phi with
    | [] -> t_false
    | hd1::tl1 -> FStar_List.fold_right mk_disj tl1 hd1
let mk_imp:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  = fun phi1  -> fun phi2  -> mk_binop timp phi1 phi2
let mk_iff:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  = fun phi1  -> fun phi2  -> mk_binop tiff phi1 phi2
let b2t e =
<<<<<<< HEAD
  let uu____3686 =
    let uu____3689 =
      let uu____3690 =
        let uu____3700 =
          let uu____3702 = FStar_Syntax_Syntax.as_arg e in [uu____3702] in
        (b2t_v, uu____3700) in
      FStar_Syntax_Syntax.Tm_app uu____3690 in
    FStar_Syntax_Syntax.mk uu____3689 in
  uu____3686 None e.FStar_Syntax_Syntax.pos
let teq: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.eq2_lid
let mk_untyped_eq2 e1 e2 =
  let uu____3726 =
    FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos
      e2.FStar_Syntax_Syntax.pos in
  let uu____3727 =
    let uu____3730 =
      let uu____3731 =
        let uu____3741 =
          let uu____3743 = FStar_Syntax_Syntax.as_arg e1 in
          let uu____3744 =
            let uu____3746 = FStar_Syntax_Syntax.as_arg e2 in [uu____3746] in
          uu____3743 :: uu____3744 in
        (teq, uu____3741) in
      FStar_Syntax_Syntax.Tm_app uu____3731 in
    FStar_Syntax_Syntax.mk uu____3730 in
  uu____3727 None uu____3726
=======
  let uu____3835 =
    let uu____3838 =
      let uu____3839 =
        let uu____3849 =
          let uu____3851 = FStar_Syntax_Syntax.as_arg e in [uu____3851] in
        (b2t_v, uu____3849) in
      FStar_Syntax_Syntax.Tm_app uu____3839 in
    FStar_Syntax_Syntax.mk uu____3838 in
  uu____3835 None e.FStar_Syntax_Syntax.pos
let teq: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.eq2_lid
let mk_untyped_eq2 e1 e2 =
  let uu____3878 =
    FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos
      e2.FStar_Syntax_Syntax.pos in
  let uu____3879 =
    let uu____3882 =
      let uu____3883 =
        let uu____3893 =
          let uu____3895 = FStar_Syntax_Syntax.as_arg e1 in
          let uu____3896 =
            let uu____3898 = FStar_Syntax_Syntax.as_arg e2 in [uu____3898] in
          uu____3895 :: uu____3896 in
        (teq, uu____3893) in
      FStar_Syntax_Syntax.Tm_app uu____3883 in
    FStar_Syntax_Syntax.mk uu____3882 in
  uu____3879 None uu____3878
>>>>>>> origin/guido_tactics
let mk_eq2:
  FStar_Syntax_Syntax.universe ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
            FStar_Syntax_Syntax.syntax
  =
  fun u  ->
    fun t  ->
      fun e1  ->
        fun e2  ->
          let eq_inst = FStar_Syntax_Syntax.mk_Tm_uinst teq [u] in
<<<<<<< HEAD
          let uu____3769 =
            FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos
              e2.FStar_Syntax_Syntax.pos in
          let uu____3770 =
            let uu____3773 =
              let uu____3774 =
                let uu____3784 =
                  let uu____3786 = FStar_Syntax_Syntax.iarg t in
                  let uu____3787 =
                    let uu____3789 = FStar_Syntax_Syntax.as_arg e1 in
                    let uu____3790 =
                      let uu____3792 = FStar_Syntax_Syntax.as_arg e2 in
                      [uu____3792] in
                    uu____3789 :: uu____3790 in
                  uu____3786 :: uu____3787 in
                (eq_inst, uu____3784) in
              FStar_Syntax_Syntax.Tm_app uu____3774 in
            FStar_Syntax_Syntax.mk uu____3773 in
          uu____3770 None uu____3769
=======
          let uu____3925 =
            FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos
              e2.FStar_Syntax_Syntax.pos in
          let uu____3926 =
            let uu____3929 =
              let uu____3930 =
                let uu____3940 =
                  let uu____3942 = FStar_Syntax_Syntax.iarg t in
                  let uu____3943 =
                    let uu____3945 = FStar_Syntax_Syntax.as_arg e1 in
                    let uu____3946 =
                      let uu____3948 = FStar_Syntax_Syntax.as_arg e2 in
                      [uu____3948] in
                    uu____3945 :: uu____3946 in
                  uu____3942 :: uu____3943 in
                (eq_inst, uu____3940) in
              FStar_Syntax_Syntax.Tm_app uu____3930 in
            FStar_Syntax_Syntax.mk uu____3929 in
          uu____3926 None uu____3925
>>>>>>> origin/guido_tactics
let mk_has_type t x t' =
  let t_has_type = fvar_const FStar_Syntax_Const.has_type_lid in
  let t_has_type1 =
    FStar_Syntax_Syntax.mk
      (FStar_Syntax_Syntax.Tm_uinst
         (t_has_type,
           [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero])) None
      FStar_Range.dummyRange in
<<<<<<< HEAD
  let uu____3830 =
    let uu____3833 =
      let uu____3834 =
        let uu____3844 =
          let uu____3846 = FStar_Syntax_Syntax.iarg t in
          let uu____3847 =
            let uu____3849 = FStar_Syntax_Syntax.as_arg x in
            let uu____3850 =
              let uu____3852 = FStar_Syntax_Syntax.as_arg t' in [uu____3852] in
            uu____3849 :: uu____3850 in
          uu____3846 :: uu____3847 in
        (t_has_type1, uu____3844) in
      FStar_Syntax_Syntax.Tm_app uu____3834 in
    FStar_Syntax_Syntax.mk uu____3833 in
  uu____3830 None FStar_Range.dummyRange
=======
  let uu____3990 =
    let uu____3993 =
      let uu____3994 =
        let uu____4004 =
          let uu____4006 = FStar_Syntax_Syntax.iarg t in
          let uu____4007 =
            let uu____4009 = FStar_Syntax_Syntax.as_arg x in
            let uu____4010 =
              let uu____4012 = FStar_Syntax_Syntax.as_arg t' in [uu____4012] in
            uu____4009 :: uu____4010 in
          uu____4006 :: uu____4007 in
        (t_has_type1, uu____4004) in
      FStar_Syntax_Syntax.Tm_app uu____3994 in
    FStar_Syntax_Syntax.mk uu____3993 in
  uu____3990 None FStar_Range.dummyRange
>>>>>>> origin/guido_tactics
let lex_t: FStar_Syntax_Syntax.term = fvar_const FStar_Syntax_Const.lex_t_lid
let lex_top: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uinst 
  (FStar_Syntax_Syntax.fvar FStar_Syntax_Const.lextop_lid FStar_Syntax_Syntax.Delta_constant (Some FStar_Syntax_Syntax.Data_ctor),
   [FStar_Syntax_Syntax.U_zero])) None FStar_Range.dummyRange
let lex_pair: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Syntax_Const.lexcons_lid
    FStar_Syntax_Syntax.Delta_constant (Some FStar_Syntax_Syntax.Data_ctor)
let tforall: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Syntax_Const.forall_lid
    (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1")) None
let t_haseq: FStar_Syntax_Syntax.term =
  FStar_Syntax_Syntax.fvar FStar_Syntax_Const.haseq_lid
    FStar_Syntax_Syntax.Delta_constant None
let lcomp_of_comp:
  (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.lcomp
  =
  fun c0  ->
<<<<<<< HEAD
    let uu____3871 =
      match c0.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____3878 ->
          (FStar_Syntax_Const.effect_Tot_lid, [FStar_Syntax_Syntax.TOTAL])
      | FStar_Syntax_Syntax.GTotal uu____3885 ->
=======
    let uu____4032 =
      match c0.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____4039 ->
          (FStar_Syntax_Const.effect_Tot_lid, [FStar_Syntax_Syntax.TOTAL])
      | FStar_Syntax_Syntax.GTotal uu____4046 ->
>>>>>>> origin/guido_tactics
          (FStar_Syntax_Const.effect_GTot_lid,
            [FStar_Syntax_Syntax.SOMETRIVIAL])
      | FStar_Syntax_Syntax.Comp c ->
          ((c.FStar_Syntax_Syntax.effect_name),
            (c.FStar_Syntax_Syntax.flags)) in
<<<<<<< HEAD
    match uu____3871 with
=======
    match uu____4032 with
>>>>>>> origin/guido_tactics
    | (eff_name,flags) ->
        {
          FStar_Syntax_Syntax.eff_name = eff_name;
          FStar_Syntax_Syntax.res_typ = (comp_result c0);
          FStar_Syntax_Syntax.cflags = flags;
<<<<<<< HEAD
          FStar_Syntax_Syntax.comp = ((fun uu____3899  -> c0))
        }
let mk_forall_aux fa x body =
  let uu____3923 =
    let uu____3926 =
      let uu____3927 =
        let uu____3937 =
          let uu____3939 =
            FStar_Syntax_Syntax.iarg x.FStar_Syntax_Syntax.sort in
          let uu____3940 =
            let uu____3942 =
              let uu____3943 =
                let uu____3944 =
                  let uu____3945 = FStar_Syntax_Syntax.mk_binder x in
                  [uu____3945] in
                let uu____3946 =
                  let uu____3953 =
                    let uu____3959 =
                      let uu____3960 = FStar_Syntax_Syntax.mk_Total ktype0 in
                      FStar_All.pipe_left lcomp_of_comp uu____3960 in
                    FStar_Util.Inl uu____3959 in
                  Some uu____3953 in
                abs uu____3944 body uu____3946 in
              FStar_Syntax_Syntax.as_arg uu____3943 in
            [uu____3942] in
          uu____3939 :: uu____3940 in
        (fa, uu____3937) in
      FStar_Syntax_Syntax.Tm_app uu____3927 in
    FStar_Syntax_Syntax.mk uu____3926 in
  uu____3923 None FStar_Range.dummyRange
=======
          FStar_Syntax_Syntax.comp = ((fun uu____4059  -> c0))
        }
let mk_residual_comp:
  FStar_Ident.lident ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax option ->
      FStar_Syntax_Syntax.cflags Prims.list ->
        FStar_Syntax_Syntax.residual_comp
  =
  fun l  ->
    fun t  ->
      fun f  ->
        {
          FStar_Syntax_Syntax.residual_effect = l;
          FStar_Syntax_Syntax.residual_typ = t;
          FStar_Syntax_Syntax.residual_flags = f
        }
let residual_tot:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.residual_comp
  =
  fun t  ->
    {
      FStar_Syntax_Syntax.residual_effect = FStar_Syntax_Const.effect_Tot_lid;
      FStar_Syntax_Syntax.residual_typ = (Some t);
      FStar_Syntax_Syntax.residual_flags = [FStar_Syntax_Syntax.TOTAL]
    }
let residual_comp_of_comp:
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.residual_comp =
  fun c  ->
    {
      FStar_Syntax_Syntax.residual_effect = (comp_effect_name c);
      FStar_Syntax_Syntax.residual_typ = (Some (comp_result c));
      FStar_Syntax_Syntax.residual_flags = (comp_flags c)
    }
let residual_comp_of_lcomp:
  FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.residual_comp =
  fun lc  ->
    {
      FStar_Syntax_Syntax.residual_effect = (lc.FStar_Syntax_Syntax.eff_name);
      FStar_Syntax_Syntax.residual_typ =
        (Some (lc.FStar_Syntax_Syntax.res_typ));
      FStar_Syntax_Syntax.residual_flags = (lc.FStar_Syntax_Syntax.cflags)
    }
let mk_forall_aux fa x body =
  let uu____4129 =
    let uu____4132 =
      let uu____4133 =
        let uu____4143 =
          let uu____4145 =
            FStar_Syntax_Syntax.iarg x.FStar_Syntax_Syntax.sort in
          let uu____4146 =
            let uu____4148 =
              let uu____4149 =
                let uu____4150 =
                  let uu____4151 = FStar_Syntax_Syntax.mk_binder x in
                  [uu____4151] in
                abs uu____4150 body (Some (residual_tot ktype0)) in
              FStar_Syntax_Syntax.as_arg uu____4149 in
            [uu____4148] in
          uu____4145 :: uu____4146 in
        (fa, uu____4143) in
      FStar_Syntax_Syntax.Tm_app uu____4133 in
    FStar_Syntax_Syntax.mk uu____4132 in
  uu____4129 None FStar_Range.dummyRange
>>>>>>> origin/guido_tactics
let mk_forall_no_univ:
  FStar_Syntax_Syntax.bv ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  = fun x  -> fun body  -> mk_forall_aux tforall x body
let mk_forall:
  FStar_Syntax_Syntax.universe ->
    FStar_Syntax_Syntax.bv ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
          FStar_Syntax_Syntax.syntax
  =
  fun u  ->
    fun x  ->
      fun body  ->
        let tforall1 = FStar_Syntax_Syntax.mk_Tm_uinst tforall [u] in
        mk_forall_aux tforall1 x body
let close_forall_no_univs:
  FStar_Syntax_Syntax.binder Prims.list ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ
  =
  fun bs  ->
    fun f  ->
      FStar_List.fold_right
        (fun b  ->
           fun f1  ->
<<<<<<< HEAD
             let uu____4013 = FStar_Syntax_Syntax.is_null_binder b in
             if uu____4013 then f1 else mk_forall_no_univ (fst b) f1) bs f
let rec is_wild_pat:
  FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t -> Prims.bool =
  fun p  ->
    match p.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_wild uu____4020 -> true
    | uu____4021 -> false
let if_then_else b t1 t2 =
  let then_branch =
    let uu____4063 =
=======
             let uu____4196 = FStar_Syntax_Syntax.is_null_binder b in
             if uu____4196 then f1 else mk_forall_no_univ (fst b) f1) bs f
let rec is_wild_pat p =
  match p.FStar_Syntax_Syntax.v with
  | FStar_Syntax_Syntax.Pat_wild uu____4211 -> true
  | uu____4212 -> false
let if_then_else b t1 t2 =
  let then_branch =
    let uu____4259 =
>>>>>>> origin/guido_tactics
      FStar_Syntax_Syntax.withinfo
        (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool true))
        t1.FStar_Syntax_Syntax.pos in
<<<<<<< HEAD
    (uu____4063, None, t1) in
  let else_branch =
    let uu____4083 =
      FStar_Syntax_Syntax.withinfo
        (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool false))
        t2.FStar_Syntax_Syntax.pos in
    (uu____4083, None, t2) in
  let uu____4093 =
    let uu____4094 =
      FStar_Range.union_ranges t1.FStar_Syntax_Syntax.pos
        t2.FStar_Syntax_Syntax.pos in
    FStar_Range.union_ranges b.FStar_Syntax_Syntax.pos uu____4094 in
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_match (b, [then_branch; else_branch])) None
    uu____4093
=======
    (uu____4259, None, t1) in
  let else_branch =
    let uu____4282 =
      FStar_Syntax_Syntax.withinfo
        (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool false))
        FStar_Syntax_Syntax.tun.FStar_Syntax_Syntax.n
        t2.FStar_Syntax_Syntax.pos in
    (uu____4282, None, t2) in
  let uu____4294 =
    let uu____4295 =
      FStar_Range.union_ranges t1.FStar_Syntax_Syntax.pos
        t2.FStar_Syntax_Syntax.pos in
    FStar_Range.union_ranges b.FStar_Syntax_Syntax.pos uu____4295 in
  FStar_Syntax_Syntax.mk
    (FStar_Syntax_Syntax.Tm_match (b, [then_branch; else_branch])) None
    uu____4294
let mk_squash p =
  let sq =
    FStar_Syntax_Syntax.fvar FStar_Syntax_Const.squash_lid
      (FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1")) None in
  let uu____4355 =
    FStar_Syntax_Syntax.mk_Tm_uinst sq [FStar_Syntax_Syntax.U_zero] in
  let uu____4358 =
    let uu____4364 = FStar_Syntax_Syntax.as_arg p in [uu____4364] in
  mk_app uu____4355 uu____4358
let un_squash:
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax option
  =
  fun t  ->
    let uu____4372 = head_and_args t in
    match uu____4372 with
    | (head1,args) ->
        let uu____4401 =
          let uu____4409 =
            let uu____4410 = un_uinst head1 in
            uu____4410.FStar_Syntax_Syntax.n in
          (uu____4409, args) in
        (match uu____4401 with
         | (FStar_Syntax_Syntax.Tm_fvar fv,(p,uu____4423)::[]) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.squash_lid
             -> Some p
         | (FStar_Syntax_Syntax.Tm_refine (b,p),[]) ->
             (match (b.FStar_Syntax_Syntax.sort).FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_fvar fv when
                  FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Syntax_Const.unit_lid
                  ->
                  let uu____4462 =
                    let uu____4465 =
                      let uu____4466 = FStar_Syntax_Syntax.mk_binder b in
                      [uu____4466] in
                    FStar_Syntax_Subst.open_term uu____4465 p in
                  (match uu____4462 with
                   | (bs,p1) ->
                       let b1 =
                         match bs with
                         | b1::[] -> b1
                         | uu____4484 -> failwith "impossible" in
                       let uu____4487 =
                         let uu____4488 = FStar_Syntax_Free.names p1 in
                         FStar_Util.set_mem (fst b1) uu____4488 in
                       if uu____4487 then None else Some p1)
              | uu____4496 -> None)
         | uu____4499 -> None)
let arrow_one:
  FStar_Syntax_Syntax.typ ->
    (FStar_Syntax_Syntax.binder* FStar_Syntax_Syntax.comp) option
  =
  fun t  ->
    let uu____4519 =
      let uu____4520 = FStar_Syntax_Subst.compress t in
      uu____4520.FStar_Syntax_Syntax.n in
    match uu____4519 with
    | FStar_Syntax_Syntax.Tm_arrow ([],c) ->
        failwith "fatal: empty binders on arrow?"
    | FStar_Syntax_Syntax.Tm_arrow (b::[],c) -> Some (b, c)
    | FStar_Syntax_Syntax.Tm_arrow (b::bs,c) ->
        let uu____4581 =
          let uu____4586 =
            let uu____4587 = arrow bs c in
            FStar_Syntax_Syntax.mk_Total uu____4587 in
          (b, uu____4586) in
        Some uu____4581
    | uu____4594 -> None
let is_free_in:
  FStar_Syntax_Syntax.bv -> FStar_Syntax_Syntax.term -> Prims.bool =
  fun bv  ->
    fun t  ->
      let uu____4605 = FStar_Syntax_Free.names t in
      FStar_Util.set_mem bv uu____4605
>>>>>>> origin/guido_tactics
type qpats = FStar_Syntax_Syntax.args Prims.list
type connective =
  | QAll of (FStar_Syntax_Syntax.binders* qpats* FStar_Syntax_Syntax.typ)
  | QEx of (FStar_Syntax_Syntax.binders* qpats* FStar_Syntax_Syntax.typ)
  | BaseConn of (FStar_Ident.lident* FStar_Syntax_Syntax.args)
let uu___is_QAll: connective -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | QAll _0 -> true | uu____4166 -> false
=======
    match projectee with | QAll _0 -> true | uu____4636 -> false
>>>>>>> origin/guido_tactics
let __proj__QAll__item___0:
  connective -> (FStar_Syntax_Syntax.binders* qpats* FStar_Syntax_Syntax.typ)
  = fun projectee  -> match projectee with | QAll _0 -> _0
let uu___is_QEx: connective -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | QEx _0 -> true | uu____4190 -> false
=======
    match projectee with | QEx _0 -> true | uu____4662 -> false
>>>>>>> origin/guido_tactics
let __proj__QEx__item___0:
  connective -> (FStar_Syntax_Syntax.binders* qpats* FStar_Syntax_Syntax.typ)
  = fun projectee  -> match projectee with | QEx _0 -> _0
let uu___is_BaseConn: connective -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | BaseConn _0 -> true | uu____4213 -> false
=======
    match projectee with | BaseConn _0 -> true | uu____4687 -> false
>>>>>>> origin/guido_tactics
let __proj__BaseConn__item___0:
  connective -> (FStar_Ident.lident* FStar_Syntax_Syntax.args) =
  fun projectee  -> match projectee with | BaseConn _0 -> _0
let destruct_typ_as_formula: FStar_Syntax_Syntax.term -> connective option =
  fun f  ->
    let rec unmeta_monadic f1 =
      let f2 = FStar_Syntax_Subst.compress f1 in
      match f2.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_meta
<<<<<<< HEAD
          (t,FStar_Syntax_Syntax.Meta_monadic uu____4238) -> unmeta_monadic t
      | FStar_Syntax_Syntax.Tm_meta
          (t,FStar_Syntax_Syntax.Meta_monadic_lift uu____4248) ->
          unmeta_monadic t
      | uu____4258 -> f2 in
=======
          (t,FStar_Syntax_Syntax.Meta_monadic uu____4714) -> unmeta_monadic t
      | FStar_Syntax_Syntax.Tm_meta
          (t,FStar_Syntax_Syntax.Meta_monadic_lift uu____4724) ->
          unmeta_monadic t
      | uu____4734 -> f2 in
>>>>>>> origin/guido_tactics
    let destruct_base_conn f1 =
      let connectives =
        [(FStar_Syntax_Const.true_lid, (Prims.parse_int "0"));
        (FStar_Syntax_Const.false_lid, (Prims.parse_int "0"));
        (FStar_Syntax_Const.and_lid, (Prims.parse_int "2"));
        (FStar_Syntax_Const.or_lid, (Prims.parse_int "2"));
        (FStar_Syntax_Const.imp_lid, (Prims.parse_int "2"));
        (FStar_Syntax_Const.iff_lid, (Prims.parse_int "2"));
        (FStar_Syntax_Const.ite_lid, (Prims.parse_int "3"));
        (FStar_Syntax_Const.not_lid, (Prims.parse_int "1"));
        (FStar_Syntax_Const.eq2_lid, (Prims.parse_int "3"));
        (FStar_Syntax_Const.eq2_lid, (Prims.parse_int "2"));
        (FStar_Syntax_Const.eq3_lid, (Prims.parse_int "4"));
        (FStar_Syntax_Const.eq3_lid, (Prims.parse_int "2"))] in
<<<<<<< HEAD
      let rec aux f2 uu____4303 =
        match uu____4303 with
        | (lid,arity) ->
            let uu____4309 =
              let uu____4319 = unmeta_monadic f2 in head_and_args uu____4319 in
            (match uu____4309 with
             | (t,args) ->
                 let t1 = un_uinst t in
                 let uu____4338 =
                   (is_constructor t1 lid) &&
                     ((FStar_List.length args) = arity) in
                 if uu____4338 then Some (BaseConn (lid, args)) else None) in
=======
      let aux f2 uu____4779 =
        match uu____4779 with
        | (lid,arity) ->
            let uu____4785 =
              let uu____4795 = unmeta_monadic f2 in head_and_args uu____4795 in
            (match uu____4785 with
             | (t,args) ->
                 let t1 = un_uinst t in
                 let uu____4814 =
                   (is_constructor t1 lid) &&
                     ((FStar_List.length args) = arity) in
                 if uu____4814 then Some (BaseConn (lid, args)) else None) in
>>>>>>> origin/guido_tactics
      FStar_Util.find_map connectives (aux f1) in
    let patterns t =
      let t1 = FStar_Syntax_Subst.compress t in
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_meta
          (t2,FStar_Syntax_Syntax.Meta_pattern pats) ->
<<<<<<< HEAD
          let uu____4389 = FStar_Syntax_Subst.compress t2 in
          (pats, uu____4389)
      | uu____4396 ->
          let uu____4397 = FStar_Syntax_Subst.compress t1 in ([], uu____4397) in
=======
          let uu____4869 = FStar_Syntax_Subst.compress t2 in
          (pats, uu____4869)
      | uu____4876 ->
          let uu____4877 = FStar_Syntax_Subst.compress t1 in ([], uu____4877) in
>>>>>>> origin/guido_tactics
    let destruct_q_conn t =
      let is_q fa fv =
        if fa
        then is_forall (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
        else is_exists (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
      let flat t1 =
<<<<<<< HEAD
        let uu____4431 = head_and_args t1 in
        match uu____4431 with
        | (t2,args) ->
            let uu____4462 = un_uinst t2 in
            let uu____4463 =
              FStar_All.pipe_right args
                (FStar_List.map
                   (fun uu____4483  ->
                      match uu____4483 with
                      | (t3,imp) ->
                          let uu____4490 = unascribe t3 in (uu____4490, imp))) in
            (uu____4462, uu____4463) in
      let rec aux qopt out t1 =
        let uu____4513 = let uu____4522 = flat t1 in (qopt, uu____4522) in
        match uu____4513 with
        | (Some
           fa,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
                 FStar_Syntax_Syntax.tk = uu____4537;
                 FStar_Syntax_Syntax.pos = uu____4538;
                 FStar_Syntax_Syntax.vars = uu____4539;_},({
                                                             FStar_Syntax_Syntax.n
                                                               =
                                                               FStar_Syntax_Syntax.Tm_abs
                                                               (b::[],t2,uu____4542);
                                                             FStar_Syntax_Syntax.tk
                                                               = uu____4543;
                                                             FStar_Syntax_Syntax.pos
                                                               = uu____4544;
                                                             FStar_Syntax_Syntax.vars
                                                               = uu____4545;_},uu____4546)::[]))
            when is_q fa tc -> aux qopt (b :: out) t2
        | (Some
           fa,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
                 FStar_Syntax_Syntax.tk = uu____4607;
                 FStar_Syntax_Syntax.pos = uu____4608;
                 FStar_Syntax_Syntax.vars = uu____4609;_},uu____4610::
               ({
                  FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs
                    (b::[],t2,uu____4613);
                  FStar_Syntax_Syntax.tk = uu____4614;
                  FStar_Syntax_Syntax.pos = uu____4615;
                  FStar_Syntax_Syntax.vars = uu____4616;_},uu____4617)::[]))
            when is_q fa tc -> aux qopt (b :: out) t2
        | (None
           ,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
               FStar_Syntax_Syntax.tk = uu____4685;
               FStar_Syntax_Syntax.pos = uu____4686;
               FStar_Syntax_Syntax.vars = uu____4687;_},({
                                                           FStar_Syntax_Syntax.n
                                                             =
                                                             FStar_Syntax_Syntax.Tm_abs
                                                             (b::[],t2,uu____4690);
                                                           FStar_Syntax_Syntax.tk
                                                             = uu____4691;
                                                           FStar_Syntax_Syntax.pos
                                                             = uu____4692;
                                                           FStar_Syntax_Syntax.vars
                                                             = uu____4693;_},uu____4694)::[]))
=======
        let uu____4919 = head_and_args t1 in
        match uu____4919 with
        | (t2,args) ->
            let uu____4950 = un_uinst t2 in
            let uu____4951 =
              FStar_All.pipe_right args
                (FStar_List.map
                   (fun uu____4967  ->
                      match uu____4967 with
                      | (t3,imp) ->
                          let uu____4974 = unascribe t3 in (uu____4974, imp))) in
            (uu____4950, uu____4951) in
      let rec aux qopt out t1 =
        let uu____4997 = let uu____5006 = flat t1 in (qopt, uu____5006) in
        match uu____4997 with
        | (Some
           fa,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
                 FStar_Syntax_Syntax.tk = uu____5021;
                 FStar_Syntax_Syntax.pos = uu____5022;
                 FStar_Syntax_Syntax.vars = uu____5023;_},({
                                                             FStar_Syntax_Syntax.n
                                                               =
                                                               FStar_Syntax_Syntax.Tm_abs
                                                               (b::[],t2,uu____5026);
                                                             FStar_Syntax_Syntax.tk
                                                               = uu____5027;
                                                             FStar_Syntax_Syntax.pos
                                                               = uu____5028;
                                                             FStar_Syntax_Syntax.vars
                                                               = uu____5029;_},uu____5030)::[]))
            when is_q fa tc -> aux qopt (b :: out) t2
        | (Some
           fa,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
                 FStar_Syntax_Syntax.tk = uu____5081;
                 FStar_Syntax_Syntax.pos = uu____5082;
                 FStar_Syntax_Syntax.vars = uu____5083;_},uu____5084::
               ({
                  FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs
                    (b::[],t2,uu____5087);
                  FStar_Syntax_Syntax.tk = uu____5088;
                  FStar_Syntax_Syntax.pos = uu____5089;
                  FStar_Syntax_Syntax.vars = uu____5090;_},uu____5091)::[]))
            when is_q fa tc -> aux qopt (b :: out) t2
        | (None
           ,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
               FStar_Syntax_Syntax.tk = uu____5149;
               FStar_Syntax_Syntax.pos = uu____5150;
               FStar_Syntax_Syntax.vars = uu____5151;_},({
                                                           FStar_Syntax_Syntax.n
                                                             =
                                                             FStar_Syntax_Syntax.Tm_abs
                                                             (b::[],t2,uu____5154);
                                                           FStar_Syntax_Syntax.tk
                                                             = uu____5155;
                                                           FStar_Syntax_Syntax.pos
                                                             = uu____5156;
                                                           FStar_Syntax_Syntax.vars
                                                             = uu____5157;_},uu____5158)::[]))
>>>>>>> origin/guido_tactics
            when
            is_qlid (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v ->
            aux
              (Some
                 (is_forall
                    (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v))
              (b :: out) t2
        | (None
           ,({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar tc;
<<<<<<< HEAD
               FStar_Syntax_Syntax.tk = uu____4754;
               FStar_Syntax_Syntax.pos = uu____4755;
               FStar_Syntax_Syntax.vars = uu____4756;_},uu____4757::({
                                                                    FStar_Syntax_Syntax.n
                                                                    =
                                                                    FStar_Syntax_Syntax.Tm_abs
                                                                    (b::[],t2,uu____4760);
                                                                    FStar_Syntax_Syntax.tk
                                                                    =
                                                                    uu____4761;
                                                                    FStar_Syntax_Syntax.pos
                                                                    =
                                                                    uu____4762;
                                                                    FStar_Syntax_Syntax.vars
                                                                    =
                                                                    uu____4763;_},uu____4764)::[]))
=======
               FStar_Syntax_Syntax.tk = uu____5216;
               FStar_Syntax_Syntax.pos = uu____5217;
               FStar_Syntax_Syntax.vars = uu____5218;_},uu____5219::({
                                                                    FStar_Syntax_Syntax.n
                                                                    =
                                                                    FStar_Syntax_Syntax.Tm_abs
                                                                    (b::[],t2,uu____5222);
                                                                    FStar_Syntax_Syntax.tk
                                                                    =
                                                                    uu____5223;
                                                                    FStar_Syntax_Syntax.pos
                                                                    =
                                                                    uu____5224;
                                                                    FStar_Syntax_Syntax.vars
                                                                    =
                                                                    uu____5225;_},uu____5226)::[]))
>>>>>>> origin/guido_tactics
            when
            is_qlid (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v ->
            aux
              (Some
                 (is_forall
                    (tc.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v))
              (b :: out) t2
<<<<<<< HEAD
        | (Some b,uu____4832) ->
            let bs = FStar_List.rev out in
            let uu____4850 = FStar_Syntax_Subst.open_term bs t1 in
            (match uu____4850 with
             | (bs1,t2) ->
                 let uu____4856 = patterns t2 in
                 (match uu____4856 with
=======
        | (Some b,uu____5292) ->
            let bs = FStar_List.rev out in
            let uu____5310 = FStar_Syntax_Subst.open_term bs t1 in
            (match uu____5310 with
             | (bs1,t2) ->
                 let uu____5316 = patterns t2 in
                 (match uu____5316 with
>>>>>>> origin/guido_tactics
                  | (pats,body) ->
                      if b
                      then Some (QAll (bs1, pats, body))
                      else Some (QEx (bs1, pats, body))))
<<<<<<< HEAD
        | uu____4894 -> None in
=======
        | uu____5354 -> None in
>>>>>>> origin/guido_tactics
      aux None [] t in
    let u_connectives =
      [(FStar_Syntax_Const.true_lid, FStar_Syntax_Const.c_true_lid,
         (Prims.parse_int "0"));
      (FStar_Syntax_Const.false_lid, FStar_Syntax_Const.c_false_lid,
        (Prims.parse_int "0"));
      (FStar_Syntax_Const.and_lid, FStar_Syntax_Const.c_and_lid,
        (Prims.parse_int "2"));
      (FStar_Syntax_Const.or_lid, FStar_Syntax_Const.c_or_lid,
        (Prims.parse_int "2"))] in
    let destruct_sq_base_conn t =
      let uu____5390 = un_squash t in
      FStar_Util.bind_opt uu____5390
        (fun t1  ->
           let uu____5399 = head_and_args' t1 in
           match uu____5399 with
           | (hd1,args) ->
               let uu____5420 =
                 let uu____5423 =
                   let uu____5424 = un_uinst hd1 in
                   uu____5424.FStar_Syntax_Syntax.n in
                 (uu____5423, (FStar_List.length args)) in
               (match uu____5420 with
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_28) when
                    (_0_28 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_and_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.and_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_29) when
                    (_0_29 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_or_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.or_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_30) when
                    (_0_30 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_eq2_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.eq2_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_31) when
                    (_0_31 = (Prims.parse_int "3")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_eq2_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.eq2_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_32) when
                    (_0_32 = (Prims.parse_int "2")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_eq3_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.eq3_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_33) when
                    (_0_33 = (Prims.parse_int "4")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_eq3_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.eq3_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_34) when
                    (_0_34 = (Prims.parse_int "0")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_true_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.true_lid, args))
                | (FStar_Syntax_Syntax.Tm_fvar fv,_0_35) when
                    (_0_35 = (Prims.parse_int "0")) &&
                      (FStar_Syntax_Syntax.fv_eq_lid fv
                         FStar_Syntax_Const.c_false_lid)
                    -> Some (BaseConn (FStar_Syntax_Const.false_lid, args))
                | uu____5484 -> None)) in
    let rec destruct_sq_forall t =
      let uu____5501 = un_squash t in
      FStar_Util.bind_opt uu____5501
        (fun t1  ->
           let uu____5510 = arrow_one t1 in
           match uu____5510 with
           | Some (b,c) ->
               let uu____5519 =
                 let uu____5520 = is_tot_or_gtot_comp c in
                 Prims.op_Negation uu____5520 in
               if uu____5519
               then None
               else
                 (let q =
                    let uu____5526 = comp_to_comp_typ c in
                    uu____5526.FStar_Syntax_Syntax.result_typ in
                  let uu____5527 = FStar_Syntax_Subst.open_term [b] q in
                  match uu____5527 with
                  | (bs,q1) ->
                      let b1 =
                        match bs with
                        | b1::[] -> b1
                        | uu____5545 -> failwith "impossible" in
                      let uu____5548 = is_free_in (fst b1) q1 in
                      if uu____5548
                      then
                        let uu____5550 = patterns q1 in
                        (match uu____5550 with
                         | (pats,q2) ->
                             FStar_All.pipe_left maybe_collect
                               (Some (QAll ([b1], pats, q2))))
                      else
                        (let uu____5590 =
                           let uu____5591 =
                             let uu____5594 =
                               let uu____5596 =
                                 FStar_Syntax_Syntax.as_arg
                                   (fst b1).FStar_Syntax_Syntax.sort in
                               let uu____5597 =
                                 let uu____5599 =
                                   FStar_Syntax_Syntax.as_arg q1 in
                                 [uu____5599] in
                               uu____5596 :: uu____5597 in
                             (FStar_Syntax_Const.imp_lid, uu____5594) in
                           BaseConn uu____5591 in
                         Some uu____5590))
           | uu____5601 -> None)
    and destruct_sq_exists t =
      let uu____5606 = un_squash t in
      FStar_Util.bind_opt uu____5606
        (fun t1  ->
           let uu____5615 = head_and_args' t1 in
           match uu____5615 with
           | (hd1,args) ->
               let uu____5636 =
                 let uu____5644 =
                   let uu____5645 = un_uinst hd1 in
                   uu____5645.FStar_Syntax_Syntax.n in
                 (uu____5644, args) in
               (match uu____5636 with
                | (FStar_Syntax_Syntax.Tm_fvar
                   fv,(a1,uu____5656)::(a2,uu____5658)::[]) when
                    FStar_Syntax_Syntax.fv_eq_lid fv
                      FStar_Syntax_Const.dtuple2_lid
                    ->
                    let uu____5684 =
                      let uu____5685 = FStar_Syntax_Subst.compress a2 in
                      uu____5685.FStar_Syntax_Syntax.n in
                    (match uu____5684 with
                     | FStar_Syntax_Syntax.Tm_abs (b::[],q,uu____5691) ->
                         let uu____5707 = FStar_Syntax_Subst.open_term [b] q in
                         (match uu____5707 with
                          | (bs,q1) ->
                              let b1 =
                                match bs with
                                | b1::[] -> b1
                                | uu____5729 -> failwith "impossible" in
                              let uu____5732 = patterns q1 in
                              (match uu____5732 with
                               | (pats,q2) ->
                                   FStar_All.pipe_left maybe_collect
                                     (Some (QEx ([b1], pats, q2)))))
                     | uu____5771 -> None)
                | uu____5772 -> None))
    and maybe_collect f1 =
      match f1 with
      | Some (QAll (bs,pats,phi)) ->
          let uu____5786 = destruct_sq_forall phi in
          (match uu____5786 with
           | Some (QAll (bs',pats',psi)) ->
               FStar_All.pipe_left (fun _0_36  -> Some _0_36)
                 (QAll
                    ((FStar_List.append bs bs'),
                      (FStar_List.append pats pats'), psi))
           | uu____5799 -> f1)
      | Some (QEx (bs,pats,phi)) ->
          let uu____5804 = destruct_sq_exists phi in
          (match uu____5804 with
           | Some (QEx (bs',pats',psi)) ->
               FStar_All.pipe_left (fun _0_37  -> Some _0_37)
                 (QEx
                    ((FStar_List.append bs bs'),
                      (FStar_List.append pats pats'), psi))
           | uu____5817 -> f1)
      | uu____5819 -> f1 in
    let phi = unmeta_monadic f in
<<<<<<< HEAD
    let uu____4906 = destruct_base_conn phi in
    match uu____4906 with | Some b -> Some b | None  -> destruct_q_conn phi
=======
    let uu____5822 = destruct_base_conn phi in
    FStar_Util.catch_opt uu____5822
      (fun uu____5824  ->
         let uu____5825 = destruct_q_conn phi in
         FStar_Util.catch_opt uu____5825
           (fun uu____5827  ->
              let uu____5828 = destruct_sq_base_conn phi in
              FStar_Util.catch_opt uu____5828
                (fun uu____5830  ->
                   let uu____5831 = destruct_sq_forall phi in
                   FStar_Util.catch_opt uu____5831
                     (fun uu____5833  ->
                        let uu____5834 = destruct_sq_exists phi in
                        FStar_Util.catch_opt uu____5834
                          (fun uu____5836  -> None)))))
>>>>>>> origin/guido_tactics
let action_as_lb:
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.action -> FStar_Syntax_Syntax.sigelt
  =
  fun eff_lid  ->
    fun a  ->
      let lb =
<<<<<<< HEAD
        let uu____4917 =
          let uu____4920 =
            FStar_Syntax_Syntax.lid_as_fv a.FStar_Syntax_Syntax.action_name
              FStar_Syntax_Syntax.Delta_equational None in
          FStar_Util.Inr uu____4920 in
        let uu____4921 =
          let uu____4922 =
            FStar_Syntax_Syntax.mk_Total a.FStar_Syntax_Syntax.action_typ in
          arrow a.FStar_Syntax_Syntax.action_params uu____4922 in
        let uu____4925 =
          abs a.FStar_Syntax_Syntax.action_params
            a.FStar_Syntax_Syntax.action_defn None in
        close_univs_and_mk_letbinding None uu____4917
          a.FStar_Syntax_Syntax.action_univs uu____4921
          FStar_Syntax_Const.effect_Tot_lid uu____4925 in
=======
        let uu____5846 =
          let uu____5849 =
            FStar_Syntax_Syntax.lid_as_fv a.FStar_Syntax_Syntax.action_name
              FStar_Syntax_Syntax.Delta_equational None in
          FStar_Util.Inr uu____5849 in
        let uu____5850 =
          let uu____5851 =
            FStar_Syntax_Syntax.mk_Total a.FStar_Syntax_Syntax.action_typ in
          arrow a.FStar_Syntax_Syntax.action_params uu____5851 in
        let uu____5854 =
          abs a.FStar_Syntax_Syntax.action_params
            a.FStar_Syntax_Syntax.action_defn None in
        close_univs_and_mk_letbinding None uu____5846
          a.FStar_Syntax_Syntax.action_univs uu____5850
          FStar_Syntax_Const.effect_Tot_lid uu____5854 in
>>>>>>> origin/guido_tactics
      {
        FStar_Syntax_Syntax.sigel =
          (FStar_Syntax_Syntax.Sig_let
             ((false, [lb]), [a.FStar_Syntax_Syntax.action_name], []));
        FStar_Syntax_Syntax.sigrng =
          ((a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos);
        FStar_Syntax_Syntax.sigquals =
          [FStar_Syntax_Syntax.Visible_default;
          FStar_Syntax_Syntax.Action eff_lid];
        FStar_Syntax_Syntax.sigmeta = FStar_Syntax_Syntax.default_sigmeta
      }
let mk_reify t =
  let reify_ =
    FStar_Syntax_Syntax.mk
      (FStar_Syntax_Syntax.Tm_constant FStar_Const.Const_reify) None
      t.FStar_Syntax_Syntax.pos in
<<<<<<< HEAD
  let uu____4958 =
    let uu____4961 =
      let uu____4962 =
        let uu____4972 =
          let uu____4974 = FStar_Syntax_Syntax.as_arg t in [uu____4974] in
        (reify_, uu____4972) in
      FStar_Syntax_Syntax.Tm_app uu____4962 in
    FStar_Syntax_Syntax.mk uu____4961 in
  uu____4958 None t.FStar_Syntax_Syntax.pos
=======
  let uu____5884 =
    let uu____5887 =
      let uu____5888 =
        let uu____5898 =
          let uu____5900 = FStar_Syntax_Syntax.as_arg t in [uu____5900] in
        (reify_, uu____5898) in
      FStar_Syntax_Syntax.Tm_app uu____5888 in
    FStar_Syntax_Syntax.mk uu____5887 in
  uu____5884 None t.FStar_Syntax_Syntax.pos
>>>>>>> origin/guido_tactics
let rec delta_qualifier:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.delta_depth =
  fun t  ->
    let t1 = FStar_Syntax_Subst.compress t in
    match t1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
    | FStar_Syntax_Syntax.Tm_delayed uu____4990 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_fvar fv -> fv.FStar_Syntax_Syntax.fv_delta
    | FStar_Syntax_Syntax.Tm_bvar uu____5012 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_name uu____5013 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_match uu____5014 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_uvar uu____5029 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_unknown  -> FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_type uu____5040 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_constant uu____5041 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_arrow uu____5042 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_uinst (t2,uu____5051) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_refine
        ({ FStar_Syntax_Syntax.ppname = uu____5056;
           FStar_Syntax_Syntax.index = uu____5057;
           FStar_Syntax_Syntax.sort = t2;_},uu____5059)
        -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_meta (t2,uu____5067) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____5073,uu____5074) ->
        delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_app (t2,uu____5104) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_abs (uu____5119,t2,uu____5121) ->
        delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_let (uu____5144,t2) -> delta_qualifier t2
=======
    | FStar_Syntax_Syntax.Tm_delayed uu____5917 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_fvar fv -> fv.FStar_Syntax_Syntax.fv_delta
    | FStar_Syntax_Syntax.Tm_bvar uu____5933 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_name uu____5934 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_match uu____5935 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_uvar uu____5951 ->
        FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_unknown  -> FStar_Syntax_Syntax.Delta_equational
    | FStar_Syntax_Syntax.Tm_type uu____5960 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_constant uu____5961 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_arrow uu____5962 ->
        FStar_Syntax_Syntax.Delta_constant
    | FStar_Syntax_Syntax.Tm_uinst (t2,uu____5971) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_refine
        ({ FStar_Syntax_Syntax.ppname = uu____5976;
           FStar_Syntax_Syntax.index = uu____5977;
           FStar_Syntax_Syntax.sort = t2;_},uu____5979)
        -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_meta (t2,uu____5987) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____5993,uu____5994) ->
        delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_app (t2,uu____6024) -> delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_abs (uu____6039,t2,uu____6041) ->
        delta_qualifier t2
    | FStar_Syntax_Syntax.Tm_let (uu____6054,t2) -> delta_qualifier t2
>>>>>>> origin/guido_tactics
let rec incr_delta_depth:
  FStar_Syntax_Syntax.delta_depth -> FStar_Syntax_Syntax.delta_depth =
  fun d  ->
    match d with
    | FStar_Syntax_Syntax.Delta_equational  -> d
    | FStar_Syntax_Syntax.Delta_constant  ->
        FStar_Syntax_Syntax.Delta_defined_at_level (Prims.parse_int "1")
    | FStar_Syntax_Syntax.Delta_defined_at_level i ->
        FStar_Syntax_Syntax.Delta_defined_at_level
          (i + (Prims.parse_int "1"))
    | FStar_Syntax_Syntax.Delta_abstract d1 -> incr_delta_depth d1
let incr_delta_qualifier:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.delta_depth =
<<<<<<< HEAD
  fun t  -> let uu____5164 = delta_qualifier t in incr_delta_depth uu____5164
let is_unknown: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____5168 =
      let uu____5169 = FStar_Syntax_Subst.compress t in
      uu____5169.FStar_Syntax_Syntax.n in
    match uu____5168 with
    | FStar_Syntax_Syntax.Tm_unknown  -> true
    | uu____5172 -> false
let rec list_elements:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term Prims.list option =
  fun e  ->
    let uu____5180 = let uu____5190 = unmeta e in head_and_args uu____5190 in
    match uu____5180 with
    | (head1,args) ->
        let uu____5209 =
          let uu____5217 =
            let uu____5218 = un_uinst head1 in
            uu____5218.FStar_Syntax_Syntax.n in
          (uu____5217, args) in
        (match uu____5209 with
         | (FStar_Syntax_Syntax.Tm_fvar fv,uu____5229) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.nil_lid ->
             Some []
         | (FStar_Syntax_Syntax.Tm_fvar
            fv,uu____5242::(hd1,uu____5244)::(tl1,uu____5246)::[]) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.cons_lid ->
             let uu____5280 =
               let uu____5284 =
                 let uu____5288 = list_elements tl1 in
                 FStar_Util.must uu____5288 in
               hd1 :: uu____5284 in
             Some uu____5280
         | uu____5297 -> None)
let rec apply_last f l =
  match l with
  | [] -> failwith "apply_last: got empty list"
  | a::[] -> let uu____5328 = f a in [uu____5328]
  | x::xs -> let uu____5332 = apply_last f xs in x :: uu____5332
=======
  fun t  -> let uu____6076 = delta_qualifier t in incr_delta_depth uu____6076
let is_unknown: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____6081 =
      let uu____6082 = FStar_Syntax_Subst.compress t in
      uu____6082.FStar_Syntax_Syntax.n in
    match uu____6081 with
    | FStar_Syntax_Syntax.Tm_unknown  -> true
    | uu____6085 -> false
let rec list_elements:
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term Prims.list option =
  fun e  ->
    let uu____6094 = let uu____6104 = unmeta e in head_and_args uu____6104 in
    match uu____6094 with
    | (head1,args) ->
        let uu____6123 =
          let uu____6131 =
            let uu____6132 = un_uinst head1 in
            uu____6132.FStar_Syntax_Syntax.n in
          (uu____6131, args) in
        (match uu____6123 with
         | (FStar_Syntax_Syntax.Tm_fvar fv,uu____6143) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.nil_lid ->
             Some []
         | (FStar_Syntax_Syntax.Tm_fvar
            fv,uu____6156::(hd1,uu____6158)::(tl1,uu____6160)::[]) when
             FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.cons_lid ->
             let uu____6194 =
               let uu____6198 =
                 let uu____6202 = list_elements tl1 in
                 FStar_Util.must uu____6202 in
               hd1 :: uu____6198 in
             Some uu____6194
         | uu____6211 -> None)
let rec apply_last f l =
  match l with
  | [] -> failwith "apply_last: got empty list"
  | a::[] -> let uu____6245 = f a in [uu____6245]
  | x::xs -> let uu____6249 = apply_last f xs in x :: uu____6249
>>>>>>> origin/guido_tactics
let dm4f_lid:
  FStar_Syntax_Syntax.eff_decl -> Prims.string -> FStar_Ident.lident =
  fun ed  ->
    fun name  ->
      let p = FStar_Ident.path_of_lid ed.FStar_Syntax_Syntax.mname in
      let p' =
        apply_last
          (fun s  ->
             Prims.strcat "_dm4f_" (Prims.strcat s (Prims.strcat "_" name)))
          p in
      FStar_Ident.lid_of_path p' FStar_Range.dummyRange
let rec mk_list:
  FStar_Syntax_Syntax.term ->
    FStar_Range.range ->
      FStar_Syntax_Syntax.term Prims.list -> FStar_Syntax_Syntax.term
  =
  fun typ  ->
    fun rng  ->
      fun l  ->
        let ctor l1 =
<<<<<<< HEAD
          let uu____5363 =
            let uu____5366 =
              let uu____5367 =
                FStar_Syntax_Syntax.lid_as_fv l1
                  FStar_Syntax_Syntax.Delta_constant
                  (Some FStar_Syntax_Syntax.Data_ctor) in
              FStar_Syntax_Syntax.Tm_fvar uu____5367 in
            FStar_Syntax_Syntax.mk uu____5366 in
          uu____5363 None rng in
        let cons1 args pos =
          let uu____5385 =
            let uu____5386 =
              let uu____5387 = ctor FStar_Syntax_Const.cons_lid in
              FStar_Syntax_Syntax.mk_Tm_uinst uu____5387
                [FStar_Syntax_Syntax.U_zero] in
            FStar_Syntax_Syntax.mk_Tm_app uu____5386 args in
          uu____5385 None pos in
        let nil args pos =
          let uu____5401 =
            let uu____5402 =
              let uu____5403 = ctor FStar_Syntax_Const.nil_lid in
              FStar_Syntax_Syntax.mk_Tm_uinst uu____5403
                [FStar_Syntax_Syntax.U_zero] in
            FStar_Syntax_Syntax.mk_Tm_app uu____5402 args in
          uu____5401 None pos in
        let uu____5408 =
          let uu____5409 =
            let uu____5410 = FStar_Syntax_Syntax.iarg typ in [uu____5410] in
          nil uu____5409 rng in
        FStar_List.fold_right
          (fun t  ->
             fun a  ->
               let uu____5416 =
                 let uu____5417 = FStar_Syntax_Syntax.iarg typ in
                 let uu____5418 =
                   let uu____5420 = FStar_Syntax_Syntax.as_arg t in
                   let uu____5421 =
                     let uu____5423 = FStar_Syntax_Syntax.as_arg a in
                     [uu____5423] in
                   uu____5420 :: uu____5421 in
                 uu____5417 :: uu____5418 in
               cons1 uu____5416 t.FStar_Syntax_Syntax.pos) l uu____5408
=======
          let uu____6284 =
            let uu____6287 =
              let uu____6288 =
                FStar_Syntax_Syntax.lid_as_fv l1
                  FStar_Syntax_Syntax.Delta_constant
                  (Some FStar_Syntax_Syntax.Data_ctor) in
              FStar_Syntax_Syntax.Tm_fvar uu____6288 in
            FStar_Syntax_Syntax.mk uu____6287 in
          uu____6284 None rng in
        let cons1 args pos =
          let uu____6306 =
            let uu____6307 =
              let uu____6308 = ctor FStar_Syntax_Const.cons_lid in
              FStar_Syntax_Syntax.mk_Tm_uinst uu____6308
                [FStar_Syntax_Syntax.U_zero] in
            FStar_Syntax_Syntax.mk_Tm_app uu____6307 args in
          uu____6306 None pos in
        let nil args pos =
          let uu____6322 =
            let uu____6323 =
              let uu____6324 = ctor FStar_Syntax_Const.nil_lid in
              FStar_Syntax_Syntax.mk_Tm_uinst uu____6324
                [FStar_Syntax_Syntax.U_zero] in
            FStar_Syntax_Syntax.mk_Tm_app uu____6323 args in
          uu____6322 None pos in
        let uu____6329 =
          let uu____6330 =
            let uu____6331 = FStar_Syntax_Syntax.iarg typ in [uu____6331] in
          nil uu____6330 rng in
        FStar_List.fold_right
          (fun t  ->
             fun a  ->
               let uu____6334 =
                 let uu____6335 = FStar_Syntax_Syntax.iarg typ in
                 let uu____6336 =
                   let uu____6338 = FStar_Syntax_Syntax.as_arg t in
                   let uu____6339 =
                     let uu____6341 = FStar_Syntax_Syntax.as_arg a in
                     [uu____6341] in
                   uu____6338 :: uu____6339 in
                 uu____6335 :: uu____6336 in
               cons1 uu____6334 t.FStar_Syntax_Syntax.pos) l uu____6329
>>>>>>> origin/guido_tactics
let rec eqlist eq1 xs ys =
  match (xs, ys) with
  | ([],[]) -> true
  | (x::xs1,y::ys1) -> (eq1 x y) && (eqlist eq1 xs1 ys1)
<<<<<<< HEAD
  | uu____5467 -> false
=======
  | uu____6389 -> false
>>>>>>> origin/guido_tactics
let eqsum e1 e2 x y =
  match (x, y) with
  | (FStar_Util.Inl x1,FStar_Util.Inl y1) -> e1 x1 y1
  | (FStar_Util.Inr x1,FStar_Util.Inr y1) -> e2 x1 y1
<<<<<<< HEAD
  | uu____5540 -> false
let eqprod e1 e2 x y =
  match (x, y) with | ((x1,x2),(y1,y2)) -> (e1 x1 y1) && (e2 x2 y2)
let eqopt e x y =
  match (x, y) with | (Some x1,Some y1) -> e x1 y1 | uu____5648 -> false
=======
  | uu____6468 -> false
let eqprod e1 e2 x y =
  match (x, y) with | ((x1,x2),(y1,y2)) -> (e1 x1 y1) && (e2 x2 y2)
let eqopt e x y =
  match (x, y) with | (Some x1,Some y1) -> e x1 y1 | uu____6586 -> false
>>>>>>> origin/guido_tactics
let rec term_eq:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax -> Prims.bool
  =
  fun t1  ->
    fun t2  ->
<<<<<<< HEAD
      let uu____5723 =
        let uu____5726 =
          let uu____5727 = FStar_Syntax_Subst.compress t1 in
          uu____5727.FStar_Syntax_Syntax.n in
        let uu____5730 =
          let uu____5731 = FStar_Syntax_Subst.compress t2 in
          uu____5731.FStar_Syntax_Syntax.n in
        (uu____5726, uu____5730) in
      match uu____5723 with
=======
      let canon_app t =
        match t.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_app uu____6699 ->
            let uu____6709 = head_and_args' t in
            (match uu____6709 with
             | (hd1,args) ->
                 let uu___180_6731 = t in
                 {
                   FStar_Syntax_Syntax.n =
                     (FStar_Syntax_Syntax.Tm_app (hd1, args));
                   FStar_Syntax_Syntax.tk =
                     (uu___180_6731.FStar_Syntax_Syntax.tk);
                   FStar_Syntax_Syntax.pos =
                     (uu___180_6731.FStar_Syntax_Syntax.pos);
                   FStar_Syntax_Syntax.vars =
                     (uu___180_6731.FStar_Syntax_Syntax.vars)
                 })
        | uu____6743 -> t in
      let t11 = canon_app t1 in
      let t21 = canon_app t2 in
      match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n)) with
>>>>>>> origin/guido_tactics
      | (FStar_Syntax_Syntax.Tm_bvar x,FStar_Syntax_Syntax.Tm_bvar y) ->
          x.FStar_Syntax_Syntax.index = y.FStar_Syntax_Syntax.index
      | (FStar_Syntax_Syntax.Tm_name x,FStar_Syntax_Syntax.Tm_name y) ->
          FStar_Syntax_Syntax.bv_eq x y
      | (FStar_Syntax_Syntax.Tm_fvar x,FStar_Syntax_Syntax.Tm_fvar y) ->
          FStar_Syntax_Syntax.fv_eq x y
      | (FStar_Syntax_Syntax.Tm_uinst (t12,us1),FStar_Syntax_Syntax.Tm_uinst
         (t22,us2)) -> (eqlist eq_univs us1 us2) && (term_eq t12 t22)
      | (FStar_Syntax_Syntax.Tm_constant x,FStar_Syntax_Syntax.Tm_constant y)
          -> x = y
      | (FStar_Syntax_Syntax.Tm_type x,FStar_Syntax_Syntax.Tm_type y) ->
          x = y
      | (FStar_Syntax_Syntax.Tm_abs (b1,t12,k1),FStar_Syntax_Syntax.Tm_abs
         (b2,t22,k2)) -> (eqlist binder_eq b1 b2) && (term_eq t12 t22)
      | (FStar_Syntax_Syntax.Tm_app (f1,a1),FStar_Syntax_Syntax.Tm_app
         (f2,a2)) -> (term_eq f1 f2) && (eqlist arg_eq a1 a2)
      | (FStar_Syntax_Syntax.Tm_arrow (b1,c1),FStar_Syntax_Syntax.Tm_arrow
         (b2,c2)) -> (eqlist binder_eq b1 b2) && (comp_eq c1 c2)
<<<<<<< HEAD
      | (FStar_Syntax_Syntax.Tm_refine (b1,t11),FStar_Syntax_Syntax.Tm_refine
         (b2,t21)) -> (FStar_Syntax_Syntax.bv_eq b1 b2) && (term_eq t11 t21)
      | (FStar_Syntax_Syntax.Tm_match (t11,bs1),FStar_Syntax_Syntax.Tm_match
         (t21,bs2)) -> (term_eq t11 t21) && (eqlist branch_eq bs1 bs2)
      | (uu____5931,uu____5932) -> false
=======
      | (FStar_Syntax_Syntax.Tm_refine (b1,t12),FStar_Syntax_Syntax.Tm_refine
         (b2,t22)) -> (FStar_Syntax_Syntax.bv_eq b1 b2) && (term_eq t12 t22)
      | (FStar_Syntax_Syntax.Tm_match (t12,bs1),FStar_Syntax_Syntax.Tm_match
         (t22,bs2)) -> (term_eq t12 t22) && (eqlist branch_eq bs1 bs2)
      | (uu____6944,uu____6945) -> false
>>>>>>> origin/guido_tactics
and arg_eq:
  ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) ->
    ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) -> Prims.bool
  =
  fun a1  -> fun a2  -> eqprod term_eq (fun q1  -> fun q2  -> q1 = q2) a1 a2
and binder_eq:
  (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) -> Prims.bool
  =
  fun b1  ->
    fun b2  ->
      eqprod
        (fun b11  ->
           fun b21  ->
             term_eq b11.FStar_Syntax_Syntax.sort
               b21.FStar_Syntax_Syntax.sort) (fun q1  -> fun q2  -> q1 = q2)
        b1 b2
and lcomp_eq:
  FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp -> Prims.bool =
  fun c1  -> fun c2  -> false
and residual_eq:
  FStar_Syntax_Syntax.residual_comp ->
    FStar_Syntax_Syntax.residual_comp -> Prims.bool
  = fun r1  -> fun r2  -> false
and comp_eq:
  (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
    (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
      Prims.bool
  =
  fun c1  ->
    fun c2  ->
      match ((c1.FStar_Syntax_Syntax.n), (c2.FStar_Syntax_Syntax.n)) with
      | (FStar_Syntax_Syntax.Total (t1,u1),FStar_Syntax_Syntax.Total (t2,u2))
          -> term_eq t1 t2
      | (FStar_Syntax_Syntax.GTotal (t1,u1),FStar_Syntax_Syntax.GTotal
         (t2,u2)) -> term_eq t1 t2
      | (FStar_Syntax_Syntax.Comp c11,FStar_Syntax_Syntax.Comp c21) ->
          ((((c11.FStar_Syntax_Syntax.comp_univs =
                c21.FStar_Syntax_Syntax.comp_univs)
               &&
               (c11.FStar_Syntax_Syntax.effect_name =
                  c21.FStar_Syntax_Syntax.effect_name))
              &&
              (term_eq c11.FStar_Syntax_Syntax.result_typ
                 c21.FStar_Syntax_Syntax.result_typ))
             &&
             (eqlist arg_eq c11.FStar_Syntax_Syntax.effect_args
                c21.FStar_Syntax_Syntax.effect_args))
            &&
            (eq_flags c11.FStar_Syntax_Syntax.flags
               c21.FStar_Syntax_Syntax.flags)
<<<<<<< HEAD
      | (uu____6009,uu____6010) -> false
=======
      | (uu____7018,uu____7019) -> false
>>>>>>> origin/guido_tactics
and eq_flags:
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list -> Prims.bool
  = fun f1  -> fun f2  -> false
and branch_eq:
  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t*
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax option*
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax) ->
    (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t*
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax option*
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax) -> Prims.bool
  =
<<<<<<< HEAD
  fun uu____6015  ->
    fun uu____6016  ->
      match (uu____6015, uu____6016) with | ((p1,w1,t1),(p2,w2,t2)) -> false
=======
  fun uu____7024  ->
    fun uu____7025  ->
      match (uu____7024, uu____7025) with | ((p1,w1,t1),(p2,w2,t2)) -> false
>>>>>>> origin/guido_tactics
let rec bottom_fold:
  (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun f  ->
    fun t  ->
      let ff = bottom_fold f in
      let tn =
<<<<<<< HEAD
        let uu____6116 = un_uinst t in uu____6116.FStar_Syntax_Syntax.n in
      let tn1 =
        match tn with
        | FStar_Syntax_Syntax.Tm_app (f1,args) ->
            let uu____6136 =
              let uu____6146 = ff f1 in
              let uu____6147 =
                FStar_List.map
                  (fun uu____6159  ->
                     match uu____6159 with
                     | (a,q) -> let uu____6166 = ff a in (uu____6166, q))
                  args in
              (uu____6146, uu____6147) in
            FStar_Syntax_Syntax.Tm_app uu____6136
        | FStar_Syntax_Syntax.Tm_abs (bs,t1,k) ->
            let uu____6195 = FStar_Syntax_Subst.open_term bs t1 in
            (match uu____6195 with
             | (bs1,t') ->
                 let t'' = ff t' in
                 let uu____6201 =
                   let uu____6216 = FStar_Syntax_Subst.close bs1 t'' in
                   (bs1, uu____6216, k) in
                 FStar_Syntax_Syntax.Tm_abs uu____6201)
        | FStar_Syntax_Syntax.Tm_arrow (bs,k) -> tn
        | uu____6235 -> tn in
      f
        (let uu___169_6238 = t in
         {
           FStar_Syntax_Syntax.n = tn1;
           FStar_Syntax_Syntax.tk = (uu___169_6238.FStar_Syntax_Syntax.tk);
           FStar_Syntax_Syntax.pos = (uu___169_6238.FStar_Syntax_Syntax.pos);
           FStar_Syntax_Syntax.vars =
             (uu___169_6238.FStar_Syntax_Syntax.vars)
         })
=======
        let uu____7137 = FStar_Syntax_Subst.compress t in
        uu____7137.FStar_Syntax_Syntax.n in
      let tn1 =
        match tn with
        | FStar_Syntax_Syntax.Tm_app (f1,args) ->
            let uu____7157 =
              let uu____7167 = ff f1 in
              let uu____7168 =
                FStar_List.map
                  (fun uu____7176  ->
                     match uu____7176 with
                     | (a,q) -> let uu____7183 = ff a in (uu____7183, q))
                  args in
              (uu____7167, uu____7168) in
            FStar_Syntax_Syntax.Tm_app uu____7157
        | FStar_Syntax_Syntax.Tm_abs (bs,t1,k) ->
            let uu____7202 = FStar_Syntax_Subst.open_term bs t1 in
            (match uu____7202 with
             | (bs1,t') ->
                 let t'' = ff t' in
                 let uu____7208 =
                   let uu____7218 = FStar_Syntax_Subst.close bs1 t'' in
                   (bs1, uu____7218, k) in
                 FStar_Syntax_Syntax.Tm_abs uu____7208)
        | FStar_Syntax_Syntax.Tm_arrow (bs,k) -> tn
        | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
            let uu____7238 = let uu____7243 = ff t1 in (uu____7243, us) in
            FStar_Syntax_Syntax.Tm_uinst uu____7238
        | uu____7244 -> tn in
      f
        (let uu___181_7245 = t in
         {
           FStar_Syntax_Syntax.n = tn1;
           FStar_Syntax_Syntax.tk = (uu___181_7245.FStar_Syntax_Syntax.tk);
           FStar_Syntax_Syntax.pos = (uu___181_7245.FStar_Syntax_Syntax.pos);
           FStar_Syntax_Syntax.vars =
             (uu___181_7245.FStar_Syntax_Syntax.vars)
         })
let rec sizeof: FStar_Syntax_Syntax.term -> Prims.int =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____7254 ->
        let uu____7269 =
          let uu____7270 = FStar_Syntax_Subst.compress t in sizeof uu____7270 in
        (Prims.parse_int "1") + uu____7269
    | FStar_Syntax_Syntax.Tm_bvar bv ->
        let uu____7272 = sizeof bv.FStar_Syntax_Syntax.sort in
        (Prims.parse_int "1") + uu____7272
    | FStar_Syntax_Syntax.Tm_name bv ->
        let uu____7274 = sizeof bv.FStar_Syntax_Syntax.sort in
        (Prims.parse_int "1") + uu____7274
    | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
        let uu____7281 = sizeof t1 in (FStar_List.length us) + uu____7281
    | FStar_Syntax_Syntax.Tm_abs (bs,t1,uu____7290) ->
        let uu____7303 = sizeof t1 in
        let uu____7304 =
          FStar_List.fold_left
            (fun acc  ->
               fun uu____7308  ->
                 match uu____7308 with
                 | (bv,uu____7312) ->
                     let uu____7313 = sizeof bv.FStar_Syntax_Syntax.sort in
                     acc + uu____7313) (Prims.parse_int "0") bs in
        uu____7303 + uu____7304
    | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
        let uu____7330 = sizeof hd1 in
        let uu____7331 =
          FStar_List.fold_left
            (fun acc  ->
               fun uu____7335  ->
                 match uu____7335 with
                 | (arg,uu____7339) ->
                     let uu____7340 = sizeof arg in acc + uu____7340)
            (Prims.parse_int "0") args in
        uu____7330 + uu____7331
    | uu____7341 -> Prims.parse_int "1"
let is_synth_by_tactic: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
    let uu____7346 =
      let uu____7347 = un_uinst t in uu____7347.FStar_Syntax_Syntax.n in
    match uu____7346 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.synth_lid
    | uu____7351 -> false
let mk_alien b s r =
  let uu____7375 =
    let uu____7378 =
      let uu____7379 =
        let uu____7384 =
          let uu____7385 =
            let uu____7388 = FStar_Dyn.mkdyn b in (uu____7388, s) in
          FStar_Syntax_Syntax.Meta_alien uu____7385 in
        (FStar_Syntax_Syntax.tun, uu____7384) in
      FStar_Syntax_Syntax.Tm_meta uu____7379 in
    FStar_Syntax_Syntax.mk uu____7378 in
  uu____7375 None
    (match r with | Some r1 -> r1 | None  -> FStar_Range.dummyRange)
let un_alien: FStar_Syntax_Syntax.term -> FStar_Dyn.dyn =
  fun t  ->
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_meta
        (uu____7404,FStar_Syntax_Syntax.Meta_alien (blob,uu____7406)) -> blob
    | uu____7411 -> failwith "Something paranormal occurred"
>>>>>>> origin/guido_tactics
