open Prims
let guard_of_guard_formula:
  FStar_TypeChecker_Common.guard_formula -> FStar_TypeChecker_Env.guard_t =
  fun g  ->
    {
      FStar_TypeChecker_Env.guard_f = g;
      FStar_TypeChecker_Env.deferred = [];
      FStar_TypeChecker_Env.univ_ineqs = ([], []);
      FStar_TypeChecker_Env.implicits = []
    }
let guard_form:
  FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Common.guard_formula =
  fun g  -> g.FStar_TypeChecker_Env.guard_f
let is_trivial: FStar_TypeChecker_Env.guard_t -> Prims.bool =
  fun g  ->
    match g with
    | { FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial ;
        FStar_TypeChecker_Env.deferred = [];
        FStar_TypeChecker_Env.univ_ineqs = uu____23;
        FStar_TypeChecker_Env.implicits = uu____24;_} -> true
    | uu____38 -> false
let trivial_guard: FStar_TypeChecker_Env.guard_t =
  {
    FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial;
    FStar_TypeChecker_Env.deferred = [];
    FStar_TypeChecker_Env.univ_ineqs = ([], []);
    FStar_TypeChecker_Env.implicits = []
  }
let abstract_guard:
  FStar_Syntax_Syntax.bv ->
    FStar_TypeChecker_Env.guard_t option ->
      FStar_TypeChecker_Env.guard_t option
  =
  fun x  ->
    fun g  ->
      match g with
      | None  -> g
      | Some
          {
            FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial ;
            FStar_TypeChecker_Env.deferred = uu____61;
            FStar_TypeChecker_Env.univ_ineqs = uu____62;
            FStar_TypeChecker_Env.implicits = uu____63;_}
          -> g
      | Some g1 ->
          let f =
            match g1.FStar_TypeChecker_Env.guard_f with
            | FStar_TypeChecker_Common.NonTrivial f -> f
            | uu____78 -> failwith "impossible" in
          let uu____79 =
            let uu___135_80 = g1 in
            let uu____81 =
              let uu____82 =
                let uu____83 =
                  let uu____84 = FStar_Syntax_Syntax.mk_binder x in
                  [uu____84] in
                FStar_Syntax_Util.abs uu____83 f
                  (Some
                     (FStar_Syntax_Util.residual_tot FStar_Syntax_Util.ktype0)) in
              FStar_All.pipe_left
                (fun _0_39  -> FStar_TypeChecker_Common.NonTrivial _0_39)
                uu____82 in
            {
              FStar_TypeChecker_Env.guard_f = uu____81;
              FStar_TypeChecker_Env.deferred =
                (uu___135_80.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___135_80.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___135_80.FStar_TypeChecker_Env.implicits)
            } in
          Some uu____79
let apply_guard:
  FStar_TypeChecker_Env.guard_t ->
    FStar_Syntax_Syntax.term -> FStar_TypeChecker_Env.guard_t
  =
  fun g  ->
    fun e  ->
      match g.FStar_TypeChecker_Env.guard_f with
      | FStar_TypeChecker_Common.Trivial  -> g
      | FStar_TypeChecker_Common.NonTrivial f ->
          let uu___136_94 = g in
          let uu____95 =
            let uu____96 =
              let uu____97 =
                let uu____100 =
                  let uu____101 =
                    let uu____111 =
                      let uu____113 = FStar_Syntax_Syntax.as_arg e in
                      [uu____113] in
                    (f, uu____111) in
                  FStar_Syntax_Syntax.Tm_app uu____101 in
                FStar_Syntax_Syntax.mk uu____100 in
              uu____97
                (Some (FStar_Syntax_Util.ktype0.FStar_Syntax_Syntax.n))
                f.FStar_Syntax_Syntax.pos in
            FStar_All.pipe_left
              (fun _0_40  -> FStar_TypeChecker_Common.NonTrivial _0_40)
              uu____96 in
          {
            FStar_TypeChecker_Env.guard_f = uu____95;
            FStar_TypeChecker_Env.deferred =
              (uu___136_94.FStar_TypeChecker_Env.deferred);
            FStar_TypeChecker_Env.univ_ineqs =
              (uu___136_94.FStar_TypeChecker_Env.univ_ineqs);
            FStar_TypeChecker_Env.implicits =
              (uu___136_94.FStar_TypeChecker_Env.implicits)
          }
let map_guard:
  FStar_TypeChecker_Env.guard_t ->
    (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) ->
      FStar_TypeChecker_Env.guard_t
  =
  fun g  ->
    fun map1  ->
      match g.FStar_TypeChecker_Env.guard_f with
      | FStar_TypeChecker_Common.Trivial  -> g
      | FStar_TypeChecker_Common.NonTrivial f ->
          let uu___137_137 = g in
          let uu____138 =
            let uu____139 = map1 f in
            FStar_TypeChecker_Common.NonTrivial uu____139 in
          {
            FStar_TypeChecker_Env.guard_f = uu____138;
            FStar_TypeChecker_Env.deferred =
              (uu___137_137.FStar_TypeChecker_Env.deferred);
            FStar_TypeChecker_Env.univ_ineqs =
              (uu___137_137.FStar_TypeChecker_Env.univ_ineqs);
            FStar_TypeChecker_Env.implicits =
              (uu___137_137.FStar_TypeChecker_Env.implicits)
          }
let trivial: FStar_TypeChecker_Common.guard_formula -> Prims.unit =
  fun t  ->
    match t with
    | FStar_TypeChecker_Common.Trivial  -> ()
    | FStar_TypeChecker_Common.NonTrivial uu____144 -> failwith "impossible"
let conj_guard_f:
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula
  =
  fun g1  ->
    fun g2  ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.Trivial ,g) -> g
      | (g,FStar_TypeChecker_Common.Trivial ) -> g
      | (FStar_TypeChecker_Common.NonTrivial
         f1,FStar_TypeChecker_Common.NonTrivial f2) ->
          let uu____157 = FStar_Syntax_Util.mk_conj f1 f2 in
          FStar_TypeChecker_Common.NonTrivial uu____157
let check_trivial:
  FStar_Syntax_Syntax.term -> FStar_TypeChecker_Common.guard_formula =
  fun t  ->
    let uu____162 =
      let uu____163 = FStar_Syntax_Util.unmeta t in
      uu____163.FStar_Syntax_Syntax.n in
    match uu____162 with
    | FStar_Syntax_Syntax.Tm_fvar tc when
        FStar_Syntax_Syntax.fv_eq_lid tc FStar_Syntax_Const.true_lid ->
        FStar_TypeChecker_Common.Trivial
    | uu____167 -> FStar_TypeChecker_Common.NonTrivial t
let imp_guard_f:
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula
  =
  fun g1  ->
    fun g2  ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.Trivial ,g) -> g
      | (g,FStar_TypeChecker_Common.Trivial ) ->
          FStar_TypeChecker_Common.Trivial
      | (FStar_TypeChecker_Common.NonTrivial
         f1,FStar_TypeChecker_Common.NonTrivial f2) ->
          let imp = FStar_Syntax_Util.mk_imp f1 f2 in check_trivial imp
let binop_guard:
  (FStar_TypeChecker_Common.guard_formula ->
     FStar_TypeChecker_Common.guard_formula ->
       FStar_TypeChecker_Common.guard_formula)
    ->
    FStar_TypeChecker_Env.guard_t ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun f  ->
    fun g1  ->
      fun g2  ->
        let uu____203 =
          f g1.FStar_TypeChecker_Env.guard_f g2.FStar_TypeChecker_Env.guard_f in
        {
          FStar_TypeChecker_Env.guard_f = uu____203;
          FStar_TypeChecker_Env.deferred =
            (FStar_List.append g1.FStar_TypeChecker_Env.deferred
               g2.FStar_TypeChecker_Env.deferred);
          FStar_TypeChecker_Env.univ_ineqs =
            ((FStar_List.append (fst g1.FStar_TypeChecker_Env.univ_ineqs)
                (fst g2.FStar_TypeChecker_Env.univ_ineqs)),
              (FStar_List.append (snd g1.FStar_TypeChecker_Env.univ_ineqs)
                 (snd g2.FStar_TypeChecker_Env.univ_ineqs)));
          FStar_TypeChecker_Env.implicits =
            (FStar_List.append g1.FStar_TypeChecker_Env.implicits
               g2.FStar_TypeChecker_Env.implicits)
        }
let conj_guard:
  FStar_TypeChecker_Env.guard_t ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  = fun g1  -> fun g2  -> binop_guard conj_guard_f g1 g2
let imp_guard:
  FStar_TypeChecker_Env.guard_t ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  = fun g1  -> fun g2  -> binop_guard imp_guard_f g1 g2
let close_guard_univs:
  FStar_Syntax_Syntax.universes ->
    FStar_Syntax_Syntax.binders ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun us  ->
    fun bs  ->
      fun g  ->
        match g.FStar_TypeChecker_Env.guard_f with
        | FStar_TypeChecker_Common.Trivial  -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
            let f1 =
              FStar_List.fold_right2
                (fun u  ->
                   fun b  ->
                     fun f1  ->
<<<<<<< HEAD
                       let uu____262 = FStar_Syntax_Syntax.is_null_binder b in
                       if uu____262
                       then f1
                       else FStar_Syntax_Util.mk_forall u (fst b) f1) us bs f in
            let uu___136_264 = g in
=======
                       let uu____255 = FStar_Syntax_Syntax.is_null_binder b in
                       if uu____255
                       then f1
                       else FStar_Syntax_Util.mk_forall u (fst b) f1) us bs f in
            let uu___138_257 = g in
>>>>>>> origin/guido_tactics
            {
              FStar_TypeChecker_Env.guard_f =
                (FStar_TypeChecker_Common.NonTrivial f1);
              FStar_TypeChecker_Env.deferred =
<<<<<<< HEAD
                (uu___136_264.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___136_264.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___136_264.FStar_TypeChecker_Env.implicits)
=======
                (uu___138_257.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___138_257.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___138_257.FStar_TypeChecker_Env.implicits)
>>>>>>> origin/guido_tactics
            }
let close_forall:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binder Prims.list ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ
  =
  fun env  ->
    fun bs  ->
      fun f  ->
        FStar_List.fold_right
          (fun b  ->
             fun f1  ->
               let uu____281 = FStar_Syntax_Syntax.is_null_binder b in
               if uu____281
               then f1
               else
                 (let u =
                    env.FStar_TypeChecker_Env.universe_of env
                      (fst b).FStar_Syntax_Syntax.sort in
                  FStar_Syntax_Util.mk_forall u (fst b) f1)) bs f
let close_guard:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun env  ->
    fun binders  ->
      fun g  ->
        match g.FStar_TypeChecker_Env.guard_f with
        | FStar_TypeChecker_Common.Trivial  -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
<<<<<<< HEAD
            let uu___137_294 = g in
            let uu____295 =
              let uu____296 = close_forall env binders f in
              FStar_TypeChecker_Common.NonTrivial uu____296 in
            {
              FStar_TypeChecker_Env.guard_f = uu____295;
              FStar_TypeChecker_Env.deferred =
                (uu___137_294.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___137_294.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___137_294.FStar_TypeChecker_Env.implicits)
=======
            let uu___139_290 = g in
            let uu____291 =
              let uu____292 = close_forall env binders f in
              FStar_TypeChecker_Common.NonTrivial uu____292 in
            {
              FStar_TypeChecker_Env.guard_f = uu____291;
              FStar_TypeChecker_Env.deferred =
                (uu___139_290.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___139_290.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___139_290.FStar_TypeChecker_Env.implicits)
>>>>>>> origin/guido_tactics
            }
let new_uvar:
  FStar_Range.range ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.typ* FStar_Syntax_Syntax.typ)
  =
  fun r  ->
    fun binders  ->
      fun k  ->
        let uv = FStar_Syntax_Unionfind.fresh () in
        match binders with
        | [] ->
            let uv1 =
              FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uvar (uv, k))
                (Some (k.FStar_Syntax_Syntax.n)) r in
            (uv1, uv1)
<<<<<<< HEAD
        | uu____324 ->
=======
        | uu____323 ->
>>>>>>> origin/guido_tactics
            let args =
              FStar_All.pipe_right binders
                (FStar_List.map FStar_Syntax_Util.arg_of_non_null_binder) in
            let k' =
<<<<<<< HEAD
              let uu____339 = FStar_Syntax_Syntax.mk_Total k in
              FStar_Syntax_Util.arrow binders uu____339 in
            let uv1 =
              FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uvar (uv, k'))
                None r in
            let uu____351 =
              FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (uv1, args))
                (Some (k.FStar_Syntax_Syntax.n)) r in
            (uu____351, uv1)
=======
              let uu____338 = FStar_Syntax_Syntax.mk_Total k in
              FStar_Syntax_Util.arrow binders uu____338 in
            let uv1 =
              FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uvar (uv, k'))
                None r in
            let uu____350 =
              FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (uv1, args))
                (Some (k.FStar_Syntax_Syntax.n)) r in
            (uu____350, uv1)
>>>>>>> origin/guido_tactics
let mk_eq2:
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
<<<<<<< HEAD
        let uu____380 = FStar_Syntax_Util.type_u () in
        match uu____380 with
        | (t_type,u) ->
            let uu____385 =
              let uu____388 = FStar_TypeChecker_Env.all_binders env in
              new_uvar t1.FStar_Syntax_Syntax.pos uu____388 t_type in
            (match uu____385 with
             | (tt,uu____390) -> FStar_Syntax_Util.mk_eq2 u tt t1 t2)
=======
        let uu____382 = FStar_Syntax_Util.type_u () in
        match uu____382 with
        | (t_type,u) ->
            let uu____387 =
              let uu____390 = FStar_TypeChecker_Env.all_binders env in
              new_uvar t1.FStar_Syntax_Syntax.pos uu____390 t_type in
            (match uu____387 with
             | (tt,uu____392) -> FStar_Syntax_Util.mk_eq2 u tt t1 t2)
>>>>>>> origin/guido_tactics
type uvi =
  | TERM of ((FStar_Syntax_Syntax.uvar* FStar_Syntax_Syntax.typ)*
  FStar_Syntax_Syntax.term)
  | UNIV of (FStar_Syntax_Syntax.universe_uvar* FStar_Syntax_Syntax.universe)
let uu___is_TERM: uvi -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | TERM _0 -> true | uu____413 -> false
=======
    match projectee with | TERM _0 -> true | uu____416 -> false
>>>>>>> origin/guido_tactics
let __proj__TERM__item___0:
  uvi ->
    ((FStar_Syntax_Syntax.uvar* FStar_Syntax_Syntax.typ)*
      FStar_Syntax_Syntax.term)
  = fun projectee  -> match projectee with | TERM _0 -> _0
let uu___is_UNIV: uvi -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | UNIV _0 -> true | uu____439 -> false
=======
    match projectee with | UNIV _0 -> true | uu____444 -> false
>>>>>>> origin/guido_tactics
let __proj__UNIV__item___0:
  uvi -> (FStar_Syntax_Syntax.universe_uvar* FStar_Syntax_Syntax.universe) =
  fun projectee  -> match projectee with | UNIV _0 -> _0
type worklist =
  {
  attempting: FStar_TypeChecker_Common.probs;
  wl_deferred:
    (Prims.int* Prims.string* FStar_TypeChecker_Common.prob) Prims.list;
  ctr: Prims.int;
  defer_ok: Prims.bool;
  smt_ok: Prims.bool;
  tcenv: FStar_TypeChecker_Env.env;}
let __proj__Mkworklist__item__attempting:
  worklist -> FStar_TypeChecker_Common.probs =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;_} ->
        __fname__attempting
let __proj__Mkworklist__item__wl_deferred:
  worklist ->
    (Prims.int* Prims.string* FStar_TypeChecker_Common.prob) Prims.list
  =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;_} ->
        __fname__wl_deferred
let __proj__Mkworklist__item__ctr: worklist -> Prims.int =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;_} -> __fname__ctr
let __proj__Mkworklist__item__defer_ok: worklist -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;_} ->
        __fname__defer_ok
let __proj__Mkworklist__item__smt_ok: worklist -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;_} ->
        __fname__smt_ok
let __proj__Mkworklist__item__tcenv: worklist -> FStar_TypeChecker_Env.env =
  fun projectee  ->
    match projectee with
    | { attempting = __fname__attempting; wl_deferred = __fname__wl_deferred;
        ctr = __fname__ctr; defer_ok = __fname__defer_ok;
        smt_ok = __fname__smt_ok; tcenv = __fname__tcenv;_} -> __fname__tcenv
type solution =
  | Success of FStar_TypeChecker_Common.deferred
  | Failed of (FStar_TypeChecker_Common.prob* Prims.string)
let uu___is_Success: solution -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | Success _0 -> true | uu____527 -> false
=======
    match projectee with | Success _0 -> true | uu____594 -> false
>>>>>>> origin/guido_tactics
let __proj__Success__item___0: solution -> FStar_TypeChecker_Common.deferred
  = fun projectee  -> match projectee with | Success _0 -> _0
let uu___is_Failed: solution -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | Failed _0 -> true | uu____541 -> false
=======
    match projectee with | Failed _0 -> true | uu____610 -> false
>>>>>>> origin/guido_tactics
let __proj__Failed__item___0:
  solution -> (FStar_TypeChecker_Common.prob* Prims.string) =
  fun projectee  -> match projectee with | Failed _0 -> _0
type variance =
  | COVARIANT
  | CONTRAVARIANT
  | INVARIANT
let uu___is_COVARIANT: variance -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | COVARIANT  -> true | uu____558 -> false
let uu___is_CONTRAVARIANT: variance -> Prims.bool =
  fun projectee  ->
    match projectee with | CONTRAVARIANT  -> true | uu____562 -> false
let uu___is_INVARIANT: variance -> Prims.bool =
  fun projectee  ->
    match projectee with | INVARIANT  -> true | uu____566 -> false
=======
    match projectee with | COVARIANT  -> true | uu____629 -> false
let uu___is_CONTRAVARIANT: variance -> Prims.bool =
  fun projectee  ->
    match projectee with | CONTRAVARIANT  -> true | uu____634 -> false
let uu___is_INVARIANT: variance -> Prims.bool =
  fun projectee  ->
    match projectee with | INVARIANT  -> true | uu____639 -> false
>>>>>>> origin/guido_tactics
type tprob =
  (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.term)
    FStar_TypeChecker_Common.problem
type cprob =
  (FStar_Syntax_Syntax.comp,Prims.unit) FStar_TypeChecker_Common.problem
type ('a,'b) problem_t = ('a,'b) FStar_TypeChecker_Common.problem
let rel_to_string: FStar_TypeChecker_Common.rel -> Prims.string =
<<<<<<< HEAD
  fun uu___105_583  ->
    match uu___105_583 with
=======
  fun uu___107_657  ->
    match uu___107_657 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.EQ  -> "="
    | FStar_TypeChecker_Common.SUB  -> "<:"
    | FStar_TypeChecker_Common.SUBINV  -> ":>"
let term_to_string env t =
<<<<<<< HEAD
  let uu____596 =
    let uu____597 = FStar_Syntax_Subst.compress t in
    uu____597.FStar_Syntax_Syntax.n in
  match uu____596 with
  | FStar_Syntax_Syntax.Tm_uvar (u,t1) ->
      let uu____618 = FStar_Syntax_Print.uvar_to_string u in
      let uu____619 = FStar_Syntax_Print.term_to_string t1 in
      FStar_Util.format2 "(%s:%s)" uu____618 uu____619
  | FStar_Syntax_Syntax.Tm_app
      ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (u,ty);
         FStar_Syntax_Syntax.tk = uu____622;
         FStar_Syntax_Syntax.pos = uu____623;
         FStar_Syntax_Syntax.vars = uu____624;_},args)
      ->
      let uu____656 = FStar_Syntax_Print.uvar_to_string u in
      let uu____657 = FStar_Syntax_Print.term_to_string ty in
      let uu____658 = FStar_Syntax_Print.args_to_string args in
      FStar_Util.format3 "(%s:%s) %s" uu____656 uu____657 uu____658
  | uu____659 -> FStar_Syntax_Print.term_to_string t
=======
  let uu____673 =
    let uu____674 = FStar_Syntax_Subst.compress t in
    uu____674.FStar_Syntax_Syntax.n in
  match uu____673 with
  | FStar_Syntax_Syntax.Tm_uvar (u,t1) ->
      let uu____691 = FStar_Syntax_Print.uvar_to_string u in
      let uu____692 = FStar_Syntax_Print.term_to_string t1 in
      FStar_Util.format2 "(%s:%s)" uu____691 uu____692
  | FStar_Syntax_Syntax.Tm_app
      ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (u,ty);
         FStar_Syntax_Syntax.tk = uu____695;
         FStar_Syntax_Syntax.pos = uu____696;
         FStar_Syntax_Syntax.vars = uu____697;_},args)
      ->
      let uu____725 = FStar_Syntax_Print.uvar_to_string u in
      let uu____726 = FStar_Syntax_Print.term_to_string ty in
      let uu____727 = FStar_Syntax_Print.args_to_string args in
      FStar_Util.format3 "(%s:%s) %s" uu____725 uu____726 uu____727
  | uu____728 -> FStar_Syntax_Print.term_to_string t
>>>>>>> origin/guido_tactics
let prob_to_string:
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Common.prob -> Prims.string
  =
  fun env  ->
<<<<<<< HEAD
    fun uu___106_665  ->
      match uu___106_665 with
      | FStar_TypeChecker_Common.TProb p ->
          let uu____669 =
            let uu____671 =
              FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid in
            let uu____672 =
              let uu____674 =
                term_to_string env p.FStar_TypeChecker_Common.lhs in
              let uu____675 =
                let uu____677 =
                  FStar_Syntax_Print.tag_of_term
                    p.FStar_TypeChecker_Common.lhs in
                let uu____678 =
                  let uu____680 =
                    let uu____682 =
                      term_to_string env p.FStar_TypeChecker_Common.rhs in
                    let uu____683 =
                      let uu____685 =
                        FStar_Syntax_Print.tag_of_term
                          p.FStar_TypeChecker_Common.rhs in
                      let uu____686 =
                        let uu____688 =
                          FStar_TypeChecker_Normalize.term_to_string env
                            (fst p.FStar_TypeChecker_Common.logical_guard) in
                        let uu____689 =
                          let uu____691 =
                            FStar_All.pipe_right
                              p.FStar_TypeChecker_Common.reason
                              (FStar_String.concat "\n\t\t\t") in
                          [uu____691] in
                        uu____688 :: uu____689 in
                      uu____685 :: uu____686 in
                    uu____682 :: uu____683 in
                  (rel_to_string p.FStar_TypeChecker_Common.relation) ::
                    uu____680 in
                uu____677 :: uu____678 in
              uu____674 :: uu____675 in
            uu____671 :: uu____672 in
          FStar_Util.format
            "\t%s: %s (%s)\n\t\t%s\n\t%s (%s) (guard %s)\n\t\t<Reason>\n\t\t\t%s\n\t\t</Reason>"
            uu____669
      | FStar_TypeChecker_Common.CProb p ->
          let uu____696 =
            FStar_TypeChecker_Normalize.comp_to_string env
              p.FStar_TypeChecker_Common.lhs in
          let uu____697 =
            FStar_TypeChecker_Normalize.comp_to_string env
              p.FStar_TypeChecker_Common.rhs in
          FStar_Util.format3 "\t%s \n\t\t%s\n\t%s" uu____696
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____697
let uvi_to_string: FStar_TypeChecker_Env.env -> uvi -> Prims.string =
  fun env  ->
    fun uu___107_703  ->
      match uu___107_703 with
      | UNIV (u,t) ->
          let x =
            let uu____707 = FStar_Options.hide_uvar_nums () in
            if uu____707
            then "?"
            else
              (let uu____709 = FStar_Syntax_Unionfind.univ_uvar_id u in
               FStar_All.pipe_right uu____709 FStar_Util.string_of_int) in
          let uu____710 = FStar_Syntax_Print.univ_to_string t in
          FStar_Util.format2 "UNIV %s %s" x uu____710
      | TERM ((u,uu____712),t) ->
          let x =
            let uu____717 = FStar_Options.hide_uvar_nums () in
            if uu____717
            then "?"
            else
              (let uu____719 = FStar_Syntax_Unionfind.uvar_id u in
               FStar_All.pipe_right uu____719 FStar_Util.string_of_int) in
          let uu____720 = FStar_TypeChecker_Normalize.term_to_string env t in
          FStar_Util.format2 "TERM %s %s" x uu____720
=======
    fun uu___108_736  ->
      match uu___108_736 with
      | FStar_TypeChecker_Common.TProb p ->
          let uu____740 =
            let uu____742 =
              FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid in
            let uu____743 =
              let uu____745 =
                term_to_string env p.FStar_TypeChecker_Common.lhs in
              let uu____746 =
                let uu____748 =
                  FStar_Syntax_Print.tag_of_term
                    p.FStar_TypeChecker_Common.lhs in
                let uu____749 =
                  let uu____751 =
                    let uu____753 =
                      term_to_string env p.FStar_TypeChecker_Common.rhs in
                    let uu____754 =
                      let uu____756 =
                        FStar_Syntax_Print.tag_of_term
                          p.FStar_TypeChecker_Common.rhs in
                      let uu____757 =
                        let uu____759 =
                          FStar_TypeChecker_Normalize.term_to_string env
                            (fst p.FStar_TypeChecker_Common.logical_guard) in
                        let uu____760 =
                          let uu____762 =
                            FStar_All.pipe_right
                              p.FStar_TypeChecker_Common.reason
                              (FStar_String.concat "\n\t\t\t") in
                          [uu____762] in
                        uu____759 :: uu____760 in
                      uu____756 :: uu____757 in
                    uu____753 :: uu____754 in
                  (rel_to_string p.FStar_TypeChecker_Common.relation) ::
                    uu____751 in
                uu____748 :: uu____749 in
              uu____745 :: uu____746 in
            uu____742 :: uu____743 in
          FStar_Util.format
            "\t%s: %s (%s)\n\t\t%s\n\t%s (%s) (guard %s)\n\t\t<Reason>\n\t\t\t%s\n\t\t</Reason>"
            uu____740
      | FStar_TypeChecker_Common.CProb p ->
          let uu____767 =
            FStar_TypeChecker_Normalize.comp_to_string env
              p.FStar_TypeChecker_Common.lhs in
          let uu____768 =
            FStar_TypeChecker_Normalize.comp_to_string env
              p.FStar_TypeChecker_Common.rhs in
          FStar_Util.format3 "\t%s \n\t\t%s\n\t%s" uu____767
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____768
let uvi_to_string: FStar_TypeChecker_Env.env -> uvi -> Prims.string =
  fun env  ->
    fun uu___109_776  ->
      match uu___109_776 with
      | UNIV (u,t) ->
          let x =
            let uu____780 = FStar_Options.hide_uvar_nums () in
            if uu____780
            then "?"
            else
              (let uu____782 = FStar_Syntax_Unionfind.univ_uvar_id u in
               FStar_All.pipe_right uu____782 FStar_Util.string_of_int) in
          let uu____783 = FStar_Syntax_Print.univ_to_string t in
          FStar_Util.format2 "UNIV %s %s" x uu____783
      | TERM ((u,uu____785),t) ->
          let x =
            let uu____790 = FStar_Options.hide_uvar_nums () in
            if uu____790
            then "?"
            else
              (let uu____792 = FStar_Syntax_Unionfind.uvar_id u in
               FStar_All.pipe_right uu____792 FStar_Util.string_of_int) in
          let uu____793 = FStar_TypeChecker_Normalize.term_to_string env t in
          FStar_Util.format2 "TERM %s %s" x uu____793
>>>>>>> origin/guido_tactics
let uvis_to_string:
  FStar_TypeChecker_Env.env -> uvi Prims.list -> Prims.string =
  fun env  ->
    fun uvis  ->
<<<<<<< HEAD
      let uu____729 = FStar_List.map (uvi_to_string env) uvis in
      FStar_All.pipe_right uu____729 (FStar_String.concat ", ")
let names_to_string: FStar_Syntax_Syntax.bv FStar_Util.set -> Prims.string =
  fun nms  ->
    let uu____737 =
      let uu____739 = FStar_Util.set_elements nms in
      FStar_All.pipe_right uu____739
        (FStar_List.map FStar_Syntax_Print.bv_to_string) in
    FStar_All.pipe_right uu____737 (FStar_String.concat ", ")
let args_to_string args =
  let uu____757 =
    FStar_All.pipe_right args
      (FStar_List.map
         (fun uu____768  ->
            match uu____768 with
            | (x,uu____772) -> FStar_Syntax_Print.term_to_string x)) in
  FStar_All.pipe_right uu____757 (FStar_String.concat " ")
let empty_worklist: FStar_TypeChecker_Env.env -> worklist =
  fun env  ->
    let uu____777 =
      let uu____778 = FStar_Options.eager_inference () in
      Prims.op_Negation uu____778 in
=======
      let uu____804 = FStar_List.map (uvi_to_string env) uvis in
      FStar_All.pipe_right uu____804 (FStar_String.concat ", ")
let names_to_string: FStar_Syntax_Syntax.bv FStar_Util.set -> Prims.string =
  fun nms  ->
    let uu____813 =
      let uu____815 = FStar_Util.set_elements nms in
      FStar_All.pipe_right uu____815
        (FStar_List.map FStar_Syntax_Print.bv_to_string) in
    FStar_All.pipe_right uu____813 (FStar_String.concat ", ")
let args_to_string args =
  let uu____835 =
    FStar_All.pipe_right args
      (FStar_List.map
         (fun uu____843  ->
            match uu____843 with
            | (x,uu____847) -> FStar_Syntax_Print.term_to_string x)) in
  FStar_All.pipe_right uu____835 (FStar_String.concat " ")
let empty_worklist: FStar_TypeChecker_Env.env -> worklist =
  fun env  ->
    let uu____853 =
      let uu____854 = FStar_Options.eager_inference () in
      Prims.op_Negation uu____854 in
>>>>>>> origin/guido_tactics
    {
      attempting = [];
      wl_deferred = [];
      ctr = (Prims.parse_int "0");
<<<<<<< HEAD
      defer_ok = uu____777;
=======
      defer_ok = uu____853;
>>>>>>> origin/guido_tactics
      smt_ok = true;
      tcenv = env
    }
let singleton':
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> Prims.bool -> worklist
  =
  fun env  ->
    fun prob  ->
      fun smt_ok  ->
<<<<<<< HEAD
        let uu___138_791 = empty_worklist env in
        {
          attempting = [prob];
          wl_deferred = (uu___138_791.wl_deferred);
          ctr = (uu___138_791.ctr);
          defer_ok = (uu___138_791.defer_ok);
          smt_ok;
          tcenv = (uu___138_791.tcenv)
=======
        let uu___140_870 = empty_worklist env in
        {
          attempting = [prob];
          wl_deferred = (uu___140_870.wl_deferred);
          ctr = (uu___140_870.ctr);
          defer_ok = (uu___140_870.defer_ok);
          smt_ok;
          tcenv = (uu___140_870.tcenv)
>>>>>>> origin/guido_tactics
        }
let singleton:
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Common.prob -> worklist =
  fun env  -> fun prob  -> singleton' env prob true
let wl_of_guard env g =
<<<<<<< HEAD
  let uu___139_816 = empty_worklist env in
  let uu____817 = FStar_List.map FStar_Pervasives.snd g in
  {
    attempting = uu____817;
    wl_deferred = (uu___139_816.wl_deferred);
    ctr = (uu___139_816.ctr);
    defer_ok = false;
    smt_ok = (uu___139_816.smt_ok);
    tcenv = (uu___139_816.tcenv)
=======
  let uu___141_900 = empty_worklist env in
  let uu____901 = FStar_List.map FStar_Pervasives.snd g in
  {
    attempting = uu____901;
    wl_deferred = (uu___141_900.wl_deferred);
    ctr = (uu___141_900.ctr);
    defer_ok = false;
    smt_ok = (uu___141_900.smt_ok);
    tcenv = (uu___141_900.tcenv)
>>>>>>> origin/guido_tactics
  }
let defer:
  Prims.string -> FStar_TypeChecker_Common.prob -> worklist -> worklist =
  fun reason  ->
    fun prob  ->
      fun wl  ->
<<<<<<< HEAD
        let uu___140_829 = wl in
        {
          attempting = (uu___140_829.attempting);
          wl_deferred = (((wl.ctr), reason, prob) :: (wl.wl_deferred));
          ctr = (uu___140_829.ctr);
          defer_ok = (uu___140_829.defer_ok);
          smt_ok = (uu___140_829.smt_ok);
          tcenv = (uu___140_829.tcenv)
=======
        let uu___142_916 = wl in
        {
          attempting = (uu___142_916.attempting);
          wl_deferred = (((wl.ctr), reason, prob) :: (wl.wl_deferred));
          ctr = (uu___142_916.ctr);
          defer_ok = (uu___142_916.defer_ok);
          smt_ok = (uu___142_916.smt_ok);
          tcenv = (uu___142_916.tcenv)
>>>>>>> origin/guido_tactics
        }
let attempt: FStar_TypeChecker_Common.prob Prims.list -> worklist -> worklist
  =
  fun probs  ->
    fun wl  ->
<<<<<<< HEAD
      let uu___141_841 = wl in
      {
        attempting = (FStar_List.append probs wl.attempting);
        wl_deferred = (uu___141_841.wl_deferred);
        ctr = (uu___141_841.ctr);
        defer_ok = (uu___141_841.defer_ok);
        smt_ok = (uu___141_841.smt_ok);
        tcenv = (uu___141_841.tcenv)
=======
      let uu___143_930 = wl in
      {
        attempting = (FStar_List.append probs wl.attempting);
        wl_deferred = (uu___143_930.wl_deferred);
        ctr = (uu___143_930.ctr);
        defer_ok = (uu___143_930.defer_ok);
        smt_ok = (uu___143_930.smt_ok);
        tcenv = (uu___143_930.tcenv)
>>>>>>> origin/guido_tactics
      }
let giveup:
  FStar_TypeChecker_Env.env ->
    Prims.string -> FStar_TypeChecker_Common.prob -> solution
  =
  fun env  ->
    fun reason  ->
      fun prob  ->
<<<<<<< HEAD
        (let uu____852 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel") in
         if uu____852
         then
           let uu____853 = prob_to_string env prob in
           FStar_Util.print2 "Failed %s:\n%s\n" reason uu____853
=======
        (let uu____944 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel") in
         if uu____944
         then
           let uu____945 = prob_to_string env prob in
           FStar_Util.print2 "Failed %s:\n%s\n" reason uu____945
>>>>>>> origin/guido_tactics
         else ());
        Failed (prob, reason)
let invert_rel: FStar_TypeChecker_Common.rel -> FStar_TypeChecker_Common.rel
  =
<<<<<<< HEAD
  fun uu___108_857  ->
    match uu___108_857 with
=======
  fun uu___110_950  ->
    match uu___110_950 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.EQ  -> FStar_TypeChecker_Common.EQ
    | FStar_TypeChecker_Common.SUB  -> FStar_TypeChecker_Common.SUBINV
    | FStar_TypeChecker_Common.SUBINV  -> FStar_TypeChecker_Common.SUB
let invert p =
<<<<<<< HEAD
  let uu___142_873 = p in
  {
    FStar_TypeChecker_Common.pid =
      (uu___142_873.FStar_TypeChecker_Common.pid);
=======
  let uu___144_969 = p in
  {
    FStar_TypeChecker_Common.pid =
      (uu___144_969.FStar_TypeChecker_Common.pid);
>>>>>>> origin/guido_tactics
    FStar_TypeChecker_Common.lhs = (p.FStar_TypeChecker_Common.rhs);
    FStar_TypeChecker_Common.relation =
      (invert_rel p.FStar_TypeChecker_Common.relation);
    FStar_TypeChecker_Common.rhs = (p.FStar_TypeChecker_Common.lhs);
    FStar_TypeChecker_Common.element =
<<<<<<< HEAD
      (uu___142_873.FStar_TypeChecker_Common.element);
    FStar_TypeChecker_Common.logical_guard =
      (uu___142_873.FStar_TypeChecker_Common.logical_guard);
    FStar_TypeChecker_Common.scope =
      (uu___142_873.FStar_TypeChecker_Common.scope);
    FStar_TypeChecker_Common.reason =
      (uu___142_873.FStar_TypeChecker_Common.reason);
    FStar_TypeChecker_Common.loc =
      (uu___142_873.FStar_TypeChecker_Common.loc);
    FStar_TypeChecker_Common.rank =
      (uu___142_873.FStar_TypeChecker_Common.rank)
=======
      (uu___144_969.FStar_TypeChecker_Common.element);
    FStar_TypeChecker_Common.logical_guard =
      (uu___144_969.FStar_TypeChecker_Common.logical_guard);
    FStar_TypeChecker_Common.scope =
      (uu___144_969.FStar_TypeChecker_Common.scope);
    FStar_TypeChecker_Common.reason =
      (uu___144_969.FStar_TypeChecker_Common.reason);
    FStar_TypeChecker_Common.loc =
      (uu___144_969.FStar_TypeChecker_Common.loc);
    FStar_TypeChecker_Common.rank =
      (uu___144_969.FStar_TypeChecker_Common.rank)
>>>>>>> origin/guido_tactics
  }
let maybe_invert p =
  if p.FStar_TypeChecker_Common.relation = FStar_TypeChecker_Common.SUBINV
  then invert p
  else p
let maybe_invert_p:
  FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob =
<<<<<<< HEAD
  fun uu___109_894  ->
    match uu___109_894 with
=======
  fun uu___111_994  ->
    match uu___111_994 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.TProb p ->
        FStar_All.pipe_right (maybe_invert p)
          (fun _0_41  -> FStar_TypeChecker_Common.TProb _0_41)
    | FStar_TypeChecker_Common.CProb p ->
        FStar_All.pipe_right (maybe_invert p)
          (fun _0_42  -> FStar_TypeChecker_Common.CProb _0_42)
let vary_rel:
  FStar_TypeChecker_Common.rel -> variance -> FStar_TypeChecker_Common.rel =
  fun rel  ->
<<<<<<< HEAD
    fun uu___110_910  ->
      match uu___110_910 with
=======
    fun uu___112_1012  ->
      match uu___112_1012 with
>>>>>>> origin/guido_tactics
      | INVARIANT  -> FStar_TypeChecker_Common.EQ
      | CONTRAVARIANT  -> invert_rel rel
      | COVARIANT  -> rel
let p_pid: FStar_TypeChecker_Common.prob -> Prims.int =
<<<<<<< HEAD
  fun uu___111_913  ->
    match uu___111_913 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.pid
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.pid
let p_rel: FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.rel =
  fun uu___112_922  ->
    match uu___112_922 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.relation
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.relation
let p_reason: FStar_TypeChecker_Common.prob -> Prims.string Prims.list =
  fun uu___113_932  ->
    match uu___113_932 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.reason
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.reason
let p_loc: FStar_TypeChecker_Common.prob -> FStar_Range.range =
  fun uu___114_942  ->
    match uu___114_942 with
=======
  fun uu___113_1016  ->
    match uu___113_1016 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.pid
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.pid
let p_rel: FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.rel =
  fun uu___114_1026  ->
    match uu___114_1026 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.relation
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.relation
let p_reason: FStar_TypeChecker_Common.prob -> Prims.string Prims.list =
  fun uu___115_1037  ->
    match uu___115_1037 with
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.reason
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.reason
let p_loc: FStar_TypeChecker_Common.prob -> FStar_Range.range =
  fun uu___116_1048  ->
    match uu___116_1048 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.loc
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.loc
let p_guard:
  FStar_TypeChecker_Common.prob ->
    (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.term)
  =
<<<<<<< HEAD
  fun uu___115_953  ->
    match uu___115_953 with
=======
  fun uu___117_1060  ->
    match uu___117_1060 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.TProb p ->
        p.FStar_TypeChecker_Common.logical_guard
    | FStar_TypeChecker_Common.CProb p ->
        p.FStar_TypeChecker_Common.logical_guard
let p_scope: FStar_TypeChecker_Common.prob -> FStar_Syntax_Syntax.binders =
<<<<<<< HEAD
  fun uu___116_964  ->
    match uu___116_964 with
=======
  fun uu___118_1072  ->
    match uu___118_1072 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.TProb p -> p.FStar_TypeChecker_Common.scope
    | FStar_TypeChecker_Common.CProb p -> p.FStar_TypeChecker_Common.scope
let p_invert: FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob
  =
<<<<<<< HEAD
  fun uu___117_973  ->
    match uu___117_973 with
=======
  fun uu___119_1082  ->
    match uu___119_1082 with
>>>>>>> origin/guido_tactics
    | FStar_TypeChecker_Common.TProb p ->
        FStar_All.pipe_left
          (fun _0_43  -> FStar_TypeChecker_Common.TProb _0_43) (invert p)
    | FStar_TypeChecker_Common.CProb p ->
        FStar_All.pipe_left
          (fun _0_44  -> FStar_TypeChecker_Common.CProb _0_44) (invert p)
let is_top_level_prob: FStar_TypeChecker_Common.prob -> Prims.bool =
  fun p  ->
<<<<<<< HEAD
    let uu____987 = FStar_All.pipe_right (p_reason p) FStar_List.length in
    uu____987 = (Prims.parse_int "1")
let next_pid: Prims.unit -> Prims.int =
  let ctr = FStar_Util.mk_ref (Prims.parse_int "0") in
  fun uu____998  -> FStar_Util.incr ctr; FStar_ST.read ctr
let mk_problem scope orig lhs rel rhs elt reason =
  let uu____1048 = next_pid () in
  let uu____1049 =
    new_uvar FStar_Range.dummyRange scope FStar_Syntax_Util.ktype0 in
  {
    FStar_TypeChecker_Common.pid = uu____1048;
=======
    let uu____1097 = FStar_All.pipe_right (p_reason p) FStar_List.length in
    uu____1097 = (Prims.parse_int "1")
let next_pid: Prims.unit -> Prims.int =
  let ctr = FStar_Util.mk_ref (Prims.parse_int "0") in
  fun uu____1113  -> FStar_Util.incr ctr; FStar_ST.read ctr
let mk_problem scope orig lhs rel rhs elt reason =
  let uu____1172 = next_pid () in
  let uu____1173 =
    new_uvar FStar_Range.dummyRange scope FStar_Syntax_Util.ktype0 in
  {
    FStar_TypeChecker_Common.pid = uu____1172;
>>>>>>> origin/guido_tactics
    FStar_TypeChecker_Common.lhs = lhs;
    FStar_TypeChecker_Common.relation = rel;
    FStar_TypeChecker_Common.rhs = rhs;
    FStar_TypeChecker_Common.element = elt;
<<<<<<< HEAD
    FStar_TypeChecker_Common.logical_guard = uu____1049;
=======
    FStar_TypeChecker_Common.logical_guard = uu____1173;
>>>>>>> origin/guido_tactics
    FStar_TypeChecker_Common.scope = scope;
    FStar_TypeChecker_Common.reason = (reason :: (p_reason orig));
    FStar_TypeChecker_Common.loc = (p_loc orig);
    FStar_TypeChecker_Common.rank = None
  }
let new_problem env lhs rel rhs elt loc reason =
  let scope = FStar_TypeChecker_Env.all_binders env in
<<<<<<< HEAD
  let uu____1096 = next_pid () in
  let uu____1097 =
    new_uvar FStar_Range.dummyRange scope FStar_Syntax_Util.ktype0 in
  {
    FStar_TypeChecker_Common.pid = uu____1096;
=======
  let uu____1229 = next_pid () in
  let uu____1230 =
    new_uvar FStar_Range.dummyRange scope FStar_Syntax_Util.ktype0 in
  {
    FStar_TypeChecker_Common.pid = uu____1229;
>>>>>>> origin/guido_tactics
    FStar_TypeChecker_Common.lhs = lhs;
    FStar_TypeChecker_Common.relation = rel;
    FStar_TypeChecker_Common.rhs = rhs;
    FStar_TypeChecker_Common.element = elt;
<<<<<<< HEAD
    FStar_TypeChecker_Common.logical_guard = uu____1097;
=======
    FStar_TypeChecker_Common.logical_guard = uu____1230;
>>>>>>> origin/guido_tactics
    FStar_TypeChecker_Common.scope = scope;
    FStar_TypeChecker_Common.reason = [reason];
    FStar_TypeChecker_Common.loc = loc;
    FStar_TypeChecker_Common.rank = None
  }
let problem_using_guard orig lhs rel rhs elt reason =
<<<<<<< HEAD
  let uu____1138 = next_pid () in
  {
    FStar_TypeChecker_Common.pid = uu____1138;
=======
  let uu____1279 = next_pid () in
  {
    FStar_TypeChecker_Common.pid = uu____1279;
>>>>>>> origin/guido_tactics
    FStar_TypeChecker_Common.lhs = lhs;
    FStar_TypeChecker_Common.relation = rel;
    FStar_TypeChecker_Common.rhs = rhs;
    FStar_TypeChecker_Common.element = elt;
    FStar_TypeChecker_Common.logical_guard = (p_guard orig);
    FStar_TypeChecker_Common.scope = (p_scope orig);
    FStar_TypeChecker_Common.reason = (reason :: (p_reason orig));
    FStar_TypeChecker_Common.loc = (p_loc orig);
    FStar_TypeChecker_Common.rank = None
  }
let guard_on_element wl problem x phi =
  match problem.FStar_TypeChecker_Common.element with
  | None  ->
      let u =
        (wl.tcenv).FStar_TypeChecker_Env.universe_of wl.tcenv
          x.FStar_Syntax_Syntax.sort in
      FStar_Syntax_Util.mk_forall u x phi
  | Some e -> FStar_Syntax_Subst.subst [FStar_Syntax_Syntax.NT (x, e)] phi
let explain:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> Prims.string -> Prims.string
  =
  fun env  ->
    fun d  ->
      fun s  ->
<<<<<<< HEAD
        let uu____1190 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "ExplainRel") in
        if uu____1190
        then
          let uu____1191 =
            FStar_All.pipe_left FStar_Range.string_of_range (p_loc d) in
          let uu____1192 = prob_to_string env d in
          let uu____1193 =
            FStar_All.pipe_right (p_reason d) (FStar_String.concat "\n\t>") in
          FStar_Util.format4
            "(%s) Failed to solve the sub-problem\n%s\nWhich arose because:\n\t%s\nFailed because:%s\n"
            uu____1191 uu____1192 uu____1193 s
=======
        let uu____1339 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "ExplainRel") in
        if uu____1339
        then
          let uu____1340 =
            FStar_All.pipe_left FStar_Range.string_of_range (p_loc d) in
          let uu____1341 = prob_to_string env d in
          let uu____1342 =
            FStar_All.pipe_right (p_reason d) (FStar_String.concat "\n\t>") in
          FStar_Util.format4
            "(%s) Failed to solve the sub-problem\n%s\nWhich arose because:\n\t%s\nFailed because:%s\n"
            uu____1340 uu____1341 uu____1342 s
>>>>>>> origin/guido_tactics
        else
          (let d1 = maybe_invert_p d in
           let rel =
             match p_rel d1 with
             | FStar_TypeChecker_Common.EQ  -> "equal to"
             | FStar_TypeChecker_Common.SUB  -> "a subtype of"
<<<<<<< HEAD
             | uu____1198 -> failwith "impossible" in
           let uu____1199 =
             match d1 with
             | FStar_TypeChecker_Common.TProb tp ->
                 let uu____1207 =
                   FStar_TypeChecker_Normalize.term_to_string env
                     tp.FStar_TypeChecker_Common.lhs in
                 let uu____1208 =
                   FStar_TypeChecker_Normalize.term_to_string env
                     tp.FStar_TypeChecker_Common.rhs in
                 (uu____1207, uu____1208)
             | FStar_TypeChecker_Common.CProb cp ->
                 let uu____1212 =
                   FStar_TypeChecker_Normalize.comp_to_string env
                     cp.FStar_TypeChecker_Common.lhs in
                 let uu____1213 =
                   FStar_TypeChecker_Normalize.comp_to_string env
                     cp.FStar_TypeChecker_Common.rhs in
                 (uu____1212, uu____1213) in
           match uu____1199 with
=======
             | uu____1347 -> failwith "impossible" in
           let uu____1348 =
             match d1 with
             | FStar_TypeChecker_Common.TProb tp ->
                 let uu____1356 =
                   FStar_TypeChecker_Normalize.term_to_string env
                     tp.FStar_TypeChecker_Common.lhs in
                 let uu____1357 =
                   FStar_TypeChecker_Normalize.term_to_string env
                     tp.FStar_TypeChecker_Common.rhs in
                 (uu____1356, uu____1357)
             | FStar_TypeChecker_Common.CProb cp ->
                 let uu____1361 =
                   FStar_TypeChecker_Normalize.comp_to_string env
                     cp.FStar_TypeChecker_Common.lhs in
                 let uu____1362 =
                   FStar_TypeChecker_Normalize.comp_to_string env
                     cp.FStar_TypeChecker_Common.rhs in
                 (uu____1361, uu____1362) in
           match uu____1348 with
>>>>>>> origin/guido_tactics
           | (lhs,rhs) ->
               FStar_Util.format3 "%s is not %s the expected type %s" lhs rel
                 rhs)
let commit: uvi Prims.list -> Prims.unit =
  fun uvis  ->
    FStar_All.pipe_right uvis
      (FStar_List.iter
<<<<<<< HEAD
         (fun uu___118_1226  ->
            match uu___118_1226 with
=======
         (fun uu___120_1372  ->
            match uu___120_1372 with
>>>>>>> origin/guido_tactics
            | UNIV (u,t) ->
                (match t with
                 | FStar_Syntax_Syntax.U_unif u' ->
                     FStar_Syntax_Unionfind.univ_union u u'
<<<<<<< HEAD
                 | uu____1234 -> FStar_Syntax_Unionfind.univ_change u t)
            | TERM ((u,uu____1236),t) -> FStar_Syntax_Util.set_uvar u t))
=======
                 | uu____1378 -> FStar_Syntax_Unionfind.univ_change u t)
            | TERM ((u,uu____1380),t) -> FStar_Syntax_Util.set_uvar u t))
>>>>>>> origin/guido_tactics
let find_term_uvar:
  FStar_Syntax_Syntax.uvar ->
    uvi Prims.list -> FStar_Syntax_Syntax.term option
  =
  fun uv  ->
    fun s  ->
      FStar_Util.find_map s
<<<<<<< HEAD
        (fun uu___119_1251  ->
           match uu___119_1251 with
           | UNIV uu____1253 -> None
           | TERM ((u,uu____1257),t) ->
               let uu____1261 = FStar_Syntax_Unionfind.equiv uv u in
               if uu____1261 then Some t else None)
=======
        (fun uu___121_1395  ->
           match uu___121_1395 with
           | UNIV uu____1397 -> None
           | TERM ((u,uu____1401),t) ->
               let uu____1405 = FStar_Syntax_Unionfind.equiv uv u in
               if uu____1405 then Some t else None)
>>>>>>> origin/guido_tactics
let find_univ_uvar:
  FStar_Syntax_Syntax.universe_uvar ->
    uvi Prims.list -> FStar_Syntax_Syntax.universe option
  =
  fun u  ->
    fun s  ->
      FStar_Util.find_map s
<<<<<<< HEAD
        (fun uu___120_1277  ->
           match uu___120_1277 with
           | UNIV (u',t) ->
               let uu____1281 = FStar_Syntax_Unionfind.univ_equiv u u' in
               if uu____1281 then Some t else None
           | uu____1284 -> None)
=======
        (fun uu___122_1419  ->
           match uu___122_1419 with
           | UNIV (u',t) ->
               let uu____1423 = FStar_Syntax_Unionfind.univ_equiv u u' in
               if uu____1423 then Some t else None
           | uu____1426 -> None)
>>>>>>> origin/guido_tactics
let whnf:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
<<<<<<< HEAD
      let uu____1291 =
        let uu____1292 = FStar_Syntax_Util.unmeta t in
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta;
          FStar_TypeChecker_Normalize.WHNF] env uu____1292 in
      FStar_Syntax_Subst.compress uu____1291
=======
      let uu____1435 =
        let uu____1436 = FStar_Syntax_Util.unmeta t in
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta;
          FStar_TypeChecker_Normalize.WHNF] env uu____1436 in
      FStar_Syntax_Subst.compress uu____1435
>>>>>>> origin/guido_tactics
let sn:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
<<<<<<< HEAD
      let uu____1299 =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta] env t in
      FStar_Syntax_Subst.compress uu____1299
let norm_arg env t = let uu____1318 = sn env (fst t) in (uu____1318, (snd t))
=======
      let uu____1445 =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Normalize.Beta] env t in
      FStar_Syntax_Subst.compress uu____1445
let norm_arg env t = let uu____1467 = sn env (fst t) in (uu____1467, (snd t))
>>>>>>> origin/guido_tactics
let sn_binders:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun env  ->
    fun binders  ->
      FStar_All.pipe_right binders
        (FStar_List.map
<<<<<<< HEAD
           (fun uu____1339  ->
              match uu____1339 with
              | (x,imp) ->
                  let uu____1346 =
                    let uu___143_1347 = x in
                    let uu____1348 = sn env x.FStar_Syntax_Syntax.sort in
                    {
                      FStar_Syntax_Syntax.ppname =
                        (uu___143_1347.FStar_Syntax_Syntax.ppname);
                      FStar_Syntax_Syntax.index =
                        (uu___143_1347.FStar_Syntax_Syntax.index);
                      FStar_Syntax_Syntax.sort = uu____1348
                    } in
                  (uu____1346, imp)))
=======
           (fun uu____1486  ->
              match uu____1486 with
              | (x,imp) ->
                  let uu____1493 =
                    let uu___145_1494 = x in
                    let uu____1495 = sn env x.FStar_Syntax_Syntax.sort in
                    {
                      FStar_Syntax_Syntax.ppname =
                        (uu___145_1494.FStar_Syntax_Syntax.ppname);
                      FStar_Syntax_Syntax.index =
                        (uu___145_1494.FStar_Syntax_Syntax.index);
                      FStar_Syntax_Syntax.sort = uu____1495
                    } in
                  (uu____1493, imp)))
>>>>>>> origin/guido_tactics
let norm_univ:
  worklist -> FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe =
  fun wl  ->
    fun u  ->
      let rec aux u1 =
        let u2 = FStar_Syntax_Subst.compress_univ u1 in
        match u2 with
        | FStar_Syntax_Syntax.U_succ u3 ->
<<<<<<< HEAD
            let uu____1363 = aux u3 in FStar_Syntax_Syntax.U_succ uu____1363
        | FStar_Syntax_Syntax.U_max us ->
            let uu____1366 = FStar_List.map aux us in
            FStar_Syntax_Syntax.U_max uu____1366
        | uu____1368 -> u2 in
      let uu____1369 = aux u in
      FStar_TypeChecker_Normalize.normalize_universe wl.tcenv uu____1369
=======
            let uu____1512 = aux u3 in FStar_Syntax_Syntax.U_succ uu____1512
        | FStar_Syntax_Syntax.U_max us ->
            let uu____1515 = FStar_List.map aux us in
            FStar_Syntax_Syntax.U_max uu____1515
        | uu____1517 -> u2 in
      let uu____1518 = aux u in
      FStar_TypeChecker_Normalize.normalize_universe wl.tcenv uu____1518
>>>>>>> origin/guido_tactics
let normalize_refinement steps env wl t0 =
  FStar_TypeChecker_Normalize.normalize_refinement steps env t0
let base_and_refinement env wl t1 =
  let rec aux norm t11 =
    match t11.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
        if norm
        then ((x.FStar_Syntax_Syntax.sort), (Some (x, phi)))
        else
<<<<<<< HEAD
          (let uu____1476 =
             normalize_refinement [FStar_TypeChecker_Normalize.WHNF] env wl
               t11 in
           match uu____1476 with
           | {
               FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_refine
                 (x1,phi1);
               FStar_Syntax_Syntax.tk = uu____1488;
               FStar_Syntax_Syntax.pos = uu____1489;
               FStar_Syntax_Syntax.vars = uu____1490;_} ->
               ((x1.FStar_Syntax_Syntax.sort), (Some (x1, phi1)))
           | tt ->
               let uu____1511 =
                 let uu____1512 = FStar_Syntax_Print.term_to_string tt in
                 let uu____1513 = FStar_Syntax_Print.tag_of_term tt in
                 FStar_Util.format2 "impossible: Got %s ... %s\n" uu____1512
                   uu____1513 in
               failwith uu____1511)
    | FStar_Syntax_Syntax.Tm_uinst uu____1523 ->
=======
          (let uu____1634 =
             normalize_refinement [FStar_TypeChecker_Normalize.WHNF] env wl
               t11 in
           match uu____1634 with
           | {
               FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_refine
                 (x1,phi1);
               FStar_Syntax_Syntax.tk = uu____1646;
               FStar_Syntax_Syntax.pos = uu____1647;
               FStar_Syntax_Syntax.vars = uu____1648;_} ->
               ((x1.FStar_Syntax_Syntax.sort), (Some (x1, phi1)))
           | tt ->
               let uu____1669 =
                 let uu____1670 = FStar_Syntax_Print.term_to_string tt in
                 let uu____1671 = FStar_Syntax_Print.tag_of_term tt in
                 FStar_Util.format2 "impossible: Got %s ... %s\n" uu____1670
                   uu____1671 in
               failwith uu____1669)
    | FStar_Syntax_Syntax.Tm_uinst uu____1681 ->
>>>>>>> origin/guido_tactics
        if norm
        then (t11, None)
        else
          (let t1' =
             normalize_refinement [FStar_TypeChecker_Normalize.WHNF] env wl
               t11 in
<<<<<<< HEAD
           let uu____1550 =
             let uu____1551 = FStar_Syntax_Subst.compress t1' in
             uu____1551.FStar_Syntax_Syntax.n in
           match uu____1550 with
           | FStar_Syntax_Syntax.Tm_refine uu____1563 -> aux true t1'
           | uu____1568 -> (t11, None))
    | FStar_Syntax_Syntax.Tm_fvar uu____1580 ->
=======
           let uu____1708 =
             let uu____1709 = FStar_Syntax_Subst.compress t1' in
             uu____1709.FStar_Syntax_Syntax.n in
           match uu____1708 with
           | FStar_Syntax_Syntax.Tm_refine uu____1721 -> aux true t1'
           | uu____1726 -> (t11, None))
    | FStar_Syntax_Syntax.Tm_fvar uu____1738 ->
>>>>>>> origin/guido_tactics
        if norm
        then (t11, None)
        else
          (let t1' =
             normalize_refinement [FStar_TypeChecker_Normalize.WHNF] env wl
               t11 in
<<<<<<< HEAD
           let uu____1603 =
             let uu____1604 = FStar_Syntax_Subst.compress t1' in
             uu____1604.FStar_Syntax_Syntax.n in
           match uu____1603 with
           | FStar_Syntax_Syntax.Tm_refine uu____1616 -> aux true t1'
           | uu____1621 -> (t11, None))
    | FStar_Syntax_Syntax.Tm_app uu____1633 ->
=======
           let uu____1761 =
             let uu____1762 = FStar_Syntax_Subst.compress t1' in
             uu____1762.FStar_Syntax_Syntax.n in
           match uu____1761 with
           | FStar_Syntax_Syntax.Tm_refine uu____1774 -> aux true t1'
           | uu____1779 -> (t11, None))
    | FStar_Syntax_Syntax.Tm_app uu____1791 ->
>>>>>>> origin/guido_tactics
        if norm
        then (t11, None)
        else
          (let t1' =
             normalize_refinement [FStar_TypeChecker_Normalize.WHNF] env wl
               t11 in
<<<<<<< HEAD
           let uu____1665 =
             let uu____1666 = FStar_Syntax_Subst.compress t1' in
             uu____1666.FStar_Syntax_Syntax.n in
           match uu____1665 with
           | FStar_Syntax_Syntax.Tm_refine uu____1678 -> aux true t1'
           | uu____1683 -> (t11, None))
    | FStar_Syntax_Syntax.Tm_type uu____1695 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_constant uu____1707 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_name uu____1719 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_bvar uu____1731 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_arrow uu____1743 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_abs uu____1762 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_uvar uu____1788 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_let uu____1810 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_match uu____1829 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_meta uu____1855 ->
        let uu____1860 =
          let uu____1861 = FStar_Syntax_Print.term_to_string t11 in
          let uu____1862 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____1861
            uu____1862 in
        failwith uu____1860
    | FStar_Syntax_Syntax.Tm_ascribed uu____1872 ->
        let uu____1890 =
          let uu____1891 = FStar_Syntax_Print.term_to_string t11 in
          let uu____1892 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____1891
            uu____1892 in
        failwith uu____1890
    | FStar_Syntax_Syntax.Tm_delayed uu____1902 ->
        let uu____1923 =
          let uu____1924 = FStar_Syntax_Print.term_to_string t11 in
          let uu____1925 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____1924
            uu____1925 in
        failwith uu____1923
    | FStar_Syntax_Syntax.Tm_unknown  ->
        let uu____1935 =
          let uu____1936 = FStar_Syntax_Print.term_to_string t11 in
          let uu____1937 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____1936
            uu____1937 in
        failwith uu____1935 in
  let uu____1947 = whnf env t1 in aux false uu____1947
=======
           let uu____1823 =
             let uu____1824 = FStar_Syntax_Subst.compress t1' in
             uu____1824.FStar_Syntax_Syntax.n in
           match uu____1823 with
           | FStar_Syntax_Syntax.Tm_refine uu____1836 -> aux true t1'
           | uu____1841 -> (t11, None))
    | FStar_Syntax_Syntax.Tm_type uu____1853 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_constant uu____1865 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_name uu____1877 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_bvar uu____1889 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_arrow uu____1901 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_abs uu____1920 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_uvar uu____1941 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_let uu____1961 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_match uu____1980 -> (t11, None)
    | FStar_Syntax_Syntax.Tm_meta uu____2007 ->
        let uu____2012 =
          let uu____2013 = FStar_Syntax_Print.term_to_string t11 in
          let uu____2014 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____2013
            uu____2014 in
        failwith uu____2012
    | FStar_Syntax_Syntax.Tm_ascribed uu____2024 ->
        let uu____2042 =
          let uu____2043 = FStar_Syntax_Print.term_to_string t11 in
          let uu____2044 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____2043
            uu____2044 in
        failwith uu____2042
    | FStar_Syntax_Syntax.Tm_delayed uu____2054 ->
        let uu____2069 =
          let uu____2070 = FStar_Syntax_Print.term_to_string t11 in
          let uu____2071 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____2070
            uu____2071 in
        failwith uu____2069
    | FStar_Syntax_Syntax.Tm_unknown  ->
        let uu____2081 =
          let uu____2082 = FStar_Syntax_Print.term_to_string t11 in
          let uu____2083 = FStar_Syntax_Print.tag_of_term t11 in
          FStar_Util.format2 "impossible (outer): Got %s ... %s\n" uu____2082
            uu____2083 in
        failwith uu____2081 in
  let uu____2093 = whnf env t1 in aux false uu____2093
>>>>>>> origin/guido_tactics
let unrefine:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax
  =
  fun env  ->
    fun t  ->
<<<<<<< HEAD
      let uu____1956 =
        let uu____1966 = empty_worklist env in
        base_and_refinement env uu____1966 t in
      FStar_All.pipe_right uu____1956 FStar_Pervasives.fst
=======
      let uu____2104 =
        let uu____2114 = empty_worklist env in
        base_and_refinement env uu____2114 t in
      FStar_All.pipe_right uu____2104 FStar_Pervasives.fst
>>>>>>> origin/guido_tactics
let trivial_refinement:
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.term)
  =
  fun t  ->
<<<<<<< HEAD
    let uu____1990 = FStar_Syntax_Syntax.null_bv t in
    (uu____1990, FStar_Syntax_Util.t_true)
let as_refinement env wl t =
  let uu____2010 = base_and_refinement env wl t in
  match uu____2010 with
=======
    let uu____2139 = FStar_Syntax_Syntax.null_bv t in
    (uu____2139, FStar_Syntax_Util.t_true)
let as_refinement env wl t =
  let uu____2163 = base_and_refinement env wl t in
  match uu____2163 with
>>>>>>> origin/guido_tactics
  | (t_base,refinement) ->
      (match refinement with
       | None  -> trivial_refinement t_base
       | Some (x,phi) -> (x, phi))
<<<<<<< HEAD
let force_refinement uu____2069 =
  match uu____2069 with
  | (t_base,refopt) ->
      let uu____2083 =
        match refopt with
        | Some (y,phi) -> (y, phi)
        | None  -> trivial_refinement t_base in
      (match uu____2083 with
=======
let force_refinement uu____2224 =
  match uu____2224 with
  | (t_base,refopt) ->
      let uu____2238 =
        match refopt with
        | Some (y,phi) -> (y, phi)
        | None  -> trivial_refinement t_base in
      (match uu____2238 with
>>>>>>> origin/guido_tactics
       | (y,phi) ->
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_refine (y, phi))
             None t_base.FStar_Syntax_Syntax.pos)
let wl_prob_to_string:
  worklist -> FStar_TypeChecker_Common.prob -> Prims.string =
  fun wl  ->
<<<<<<< HEAD
    fun uu___121_2107  ->
      match uu___121_2107 with
      | FStar_TypeChecker_Common.TProb p ->
          let uu____2111 =
            FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid in
          let uu____2112 =
            let uu____2113 = whnf wl.tcenv p.FStar_TypeChecker_Common.lhs in
            FStar_Syntax_Print.term_to_string uu____2113 in
          let uu____2114 =
            let uu____2115 = whnf wl.tcenv p.FStar_TypeChecker_Common.rhs in
            FStar_Syntax_Print.term_to_string uu____2115 in
          FStar_Util.format4 "%s: %s  (%s)  %s" uu____2111 uu____2112
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____2114
      | FStar_TypeChecker_Common.CProb p ->
          let uu____2119 =
            FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid in
          let uu____2120 =
            FStar_TypeChecker_Normalize.comp_to_string wl.tcenv
              p.FStar_TypeChecker_Common.lhs in
          let uu____2121 =
            FStar_TypeChecker_Normalize.comp_to_string wl.tcenv
              p.FStar_TypeChecker_Common.rhs in
          FStar_Util.format4 "%s: %s  (%s)  %s" uu____2119 uu____2120
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____2121
let wl_to_string: worklist -> Prims.string =
  fun wl  ->
    let uu____2125 =
      let uu____2127 =
        let uu____2129 =
          FStar_All.pipe_right wl.wl_deferred
            (FStar_List.map
               (fun uu____2143  ->
                  match uu____2143 with | (uu____2147,uu____2148,x) -> x)) in
        FStar_List.append wl.attempting uu____2129 in
      FStar_List.map (wl_prob_to_string wl) uu____2127 in
    FStar_All.pipe_right uu____2125 (FStar_String.concat "\n\t")
=======
    fun uu___123_2264  ->
      match uu___123_2264 with
      | FStar_TypeChecker_Common.TProb p ->
          let uu____2268 =
            FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid in
          let uu____2269 =
            let uu____2270 = whnf wl.tcenv p.FStar_TypeChecker_Common.lhs in
            FStar_Syntax_Print.term_to_string uu____2270 in
          let uu____2271 =
            let uu____2272 = whnf wl.tcenv p.FStar_TypeChecker_Common.rhs in
            FStar_Syntax_Print.term_to_string uu____2272 in
          FStar_Util.format4 "%s: %s  (%s)  %s" uu____2268 uu____2269
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____2271
      | FStar_TypeChecker_Common.CProb p ->
          let uu____2276 =
            FStar_Util.string_of_int p.FStar_TypeChecker_Common.pid in
          let uu____2277 =
            FStar_TypeChecker_Normalize.comp_to_string wl.tcenv
              p.FStar_TypeChecker_Common.lhs in
          let uu____2278 =
            FStar_TypeChecker_Normalize.comp_to_string wl.tcenv
              p.FStar_TypeChecker_Common.rhs in
          FStar_Util.format4 "%s: %s  (%s)  %s" uu____2276 uu____2277
            (rel_to_string p.FStar_TypeChecker_Common.relation) uu____2278
let wl_to_string: worklist -> Prims.string =
  fun wl  ->
    let uu____2283 =
      let uu____2285 =
        let uu____2287 =
          FStar_All.pipe_right wl.wl_deferred
            (FStar_List.map
               (fun uu____2297  ->
                  match uu____2297 with | (uu____2301,uu____2302,x) -> x)) in
        FStar_List.append wl.attempting uu____2287 in
      FStar_List.map (wl_prob_to_string wl) uu____2285 in
    FStar_All.pipe_right uu____2283 (FStar_String.concat "\n\t")
>>>>>>> origin/guido_tactics
let u_abs:
  FStar_Syntax_Syntax.term ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun k  ->
    fun ys  ->
      fun t  ->
<<<<<<< HEAD
        let uu____2166 =
          let uu____2176 =
            let uu____2177 = FStar_Syntax_Subst.compress k in
            uu____2177.FStar_Syntax_Syntax.n in
          match uu____2176 with
          | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
              if (FStar_List.length bs) = (FStar_List.length ys)
              then
                let uu____2218 = FStar_Syntax_Subst.open_comp bs c in
                ((ys, t), uu____2218)
              else
                (let uu____2232 = FStar_Syntax_Util.abs_formals t in
                 match uu____2232 with
                 | (ys',t1,uu____2253) ->
                     let uu____2266 = FStar_Syntax_Util.arrow_formals_comp k in
                     (((FStar_List.append ys ys'), t1), uu____2266))
          | uu____2287 ->
              let uu____2288 =
                let uu____2294 = FStar_Syntax_Syntax.mk_Total k in
                ([], uu____2294) in
              ((ys, t), uu____2288) in
        match uu____2166 with
=======
        let uu____2323 =
          let uu____2333 =
            let uu____2334 = FStar_Syntax_Subst.compress k in
            uu____2334.FStar_Syntax_Syntax.n in
          match uu____2333 with
          | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
              if (FStar_List.length bs) = (FStar_List.length ys)
              then
                let uu____2379 = FStar_Syntax_Subst.open_comp bs c in
                ((ys, t), uu____2379)
              else
                (let uu____2393 = FStar_Syntax_Util.abs_formals t in
                 match uu____2393 with
                 | (ys',t1,uu____2409) ->
                     let uu____2412 = FStar_Syntax_Util.arrow_formals_comp k in
                     (((FStar_List.append ys ys'), t1), uu____2412))
          | uu____2433 ->
              let uu____2434 =
                let uu____2440 = FStar_Syntax_Syntax.mk_Total k in
                ([], uu____2440) in
              ((ys, t), uu____2434) in
        match uu____2323 with
>>>>>>> origin/guido_tactics
        | ((ys1,t1),(xs,c)) ->
            if (FStar_List.length xs) <> (FStar_List.length ys1)
            then
              FStar_Syntax_Util.abs ys1 t1
                (Some
                   (FStar_Syntax_Util.mk_residual_comp
                      FStar_Syntax_Const.effect_Tot_lid None []))
            else
              (let c1 =
<<<<<<< HEAD
                 let uu____2349 = FStar_Syntax_Util.rename_binders xs ys1 in
                 FStar_Syntax_Subst.subst_comp uu____2349 c in
               let uu____2351 =
                 let uu____2358 =
                   FStar_All.pipe_right (FStar_Syntax_Util.lcomp_of_comp c1)
                     (fun _0_36  -> FStar_Util.Inl _0_36) in
                 FStar_All.pipe_right uu____2358 (fun _0_37  -> Some _0_37) in
               FStar_Syntax_Util.abs ys1 t1 uu____2351)
=======
                 let uu____2492 = FStar_Syntax_Util.rename_binders xs ys1 in
                 FStar_Syntax_Subst.subst_comp uu____2492 c in
               FStar_Syntax_Util.abs ys1 t1
                 (Some (FStar_Syntax_Util.residual_comp_of_comp c1)))
>>>>>>> origin/guido_tactics
let solve_prob':
  Prims.bool ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.term option ->
        uvi Prims.list -> worklist -> worklist
  =
  fun resolve_ok  ->
    fun prob  ->
      fun logical_guard  ->
        fun uvis  ->
          fun wl  ->
            let phi =
              match logical_guard with
              | None  -> FStar_Syntax_Util.t_true
              | Some phi -> phi in
<<<<<<< HEAD
            let uu____2409 = p_guard prob in
            match uu____2409 with
            | (uu____2412,uv) ->
                ((let uu____2415 =
                    let uu____2416 = FStar_Syntax_Subst.compress uv in
                    uu____2416.FStar_Syntax_Syntax.n in
                  match uu____2415 with
                  | FStar_Syntax_Syntax.Tm_uvar (uvar,k) ->
                      let bs = p_scope prob in
                      let phi1 = u_abs k bs phi in
                      ((let uu____2440 =
                          FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug wl.tcenv)
                            (FStar_Options.Other "Rel") in
                        if uu____2440
                        then
                          let uu____2441 =
                            FStar_Util.string_of_int (p_pid prob) in
                          let uu____2442 =
                            FStar_Syntax_Print.term_to_string uv in
                          let uu____2443 =
                            FStar_Syntax_Print.term_to_string phi1 in
                          FStar_Util.print3
                            "Solving %s (%s) with formula %s\n" uu____2441
                            uu____2442 uu____2443
                        else ());
                       FStar_Syntax_Util.set_uvar uvar phi1)
                  | uu____2445 ->
=======
            let uu____2520 = p_guard prob in
            match uu____2520 with
            | (uu____2523,uv) ->
                ((let uu____2526 =
                    let uu____2527 = FStar_Syntax_Subst.compress uv in
                    uu____2527.FStar_Syntax_Syntax.n in
                  match uu____2526 with
                  | FStar_Syntax_Syntax.Tm_uvar (uvar,k) ->
                      let bs = p_scope prob in
                      let phi1 = u_abs k bs phi in
                      ((let uu____2547 =
                          FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug wl.tcenv)
                            (FStar_Options.Other "Rel") in
                        if uu____2547
                        then
                          let uu____2548 =
                            FStar_Util.string_of_int (p_pid prob) in
                          let uu____2549 =
                            FStar_Syntax_Print.term_to_string uv in
                          let uu____2550 =
                            FStar_Syntax_Print.term_to_string phi1 in
                          FStar_Util.print3
                            "Solving %s (%s) with formula %s\n" uu____2548
                            uu____2549 uu____2550
                        else ());
                       FStar_Syntax_Util.set_uvar uvar phi1)
                  | uu____2552 ->
>>>>>>> origin/guido_tactics
                      if Prims.op_Negation resolve_ok
                      then
                        failwith
                          "Impossible: this instance has already been assigned a solution"
                      else ());
                 commit uvis;
<<<<<<< HEAD
                 (let uu___144_2448 = wl in
                  {
                    attempting = (uu___144_2448.attempting);
                    wl_deferred = (uu___144_2448.wl_deferred);
                    ctr = (wl.ctr + (Prims.parse_int "1"));
                    defer_ok = (uu___144_2448.defer_ok);
                    smt_ok = (uu___144_2448.smt_ok);
                    tcenv = (uu___144_2448.tcenv)
=======
                 (let uu___146_2555 = wl in
                  {
                    attempting = (uu___146_2555.attempting);
                    wl_deferred = (uu___146_2555.wl_deferred);
                    ctr = (wl.ctr + (Prims.parse_int "1"));
                    defer_ok = (uu___146_2555.defer_ok);
                    smt_ok = (uu___146_2555.smt_ok);
                    tcenv = (uu___146_2555.tcenv)
>>>>>>> origin/guido_tactics
                  }))
let extend_solution: Prims.int -> uvi Prims.list -> worklist -> worklist =
  fun pid  ->
    fun sol  ->
      fun wl  ->
<<<<<<< HEAD
        (let uu____2461 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
             (FStar_Options.Other "RelCheck") in
         if uu____2461
         then
           let uu____2462 = FStar_Util.string_of_int pid in
           let uu____2463 =
             let uu____2464 = FStar_List.map (uvi_to_string wl.tcenv) sol in
             FStar_All.pipe_right uu____2464 (FStar_String.concat ", ") in
           FStar_Util.print2 "Solving %s: with %s\n" uu____2462 uu____2463
         else ());
        commit sol;
        (let uu___145_2469 = wl in
         {
           attempting = (uu___145_2469.attempting);
           wl_deferred = (uu___145_2469.wl_deferred);
           ctr = (wl.ctr + (Prims.parse_int "1"));
           defer_ok = (uu___145_2469.defer_ok);
           smt_ok = (uu___145_2469.smt_ok);
           tcenv = (uu___145_2469.tcenv)
=======
        (let uu____2571 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
             (FStar_Options.Other "RelCheck") in
         if uu____2571
         then
           let uu____2572 = FStar_Util.string_of_int pid in
           let uu____2573 =
             let uu____2574 = FStar_List.map (uvi_to_string wl.tcenv) sol in
             FStar_All.pipe_right uu____2574 (FStar_String.concat ", ") in
           FStar_Util.print2 "Solving %s: with %s\n" uu____2572 uu____2573
         else ());
        commit sol;
        (let uu___147_2579 = wl in
         {
           attempting = (uu___147_2579.attempting);
           wl_deferred = (uu___147_2579.wl_deferred);
           ctr = (wl.ctr + (Prims.parse_int "1"));
           defer_ok = (uu___147_2579.defer_ok);
           smt_ok = (uu___147_2579.smt_ok);
           tcenv = (uu___147_2579.tcenv)
>>>>>>> origin/guido_tactics
         })
let solve_prob:
  FStar_TypeChecker_Common.prob ->
    FStar_Syntax_Syntax.term option -> uvi Prims.list -> worklist -> worklist
  =
  fun prob  ->
    fun logical_guard  ->
      fun uvis  ->
        fun wl  ->
          let conj_guard1 t g =
            match (t, g) with
<<<<<<< HEAD
            | (uu____2498,FStar_TypeChecker_Common.Trivial ) -> t
            | (None ,FStar_TypeChecker_Common.NonTrivial f) -> Some f
            | (Some t1,FStar_TypeChecker_Common.NonTrivial f) ->
                let uu____2506 = FStar_Syntax_Util.mk_conj t1 f in
                Some uu____2506 in
          (let uu____2512 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
               (FStar_Options.Other "RelCheck") in
           if uu____2512
           then
             let uu____2513 =
               FStar_All.pipe_left FStar_Util.string_of_int (p_pid prob) in
             let uu____2514 =
               let uu____2515 = FStar_List.map (uvi_to_string wl.tcenv) uvis in
               FStar_All.pipe_right uu____2515 (FStar_String.concat ", ") in
             FStar_Util.print2 "Solving %s: with %s\n" uu____2513 uu____2514
           else ());
          solve_prob' false prob logical_guard uvis wl
let rec occurs wl uk t =
  let uu____2540 =
    let uu____2544 = FStar_Syntax_Free.uvars t in
    FStar_All.pipe_right uu____2544 FStar_Util.set_elements in
  FStar_All.pipe_right uu____2540
    (FStar_Util.for_some
       (fun uu____2564  ->
          match uu____2564 with
          | (uv,uu____2568) -> FStar_Syntax_Unionfind.equiv uv (fst uk)))
let occurs_check env wl uk t =
  let occurs_ok =
    let uu____2601 = occurs wl uk t in Prims.op_Negation uu____2601 in
=======
            | (uu____2612,FStar_TypeChecker_Common.Trivial ) -> t
            | (None ,FStar_TypeChecker_Common.NonTrivial f) -> Some f
            | (Some t1,FStar_TypeChecker_Common.NonTrivial f) ->
                let uu____2620 = FStar_Syntax_Util.mk_conj t1 f in
                Some uu____2620 in
          (let uu____2626 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug wl.tcenv)
               (FStar_Options.Other "RelCheck") in
           if uu____2626
           then
             let uu____2627 =
               FStar_All.pipe_left FStar_Util.string_of_int (p_pid prob) in
             let uu____2628 =
               let uu____2629 = FStar_List.map (uvi_to_string wl.tcenv) uvis in
               FStar_All.pipe_right uu____2629 (FStar_String.concat ", ") in
             FStar_Util.print2 "Solving %s: with %s\n" uu____2627 uu____2628
           else ());
          solve_prob' false prob logical_guard uvis wl
let rec occurs wl uk t =
  let uu____2658 =
    let uu____2662 = FStar_Syntax_Free.uvars t in
    FStar_All.pipe_right uu____2662 FStar_Util.set_elements in
  FStar_All.pipe_right uu____2658
    (FStar_Util.for_some
       (fun uu____2679  ->
          match uu____2679 with
          | (uv,uu____2683) -> FStar_Syntax_Unionfind.equiv uv (fst uk)))
let occurs_check env wl uk t =
  let occurs_ok =
    let uu____2722 = occurs wl uk t in Prims.op_Negation uu____2722 in
>>>>>>> origin/guido_tactics
  let msg =
    if occurs_ok
    then None
    else
<<<<<<< HEAD
      (let uu____2606 =
         let uu____2607 = FStar_Syntax_Print.uvar_to_string (fst uk) in
         let uu____2608 = FStar_Syntax_Print.term_to_string t in
         FStar_Util.format2 "occurs-check failed (%s occurs in %s)"
           uu____2607 uu____2608 in
       Some uu____2606) in
  (occurs_ok, msg)
let occurs_and_freevars_check env wl uk fvs t =
  let fvs_t = FStar_Syntax_Free.names t in
  let uu____2656 = occurs_check env wl uk t in
  match uu____2656 with
  | (occurs_ok,msg) ->
      let uu____2673 = FStar_Util.set_is_subset_of fvs_t fvs in
      (occurs_ok, uu____2673, (msg, fvs, fvs_t))
=======
      (let uu____2727 =
         let uu____2728 = FStar_Syntax_Print.uvar_to_string (fst uk) in
         let uu____2729 = FStar_Syntax_Print.term_to_string t in
         FStar_Util.format2 "occurs-check failed (%s occurs in %s)"
           uu____2728 uu____2729 in
       Some uu____2727) in
  (occurs_ok, msg)
let occurs_and_freevars_check env wl uk fvs t =
  let fvs_t = FStar_Syntax_Free.names t in
  let uu____2784 = occurs_check env wl uk t in
  match uu____2784 with
  | (occurs_ok,msg) ->
      let uu____2801 = FStar_Util.set_is_subset_of fvs_t fvs in
      (occurs_ok, uu____2801, (msg, fvs, fvs_t))
>>>>>>> origin/guido_tactics
let intersect_vars v1 v2 =
  let as_set1 v3 =
    FStar_All.pipe_right v3
      (FStar_List.fold_left
         (fun out  -> fun x  -> FStar_Util.set_add (fst x) out)
         FStar_Syntax_Syntax.no_names) in
  let v1_set = as_set1 v1 in
<<<<<<< HEAD
  let uu____2739 =
    FStar_All.pipe_right v2
      (FStar_List.fold_left
         (fun uu____2770  ->
            fun uu____2771  ->
              match (uu____2770, uu____2771) with
              | ((isect,isect_set),(x,imp)) ->
                  let uu____2814 =
                    let uu____2815 = FStar_Util.set_mem x v1_set in
                    FStar_All.pipe_left Prims.op_Negation uu____2815 in
                  if uu____2814
=======
  let uu____2869 =
    FStar_All.pipe_right v2
      (FStar_List.fold_left
         (fun uu____2893  ->
            fun uu____2894  ->
              match (uu____2893, uu____2894) with
              | ((isect,isect_set),(x,imp)) ->
                  let uu____2937 =
                    let uu____2938 = FStar_Util.set_mem x v1_set in
                    FStar_All.pipe_left Prims.op_Negation uu____2938 in
                  if uu____2937
>>>>>>> origin/guido_tactics
                  then (isect, isect_set)
                  else
                    (let fvs =
                       FStar_Syntax_Free.names x.FStar_Syntax_Syntax.sort in
<<<<<<< HEAD
                     let uu____2829 =
                       FStar_Util.set_is_subset_of fvs isect_set in
                     if uu____2829
                     then
                       let uu____2836 = FStar_Util.set_add x isect_set in
                       (((x, imp) :: isect), uu____2836)
                     else (isect, isect_set)))
         ([], FStar_Syntax_Syntax.no_names)) in
  match uu____2739 with | (isect,uu____2858) -> FStar_List.rev isect
let binders_eq v1 v2 =
  ((FStar_List.length v1) = (FStar_List.length v2)) &&
    (FStar_List.forall2
       (fun uu____2913  ->
          fun uu____2914  ->
            match (uu____2913, uu____2914) with
            | ((a,uu____2924),(b,uu____2926)) ->
=======
                     let uu____2952 =
                       FStar_Util.set_is_subset_of fvs isect_set in
                     if uu____2952
                     then
                       let uu____2959 = FStar_Util.set_add x isect_set in
                       (((x, imp) :: isect), uu____2959)
                     else (isect, isect_set)))
         ([], FStar_Syntax_Syntax.no_names)) in
  match uu____2869 with | (isect,uu____2981) -> FStar_List.rev isect
let binders_eq v1 v2 =
  ((FStar_List.length v1) = (FStar_List.length v2)) &&
    (FStar_List.forall2
       (fun uu____3038  ->
          fun uu____3039  ->
            match (uu____3038, uu____3039) with
            | ((a,uu____3049),(b,uu____3051)) ->
>>>>>>> origin/guido_tactics
                FStar_Syntax_Syntax.bv_eq a b) v1 v2)
let pat_var_opt env seen arg =
  let hd1 = norm_arg env arg in
  match (fst hd1).FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_name a ->
<<<<<<< HEAD
      let uu____2970 =
        FStar_All.pipe_right seen
          (FStar_Util.for_some
             (fun uu____2979  ->
                match uu____2979 with
                | (b,uu____2983) -> FStar_Syntax_Syntax.bv_eq a b)) in
      if uu____2970 then None else Some (a, (snd hd1))
  | uu____2992 -> None
=======
      let uu____3100 =
        FStar_All.pipe_right seen
          (FStar_Util.for_some
             (fun uu____3106  ->
                match uu____3106 with
                | (b,uu____3110) -> FStar_Syntax_Syntax.bv_eq a b)) in
      if uu____3100 then None else Some (a, (snd hd1))
  | uu____3119 -> None
>>>>>>> origin/guido_tactics
let rec pat_vars:
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list ->
      (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.aqual) Prims.list ->
        FStar_Syntax_Syntax.binders option
  =
  fun env  ->
    fun seen  ->
      fun args  ->
        match args with
        | [] -> Some (FStar_List.rev seen)
        | hd1::rest ->
<<<<<<< HEAD
            let uu____3034 = pat_var_opt env seen hd1 in
            (match uu____3034 with
             | None  ->
                 ((let uu____3042 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Rel") in
                   if uu____3042
                   then
                     let uu____3043 =
                       FStar_All.pipe_left FStar_Syntax_Print.term_to_string
                         (fst hd1) in
                     FStar_Util.print1 "Not a pattern: %s\n" uu____3043
=======
            let uu____3165 = pat_var_opt env seen hd1 in
            (match uu____3165 with
             | None  ->
                 ((let uu____3173 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Rel") in
                   if uu____3173
                   then
                     let uu____3174 =
                       FStar_All.pipe_left FStar_Syntax_Print.term_to_string
                         (fst hd1) in
                     FStar_Util.print1 "Not a pattern: %s\n" uu____3174
>>>>>>> origin/guido_tactics
                   else ());
                  None)
             | Some x -> pat_vars env (x :: seen) rest)
let is_flex: FStar_Syntax_Syntax.term -> Prims.bool =
  fun t  ->
<<<<<<< HEAD
    let uu____3055 =
      let uu____3056 = FStar_Syntax_Subst.compress t in
      uu____3056.FStar_Syntax_Syntax.n in
    match uu____3055 with
    | FStar_Syntax_Syntax.Tm_uvar uu____3059 -> true
    | FStar_Syntax_Syntax.Tm_app
        ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar uu____3070;
           FStar_Syntax_Syntax.tk = uu____3071;
           FStar_Syntax_Syntax.pos = uu____3072;
           FStar_Syntax_Syntax.vars = uu____3073;_},uu____3074)
        -> true
    | uu____3099 -> false
=======
    let uu____3187 =
      let uu____3188 = FStar_Syntax_Subst.compress t in
      uu____3188.FStar_Syntax_Syntax.n in
    match uu____3187 with
    | FStar_Syntax_Syntax.Tm_uvar uu____3191 -> true
    | FStar_Syntax_Syntax.Tm_app
        ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar uu____3200;
           FStar_Syntax_Syntax.tk = uu____3201;
           FStar_Syntax_Syntax.pos = uu____3202;
           FStar_Syntax_Syntax.vars = uu____3203;_},uu____3204)
        -> true
    | uu____3227 -> false
>>>>>>> origin/guido_tactics
let destruct_flex_t t =
  match t.FStar_Syntax_Syntax.n with
  | FStar_Syntax_Syntax.Tm_uvar (uv,k) -> (t, uv, k, [])
  | FStar_Syntax_Syntax.Tm_app
      ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (uv,k);
<<<<<<< HEAD
         FStar_Syntax_Syntax.tk = uu____3169;
         FStar_Syntax_Syntax.pos = uu____3170;
         FStar_Syntax_Syntax.vars = uu____3171;_},args)
      -> (t, uv, k, args)
  | uu____3218 -> failwith "Not a flex-uvar"
let destruct_flex_pattern env t =
  let uu____3276 = destruct_flex_t t in
  match uu____3276 with
  | (t1,uv,k,args) ->
      let uu____3352 = pat_vars env [] args in
      (match uu____3352 with
       | Some vars -> ((t1, uv, k, args), (Some vars))
       | uu____3414 -> ((t1, uv, k, args), None))
=======
         FStar_Syntax_Syntax.tk = uu____3291;
         FStar_Syntax_Syntax.pos = uu____3292;
         FStar_Syntax_Syntax.vars = uu____3293;_},args)
      -> (t, uv, k, args)
  | uu____3334 -> failwith "Not a flex-uvar"
let destruct_flex_pattern env t =
  let uu____3391 = destruct_flex_t t in
  match uu____3391 with
  | (t1,uv,k,args) ->
      let uu____3459 = pat_vars env [] args in
      (match uu____3459 with
       | Some vars -> ((t1, uv, k, args), (Some vars))
       | uu____3515 -> ((t1, uv, k, args), None))
>>>>>>> origin/guido_tactics
type match_result =
  | MisMatch of (FStar_Syntax_Syntax.delta_depth option*
  FStar_Syntax_Syntax.delta_depth option)
  | HeadMatch
  | FullMatch
let uu___is_MisMatch: match_result -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | MisMatch _0 -> true | uu____3467 -> false
=======
    match projectee with | MisMatch _0 -> true | uu____3565 -> false
>>>>>>> origin/guido_tactics
let __proj__MisMatch__item___0:
  match_result ->
    (FStar_Syntax_Syntax.delta_depth option* FStar_Syntax_Syntax.delta_depth
      option)
  = fun projectee  -> match projectee with | MisMatch _0 -> _0
let uu___is_HeadMatch: match_result -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | HeadMatch  -> true | uu____3490 -> false
let uu___is_FullMatch: match_result -> Prims.bool =
  fun projectee  ->
    match projectee with | FullMatch  -> true | uu____3494 -> false
let head_match: match_result -> match_result =
  fun uu___122_3497  ->
    match uu___122_3497 with
    | MisMatch (i,j) -> MisMatch (i, j)
    | uu____3506 -> HeadMatch
=======
    match projectee with | HeadMatch  -> true | uu____3590 -> false
let uu___is_FullMatch: match_result -> Prims.bool =
  fun projectee  ->
    match projectee with | FullMatch  -> true | uu____3595 -> false
let head_match: match_result -> match_result =
  fun uu___124_3599  ->
    match uu___124_3599 with
    | MisMatch (i,j) -> MisMatch (i, j)
    | uu____3608 -> HeadMatch
>>>>>>> origin/guido_tactics
let fv_delta_depth:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.delta_depth
  =
  fun env  ->
    fun fv  ->
      match fv.FStar_Syntax_Syntax.fv_delta with
      | FStar_Syntax_Syntax.Delta_abstract d ->
          if
            (env.FStar_TypeChecker_Env.curmodule).FStar_Ident.str =
              ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v).FStar_Ident.nsstr
          then d
          else FStar_Syntax_Syntax.Delta_constant
<<<<<<< HEAD
      | FStar_Syntax_Syntax.Delta_defined_at_level uu____3515 ->
          let uu____3516 =
=======
      | FStar_Syntax_Syntax.Delta_defined_at_level uu____3623 ->
          let uu____3624 =
>>>>>>> origin/guido_tactics
            FStar_TypeChecker_Env.lookup_definition
              [FStar_TypeChecker_Env.Unfold
                 FStar_Syntax_Syntax.Delta_constant] env
              (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
<<<<<<< HEAD
          (match uu____3516 with
           | None  -> FStar_Syntax_Syntax.Delta_constant
           | uu____3522 -> fv.FStar_Syntax_Syntax.fv_delta)
=======
          (match uu____3624 with
           | None  -> FStar_Syntax_Syntax.Delta_constant
           | uu____3634 -> fv.FStar_Syntax_Syntax.fv_delta)
>>>>>>> origin/guido_tactics
      | d -> d
let rec delta_depth_of_term:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.delta_depth option
  =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Util.unmeta t in
      match t1.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
      | FStar_Syntax_Syntax.Tm_meta uu____3536 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_delayed uu____3542 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_unknown  -> None
      | FStar_Syntax_Syntax.Tm_bvar uu____3564 -> None
      | FStar_Syntax_Syntax.Tm_name uu____3565 -> None
      | FStar_Syntax_Syntax.Tm_uvar uu____3566 -> None
      | FStar_Syntax_Syntax.Tm_let uu____3577 -> None
      | FStar_Syntax_Syntax.Tm_match uu____3585 -> None
      | FStar_Syntax_Syntax.Tm_uinst (t2,uu____3601) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____3607,uu____3608) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_app (t2,uu____3638) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_refine
          ({ FStar_Syntax_Syntax.ppname = uu____3653;
             FStar_Syntax_Syntax.index = uu____3654;
             FStar_Syntax_Syntax.sort = t2;_},uu____3656)
          -> delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_constant uu____3663 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_type uu____3664 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_arrow uu____3665 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_abs uu____3673 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____3689 = fv_delta_depth env fv in Some uu____3689
=======
      | FStar_Syntax_Syntax.Tm_meta uu____3650 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_delayed uu____3656 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_unknown  -> None
      | FStar_Syntax_Syntax.Tm_bvar uu____3672 -> None
      | FStar_Syntax_Syntax.Tm_name uu____3673 -> None
      | FStar_Syntax_Syntax.Tm_uvar uu____3674 -> None
      | FStar_Syntax_Syntax.Tm_let uu____3683 -> None
      | FStar_Syntax_Syntax.Tm_match uu____3691 -> None
      | FStar_Syntax_Syntax.Tm_uinst (t2,uu____3708) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____3714,uu____3715) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_app (t2,uu____3745) ->
          delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_refine
          ({ FStar_Syntax_Syntax.ppname = uu____3760;
             FStar_Syntax_Syntax.index = uu____3761;
             FStar_Syntax_Syntax.sort = t2;_},uu____3763)
          -> delta_depth_of_term env t2
      | FStar_Syntax_Syntax.Tm_constant uu____3770 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_type uu____3771 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_arrow uu____3772 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_abs uu____3780 ->
          Some FStar_Syntax_Syntax.Delta_constant
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let uu____3791 = fv_delta_depth env fv in Some uu____3791
>>>>>>> origin/guido_tactics
let rec head_matches:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term -> match_result
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        let t11 = FStar_Syntax_Util.unmeta t1 in
        let t21 = FStar_Syntax_Util.unmeta t2 in
        match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n)) with
        | (FStar_Syntax_Syntax.Tm_name x,FStar_Syntax_Syntax.Tm_name y) ->
            if FStar_Syntax_Syntax.bv_eq x y
            then FullMatch
            else MisMatch (None, None)
        | (FStar_Syntax_Syntax.Tm_fvar f,FStar_Syntax_Syntax.Tm_fvar g) ->
<<<<<<< HEAD
            let uu____3708 = FStar_Syntax_Syntax.fv_eq f g in
            if uu____3708
            then FullMatch
            else
              (let uu____3710 =
                 let uu____3715 =
                   let uu____3717 = fv_delta_depth env f in Some uu____3717 in
                 let uu____3718 =
                   let uu____3720 = fv_delta_depth env g in Some uu____3720 in
                 (uu____3715, uu____3718) in
               MisMatch uu____3710)
        | (FStar_Syntax_Syntax.Tm_uinst
           (f,uu____3724),FStar_Syntax_Syntax.Tm_uinst (g,uu____3726)) ->
            let uu____3735 = head_matches env f g in
            FStar_All.pipe_right uu____3735 head_match
        | (FStar_Syntax_Syntax.Tm_constant c,FStar_Syntax_Syntax.Tm_constant
           d) -> if c = d then FullMatch else MisMatch (None, None)
        | (FStar_Syntax_Syntax.Tm_uvar
           (uv,uu____3742),FStar_Syntax_Syntax.Tm_uvar (uv',uu____3744)) ->
            let uu____3777 = FStar_Syntax_Unionfind.equiv uv uv' in
            if uu____3777 then FullMatch else MisMatch (None, None)
        | (FStar_Syntax_Syntax.Tm_refine
           (x,uu____3782),FStar_Syntax_Syntax.Tm_refine (y,uu____3784)) ->
            let uu____3793 =
              head_matches env x.FStar_Syntax_Syntax.sort
                y.FStar_Syntax_Syntax.sort in
            FStar_All.pipe_right uu____3793 head_match
        | (FStar_Syntax_Syntax.Tm_refine (x,uu____3795),uu____3796) ->
            let uu____3801 = head_matches env x.FStar_Syntax_Syntax.sort t21 in
            FStar_All.pipe_right uu____3801 head_match
        | (uu____3802,FStar_Syntax_Syntax.Tm_refine (x,uu____3804)) ->
            let uu____3809 = head_matches env t11 x.FStar_Syntax_Syntax.sort in
            FStar_All.pipe_right uu____3809 head_match
        | (FStar_Syntax_Syntax.Tm_type uu____3810,FStar_Syntax_Syntax.Tm_type
           uu____3811) -> HeadMatch
        | (FStar_Syntax_Syntax.Tm_arrow
           uu____3812,FStar_Syntax_Syntax.Tm_arrow uu____3813) -> HeadMatch
        | (FStar_Syntax_Syntax.Tm_app
           (head1,uu____3829),FStar_Syntax_Syntax.Tm_app (head',uu____3831))
            ->
            let uu____3860 = head_matches env head1 head' in
            FStar_All.pipe_right uu____3860 head_match
        | (FStar_Syntax_Syntax.Tm_app (head1,uu____3862),uu____3863) ->
            let uu____3878 = head_matches env head1 t21 in
            FStar_All.pipe_right uu____3878 head_match
        | (uu____3879,FStar_Syntax_Syntax.Tm_app (head1,uu____3881)) ->
            let uu____3896 = head_matches env t11 head1 in
            FStar_All.pipe_right uu____3896 head_match
        | uu____3897 ->
            let uu____3900 =
              let uu____3905 = delta_depth_of_term env t11 in
              let uu____3907 = delta_depth_of_term env t21 in
              (uu____3905, uu____3907) in
            MisMatch uu____3900
let head_matches_delta env wl t1 t2 =
  let maybe_inline t =
    let uu____3943 = FStar_Syntax_Util.head_and_args t in
    match uu____3943 with
    | (head1,uu____3955) ->
        let uu____3970 =
          let uu____3971 = FStar_Syntax_Util.un_uinst head1 in
          uu____3971.FStar_Syntax_Syntax.n in
        (match uu____3970 with
         | FStar_Syntax_Syntax.Tm_fvar fv ->
             let uu____3976 =
               let uu____3977 =
                 FStar_TypeChecker_Env.lookup_definition
                   [FStar_TypeChecker_Env.Eager_unfolding_only] env
                   (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
               FStar_All.pipe_right uu____3977 FStar_Option.isSome in
             if uu____3976
             then
               let uu____3987 =
                 FStar_TypeChecker_Normalize.normalize
                   [FStar_TypeChecker_Normalize.Beta;
                   FStar_TypeChecker_Normalize.Eager_unfolding] env t in
               FStar_All.pipe_right uu____3987 (fun _0_38  -> Some _0_38)
             else None
         | uu____3990 -> None) in
=======
            let uu____3813 = FStar_Syntax_Syntax.fv_eq f g in
            if uu____3813
            then FullMatch
            else
              (let uu____3815 =
                 let uu____3820 =
                   let uu____3822 = fv_delta_depth env f in Some uu____3822 in
                 let uu____3823 =
                   let uu____3825 = fv_delta_depth env g in Some uu____3825 in
                 (uu____3820, uu____3823) in
               MisMatch uu____3815)
        | (FStar_Syntax_Syntax.Tm_uinst
           (f,uu____3829),FStar_Syntax_Syntax.Tm_uinst (g,uu____3831)) ->
            let uu____3840 = head_matches env f g in
            FStar_All.pipe_right uu____3840 head_match
        | (FStar_Syntax_Syntax.Tm_constant c,FStar_Syntax_Syntax.Tm_constant
           d) -> if c = d then FullMatch else MisMatch (None, None)
        | (FStar_Syntax_Syntax.Tm_uvar
           (uv,uu____3847),FStar_Syntax_Syntax.Tm_uvar (uv',uu____3849)) ->
            let uu____3874 = FStar_Syntax_Unionfind.equiv uv uv' in
            if uu____3874 then FullMatch else MisMatch (None, None)
        | (FStar_Syntax_Syntax.Tm_refine
           (x,uu____3879),FStar_Syntax_Syntax.Tm_refine (y,uu____3881)) ->
            let uu____3890 =
              head_matches env x.FStar_Syntax_Syntax.sort
                y.FStar_Syntax_Syntax.sort in
            FStar_All.pipe_right uu____3890 head_match
        | (FStar_Syntax_Syntax.Tm_refine (x,uu____3892),uu____3893) ->
            let uu____3898 = head_matches env x.FStar_Syntax_Syntax.sort t21 in
            FStar_All.pipe_right uu____3898 head_match
        | (uu____3899,FStar_Syntax_Syntax.Tm_refine (x,uu____3901)) ->
            let uu____3906 = head_matches env t11 x.FStar_Syntax_Syntax.sort in
            FStar_All.pipe_right uu____3906 head_match
        | (FStar_Syntax_Syntax.Tm_type uu____3907,FStar_Syntax_Syntax.Tm_type
           uu____3908) -> HeadMatch
        | (FStar_Syntax_Syntax.Tm_arrow
           uu____3909,FStar_Syntax_Syntax.Tm_arrow uu____3910) -> HeadMatch
        | (FStar_Syntax_Syntax.Tm_app
           (head1,uu____3926),FStar_Syntax_Syntax.Tm_app (head',uu____3928))
            ->
            let uu____3957 = head_matches env head1 head' in
            FStar_All.pipe_right uu____3957 head_match
        | (FStar_Syntax_Syntax.Tm_app (head1,uu____3959),uu____3960) ->
            let uu____3975 = head_matches env head1 t21 in
            FStar_All.pipe_right uu____3975 head_match
        | (uu____3976,FStar_Syntax_Syntax.Tm_app (head1,uu____3978)) ->
            let uu____3993 = head_matches env t11 head1 in
            FStar_All.pipe_right uu____3993 head_match
        | uu____3994 ->
            let uu____3997 =
              let uu____4002 = delta_depth_of_term env t11 in
              let uu____4004 = delta_depth_of_term env t21 in
              (uu____4002, uu____4004) in
            MisMatch uu____3997
let head_matches_delta env wl t1 t2 =
  let maybe_inline t =
    let uu____4045 = FStar_Syntax_Util.head_and_args t in
    match uu____4045 with
    | (head1,uu____4057) ->
        let uu____4072 =
          let uu____4073 = FStar_Syntax_Util.un_uinst head1 in
          uu____4073.FStar_Syntax_Syntax.n in
        (match uu____4072 with
         | FStar_Syntax_Syntax.Tm_fvar fv ->
             let uu____4078 =
               let uu____4079 =
                 FStar_TypeChecker_Env.lookup_definition
                   [FStar_TypeChecker_Env.Eager_unfolding_only] env
                   (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
               FStar_All.pipe_right uu____4079 FStar_Option.isSome in
             if uu____4078
             then
               let uu____4093 =
                 FStar_TypeChecker_Normalize.normalize
                   [FStar_TypeChecker_Normalize.Beta;
                   FStar_TypeChecker_Normalize.Eager_unfolding] env t in
               FStar_All.pipe_right uu____4093 (fun _0_45  -> Some _0_45)
             else None
         | uu____4096 -> None) in
>>>>>>> origin/guido_tactics
  let success d r t11 t21 =
    (r, (if d > (Prims.parse_int "0") then Some (t11, t21) else None)) in
  let fail r = (r, None) in
  let rec aux retry n_delta t11 t21 =
    let r = head_matches env t11 t21 in
    match r with
<<<<<<< HEAD
    | MisMatch (Some (FStar_Syntax_Syntax.Delta_equational ),uu____4058) ->
        if Prims.op_Negation retry
        then fail r
        else
          (let uu____4068 =
             let uu____4073 = maybe_inline t11 in
             let uu____4075 = maybe_inline t21 in (uu____4073, uu____4075) in
           match uu____4068 with
=======
    | MisMatch (Some (FStar_Syntax_Syntax.Delta_equational ),uu____4164) ->
        if Prims.op_Negation retry
        then fail r
        else
          (let uu____4174 =
             let uu____4179 = maybe_inline t11 in
             let uu____4181 = maybe_inline t21 in (uu____4179, uu____4181) in
           match uu____4174 with
>>>>>>> origin/guido_tactics
           | (None ,None ) -> fail r
           | (Some t12,None ) ->
               aux false (n_delta + (Prims.parse_int "1")) t12 t21
           | (None ,Some t22) ->
               aux false (n_delta + (Prims.parse_int "1")) t11 t22
           | (Some t12,Some t22) ->
               aux false (n_delta + (Prims.parse_int "1")) t12 t22)
<<<<<<< HEAD
    | MisMatch (uu____4096,Some (FStar_Syntax_Syntax.Delta_equational )) ->
        if Prims.op_Negation retry
        then fail r
        else
          (let uu____4106 =
             let uu____4111 = maybe_inline t11 in
             let uu____4113 = maybe_inline t21 in (uu____4111, uu____4113) in
           match uu____4106 with
=======
    | MisMatch (uu____4202,Some (FStar_Syntax_Syntax.Delta_equational )) ->
        if Prims.op_Negation retry
        then fail r
        else
          (let uu____4212 =
             let uu____4217 = maybe_inline t11 in
             let uu____4219 = maybe_inline t21 in (uu____4217, uu____4219) in
           match uu____4212 with
>>>>>>> origin/guido_tactics
           | (None ,None ) -> fail r
           | (Some t12,None ) ->
               aux false (n_delta + (Prims.parse_int "1")) t12 t21
           | (None ,Some t22) ->
               aux false (n_delta + (Prims.parse_int "1")) t11 t22
           | (Some t12,Some t22) ->
               aux false (n_delta + (Prims.parse_int "1")) t12 t22)
    | MisMatch (Some d1,Some d2) when d1 = d2 ->
<<<<<<< HEAD
        let uu____4138 = FStar_TypeChecker_Common.decr_delta_depth d1 in
        (match uu____4138 with
=======
        let uu____4244 = FStar_TypeChecker_Common.decr_delta_depth d1 in
        (match uu____4244 with
>>>>>>> origin/guido_tactics
         | None  -> fail r
         | Some d ->
             let t12 =
               normalize_refinement
                 [FStar_TypeChecker_Normalize.UnfoldUntil d;
                 FStar_TypeChecker_Normalize.WHNF] env wl t11 in
             let t22 =
               normalize_refinement
                 [FStar_TypeChecker_Normalize.UnfoldUntil d;
                 FStar_TypeChecker_Normalize.WHNF] env wl t21 in
             aux retry (n_delta + (Prims.parse_int "1")) t12 t22)
    | MisMatch (Some d1,Some d2) ->
        let d1_greater_than_d2 =
          FStar_TypeChecker_Common.delta_depth_greater_than d1 d2 in
<<<<<<< HEAD
        let uu____4153 =
=======
        let uu____4259 =
>>>>>>> origin/guido_tactics
          if d1_greater_than_d2
          then
            let t1' =
              normalize_refinement
                [FStar_TypeChecker_Normalize.UnfoldUntil d2;
                FStar_TypeChecker_Normalize.WHNF] env wl t11 in
            (t1', t21)
          else
            (let t2' =
               normalize_refinement
                 [FStar_TypeChecker_Normalize.UnfoldUntil d1;
                 FStar_TypeChecker_Normalize.WHNF] env wl t21 in
<<<<<<< HEAD
             let uu____4161 =
               normalize_refinement
                 [FStar_TypeChecker_Normalize.UnfoldUntil d1;
                 FStar_TypeChecker_Normalize.WHNF] env wl t21 in
             (t11, uu____4161)) in
        (match uu____4153 with
         | (t12,t22) -> aux retry (n_delta + (Prims.parse_int "1")) t12 t22)
    | MisMatch uu____4169 -> fail r
    | uu____4174 -> success n_delta r t11 t21 in
=======
             (t11, t2')) in
        (match uu____4259 with
         | (t12,t22) -> aux retry (n_delta + (Prims.parse_int "1")) t12 t22)
    | MisMatch uu____4274 -> fail r
    | uu____4279 -> success n_delta r t11 t21 in
>>>>>>> origin/guido_tactics
  aux true (Prims.parse_int "0") t1 t2
type tc =
  | T of (FStar_Syntax_Syntax.term*
  (FStar_Syntax_Syntax.binders ->
     FStar_Range.range -> FStar_Syntax_Syntax.term))
  | C of FStar_Syntax_Syntax.comp
let uu___is_T: tc -> Prims.bool =
<<<<<<< HEAD
  fun projectee  -> match projectee with | T _0 -> true | uu____4203 -> false
=======
  fun projectee  -> match projectee with | T _0 -> true | uu____4309 -> false
>>>>>>> origin/guido_tactics
let __proj__T__item___0:
  tc ->
    (FStar_Syntax_Syntax.term*
      (FStar_Syntax_Syntax.binders ->
         FStar_Range.range -> FStar_Syntax_Syntax.term))
  = fun projectee  -> match projectee with | T _0 -> _0
let uu___is_C: tc -> Prims.bool =
<<<<<<< HEAD
  fun projectee  -> match projectee with | C _0 -> true | uu____4233 -> false
=======
  fun projectee  -> match projectee with | C _0 -> true | uu____4341 -> false
>>>>>>> origin/guido_tactics
let __proj__C__item___0: tc -> FStar_Syntax_Syntax.comp =
  fun projectee  -> match projectee with | C _0 -> _0
type tcs = tc Prims.list
let generic_kind:
  FStar_Syntax_Syntax.binders -> FStar_Range.range -> FStar_Syntax_Syntax.typ
  =
  fun binders  ->
    fun r  ->
<<<<<<< HEAD
      let uu____4248 = FStar_Syntax_Util.type_u () in
      match uu____4248 with
      | (t,uu____4252) ->
          let uu____4253 = new_uvar r binders t in fst uu____4253
=======
      let uu____4359 = FStar_Syntax_Util.type_u () in
      match uu____4359 with
      | (t,uu____4363) ->
          let uu____4364 = new_uvar r binders t in fst uu____4364
>>>>>>> origin/guido_tactics
let kind_type:
  FStar_Syntax_Syntax.binders -> FStar_Range.range -> FStar_Syntax_Syntax.typ
  =
  fun binders  ->
    fun r  ->
<<<<<<< HEAD
      let uu____4262 = FStar_Syntax_Util.type_u () in
      FStar_All.pipe_right uu____4262 FStar_Pervasives.fst
=======
      let uu____4375 = FStar_Syntax_Util.type_u () in
      FStar_All.pipe_right uu____4375 FStar_Pervasives.fst
>>>>>>> origin/guido_tactics
let rec decompose:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      ((tc Prims.list -> FStar_Syntax_Syntax.term)*
        (FStar_Syntax_Syntax.term -> Prims.bool)* (FStar_Syntax_Syntax.binder
        option* variance* tc) Prims.list)
  =
  fun env  ->
    fun t  ->
      let t1 = FStar_Syntax_Util.unmeta t in
      let matches t' =
<<<<<<< HEAD
        let uu____4304 = head_matches env t1 t' in
        match uu____4304 with
        | MisMatch uu____4305 -> false
        | uu____4310 -> true in
=======
        let uu____4419 = head_matches env t1 t' in
        match uu____4419 with
        | MisMatch uu____4420 -> false
        | uu____4425 -> true in
>>>>>>> origin/guido_tactics
      match t1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
          let rebuild args' =
            let args1 =
              FStar_List.map2
                (fun x  ->
                   fun y  ->
                     match (x, y) with
<<<<<<< HEAD
                     | ((uu____4376,imp),T (t2,uu____4379)) -> (t2, imp)
                     | uu____4396 -> failwith "Bad reconstruction") args
=======
                     | ((uu____4485,imp),T (t2,uu____4488)) -> (t2, imp)
                     | uu____4505 -> failwith "Bad reconstruction") args
>>>>>>> origin/guido_tactics
                args' in
            FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (hd1, args1))
              None t1.FStar_Syntax_Syntax.pos in
          let tcs =
            FStar_All.pipe_right args
              (FStar_List.map
<<<<<<< HEAD
                 (fun uu____4439  ->
                    match uu____4439 with
                    | (t2,uu____4447) ->
                        (None, INVARIANT, (T (t2, generic_kind))))) in
          (rebuild, matches, tcs)
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let uu____4477 = FStar_Syntax_Subst.open_comp bs c in
          (match uu____4477 with
=======
                 (fun uu____4545  ->
                    match uu____4545 with
                    | (t2,uu____4553) ->
                        (None, INVARIANT, (T (t2, generic_kind))))) in
          (rebuild, matches, tcs)
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let uu____4583 = FStar_Syntax_Subst.open_comp bs c in
          (match uu____4583 with
>>>>>>> origin/guido_tactics
           | (bs1,c1) ->
               let rebuild tcs =
                 let rec aux out bs2 tcs1 =
                   match (bs2, tcs1) with
<<<<<<< HEAD
                   | ((x,imp)::bs3,(T (t2,uu____4530))::tcs2) ->
                       aux
                         (((let uu___146_4553 = x in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___146_4553.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___146_4553.FStar_Syntax_Syntax.index);
=======
                   | ((x,imp)::bs3,(T (t2,uu____4636))::tcs2) ->
                       aux
                         (((let uu___148_4658 = x in
                            {
                              FStar_Syntax_Syntax.ppname =
                                (uu___148_4658.FStar_Syntax_Syntax.ppname);
                              FStar_Syntax_Syntax.index =
                                (uu___148_4658.FStar_Syntax_Syntax.index);
>>>>>>> origin/guido_tactics
                              FStar_Syntax_Syntax.sort = t2
                            }), imp) :: out) bs3 tcs2
                   | ([],(C c2)::[]) ->
                       FStar_Syntax_Util.arrow (FStar_List.rev out) c2
<<<<<<< HEAD
                   | uu____4563 -> failwith "Bad reconstruction" in
                 aux [] bs1 tcs in
               let rec decompose1 out uu___123_4594 =
                 match uu___123_4594 with
=======
                   | uu____4668 -> failwith "Bad reconstruction" in
                 aux [] bs1 tcs in
               let rec decompose1 out uu___125_4699 =
                 match uu___125_4699 with
>>>>>>> origin/guido_tactics
                 | [] -> FStar_List.rev ((None, COVARIANT, (C c1)) :: out)
                 | hd1::rest ->
                     decompose1
                       (((Some hd1), CONTRAVARIANT,
                          (T
                             (((fst hd1).FStar_Syntax_Syntax.sort),
                               kind_type))) :: out) rest in
<<<<<<< HEAD
               let uu____4657 = decompose1 [] bs1 in
               (rebuild, matches, uu____4657))
      | uu____4685 ->
          let rebuild uu___124_4690 =
            match uu___124_4690 with
            | [] -> t1
            | uu____4692 -> failwith "Bad reconstruction" in
          (rebuild, ((fun t2  -> true)), [])
let un_T: tc -> FStar_Syntax_Syntax.term =
  fun uu___125_4712  ->
    match uu___125_4712 with
    | T (t,uu____4714) -> t
    | uu____4723 -> failwith "Impossible"
let arg_of_tc: tc -> FStar_Syntax_Syntax.arg =
  fun uu___126_4726  ->
    match uu___126_4726 with
    | T (t,uu____4728) -> FStar_Syntax_Syntax.as_arg t
    | uu____4737 -> failwith "Impossible"
=======
               let uu____4762 = decompose1 [] bs1 in
               (rebuild, matches, uu____4762))
      | uu____4790 ->
          let rebuild uu___126_4795 =
            match uu___126_4795 with
            | [] -> t1
            | uu____4797 -> failwith "Bad reconstruction" in
          (rebuild, ((fun t2  -> true)), [])
let un_T: tc -> FStar_Syntax_Syntax.term =
  fun uu___127_4817  ->
    match uu___127_4817 with
    | T (t,uu____4819) -> t
    | uu____4828 -> failwith "Impossible"
let arg_of_tc: tc -> FStar_Syntax_Syntax.arg =
  fun uu___128_4832  ->
    match uu___128_4832 with
    | T (t,uu____4834) -> FStar_Syntax_Syntax.as_arg t
    | uu____4843 -> failwith "Impossible"
>>>>>>> origin/guido_tactics
let imitation_sub_probs:
  FStar_TypeChecker_Common.prob ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.args ->
          (FStar_Syntax_Syntax.binder option* variance* tc) Prims.list ->
            (FStar_TypeChecker_Common.prob Prims.list* tc Prims.list*
              FStar_Syntax_Syntax.formula)
  =
  fun orig  ->
    fun env  ->
      fun scope  ->
        fun ps  ->
          fun qs  ->
            let r = p_loc orig in
            let rel = p_rel orig in
            let sub_prob scope1 args q =
              match q with
<<<<<<< HEAD
              | (uu____4806,variance,T (ti,mk_kind)) ->
                  let k = mk_kind scope1 r in
                  let uu____4825 = new_uvar r scope1 k in
                  (match uu____4825 with
=======
              | (uu____4917,variance,T (ti,mk_kind)) ->
                  let k = mk_kind scope1 r in
                  let uu____4936 = new_uvar r scope1 k in
                  (match uu____4936 with
>>>>>>> origin/guido_tactics
                   | (gi_xs,gi) ->
                       let gi_ps =
                         match args with
                         | [] -> gi
<<<<<<< HEAD
                         | uu____4837 ->
                             FStar_Syntax_Syntax.mk
                               (FStar_Syntax_Syntax.Tm_app (gi, args)) None r in
                       let uu____4852 =
                         let uu____4853 =
                           mk_problem scope1 orig gi_ps
                             (vary_rel rel variance) ti None "type subterm" in
                         FStar_All.pipe_left
                           (fun _0_39  ->
                              FStar_TypeChecker_Common.TProb _0_39)
                           uu____4853 in
                       ((T (gi_xs, mk_kind)), uu____4852))
              | (uu____4862,uu____4863,C uu____4864) -> failwith "impos" in
=======
                         | uu____4948 ->
                             FStar_Syntax_Syntax.mk
                               (FStar_Syntax_Syntax.Tm_app (gi, args)) None r in
                       let uu____4963 =
                         let uu____4964 =
                           mk_problem scope1 orig gi_ps
                             (vary_rel rel variance) ti None "type subterm" in
                         FStar_All.pipe_left
                           (fun _0_46  ->
                              FStar_TypeChecker_Common.TProb _0_46)
                           uu____4964 in
                       ((T (gi_xs, mk_kind)), uu____4963))
              | (uu____4973,uu____4974,C uu____4975) -> failwith "impos" in
>>>>>>> origin/guido_tactics
            let rec aux scope1 args qs1 =
              match qs1 with
              | [] -> ([], [], FStar_Syntax_Util.t_true)
              | q::qs2 ->
<<<<<<< HEAD
                  let uu____4946 =
=======
                  let uu____5062 =
>>>>>>> origin/guido_tactics
                    match q with
                    | (bopt,variance,C
                       {
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Total
                           (ti,uopt);
<<<<<<< HEAD
                         FStar_Syntax_Syntax.tk = uu____4957;
                         FStar_Syntax_Syntax.pos = uu____4958;
                         FStar_Syntax_Syntax.vars = uu____4959;_})
                        ->
                        let uu____4974 =
                          sub_prob scope1 args
                            (bopt, variance, (T (ti, kind_type))) in
                        (match uu____4974 with
                         | (T (gi_xs,uu____4990),prob) ->
                             let uu____5000 =
                               let uu____5001 =
                                 FStar_Syntax_Syntax.mk_Total' gi_xs uopt in
                               FStar_All.pipe_left (fun _0_40  -> C _0_40)
                                 uu____5001 in
                             (uu____5000, [prob])
                         | uu____5003 -> failwith "impossible")
=======
                         FStar_Syntax_Syntax.tk = uu____5073;
                         FStar_Syntax_Syntax.pos = uu____5074;
                         FStar_Syntax_Syntax.vars = uu____5075;_})
                        ->
                        let uu____5090 =
                          sub_prob scope1 args
                            (bopt, variance, (T (ti, kind_type))) in
                        (match uu____5090 with
                         | (T (gi_xs,uu____5106),prob) ->
                             let uu____5116 =
                               let uu____5117 =
                                 FStar_Syntax_Syntax.mk_Total' gi_xs uopt in
                               FStar_All.pipe_left (fun _0_47  -> C _0_47)
                                 uu____5117 in
                             (uu____5116, [prob])
                         | uu____5119 -> failwith "impossible")
>>>>>>> origin/guido_tactics
                    | (bopt,variance,C
                       {
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.GTotal
                           (ti,uopt);
<<<<<<< HEAD
                         FStar_Syntax_Syntax.tk = uu____5013;
                         FStar_Syntax_Syntax.pos = uu____5014;
                         FStar_Syntax_Syntax.vars = uu____5015;_})
                        ->
                        let uu____5030 =
                          sub_prob scope1 args
                            (bopt, variance, (T (ti, kind_type))) in
                        (match uu____5030 with
                         | (T (gi_xs,uu____5046),prob) ->
                             let uu____5056 =
                               let uu____5057 =
                                 FStar_Syntax_Syntax.mk_GTotal' gi_xs uopt in
                               FStar_All.pipe_left (fun _0_41  -> C _0_41)
                                 uu____5057 in
                             (uu____5056, [prob])
                         | uu____5059 -> failwith "impossible")
                    | (uu____5065,uu____5066,C
                       { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Comp c;
                         FStar_Syntax_Syntax.tk = uu____5068;
                         FStar_Syntax_Syntax.pos = uu____5069;
                         FStar_Syntax_Syntax.vars = uu____5070;_})
=======
                         FStar_Syntax_Syntax.tk = uu____5129;
                         FStar_Syntax_Syntax.pos = uu____5130;
                         FStar_Syntax_Syntax.vars = uu____5131;_})
                        ->
                        let uu____5146 =
                          sub_prob scope1 args
                            (bopt, variance, (T (ti, kind_type))) in
                        (match uu____5146 with
                         | (T (gi_xs,uu____5162),prob) ->
                             let uu____5172 =
                               let uu____5173 =
                                 FStar_Syntax_Syntax.mk_GTotal' gi_xs uopt in
                               FStar_All.pipe_left (fun _0_48  -> C _0_48)
                                 uu____5173 in
                             (uu____5172, [prob])
                         | uu____5175 -> failwith "impossible")
                    | (uu____5181,uu____5182,C
                       { FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Comp c;
                         FStar_Syntax_Syntax.tk = uu____5184;
                         FStar_Syntax_Syntax.pos = uu____5185;
                         FStar_Syntax_Syntax.vars = uu____5186;_})
>>>>>>> origin/guido_tactics
                        ->
                        let components =
                          FStar_All.pipe_right
                            c.FStar_Syntax_Syntax.effect_args
                            (FStar_List.map
                               (fun t  ->
                                  (None, INVARIANT,
                                    (T ((fst t), generic_kind))))) in
                        let components1 =
                          (None, COVARIANT,
                            (T
                               ((c.FStar_Syntax_Syntax.result_typ),
                                 kind_type)))
                          :: components in
<<<<<<< HEAD
                        let uu____5145 =
                          let uu____5150 =
                            FStar_List.map (sub_prob scope1 args) components1 in
                          FStar_All.pipe_right uu____5150 FStar_List.unzip in
                        (match uu____5145 with
                         | (tcs,sub_probs) ->
                             let gi_xs =
                               let uu____5179 =
                                 let uu____5180 =
                                   let uu____5183 = FStar_List.hd tcs in
                                   FStar_All.pipe_right uu____5183 un_T in
                                 let uu____5184 =
                                   let uu____5190 = FStar_List.tl tcs in
                                   FStar_All.pipe_right uu____5190
=======
                        let uu____5260 =
                          let uu____5265 =
                            FStar_List.map (sub_prob scope1 args) components1 in
                          FStar_All.pipe_right uu____5265 FStar_List.unzip in
                        (match uu____5260 with
                         | (tcs,sub_probs) ->
                             let gi_xs =
                               let uu____5294 =
                                 let uu____5295 =
                                   let uu____5298 = FStar_List.hd tcs in
                                   FStar_All.pipe_right uu____5298 un_T in
                                 let uu____5299 =
                                   let uu____5305 = FStar_List.tl tcs in
                                   FStar_All.pipe_right uu____5305
>>>>>>> origin/guido_tactics
                                     (FStar_List.map arg_of_tc) in
                                 {
                                   FStar_Syntax_Syntax.comp_univs =
                                     (c.FStar_Syntax_Syntax.comp_univs);
                                   FStar_Syntax_Syntax.effect_name =
                                     (c.FStar_Syntax_Syntax.effect_name);
                                   FStar_Syntax_Syntax.result_typ =
<<<<<<< HEAD
                                     uu____5180;
                                   FStar_Syntax_Syntax.effect_args =
                                     uu____5184;
=======
                                     uu____5295;
                                   FStar_Syntax_Syntax.effect_args =
                                     uu____5299;
>>>>>>> origin/guido_tactics
                                   FStar_Syntax_Syntax.flags =
                                     (c.FStar_Syntax_Syntax.flags)
                                 } in
                               FStar_All.pipe_left
<<<<<<< HEAD
                                 FStar_Syntax_Syntax.mk_Comp uu____5179 in
                             ((C gi_xs), sub_probs))
                    | uu____5195 ->
                        let uu____5202 = sub_prob scope1 args q in
                        (match uu____5202 with
                         | (ktec,prob) -> (ktec, [prob])) in
                  (match uu____4946 with
                   | (tc,probs) ->
                       let uu____5220 =
                         match q with
                         | (Some b,uu____5246,uu____5247) ->
                             let uu____5255 =
                               let uu____5259 =
                                 FStar_Syntax_Util.arg_of_non_null_binder b in
                               uu____5259 :: args in
                             ((Some b), (b :: scope1), uu____5255)
                         | uu____5277 -> (None, scope1, args) in
                       (match uu____5220 with
                        | (bopt,scope2,args1) ->
                            let uu____5320 = aux scope2 args1 qs2 in
                            (match uu____5320 with
=======
                                 FStar_Syntax_Syntax.mk_Comp uu____5294 in
                             ((C gi_xs), sub_probs))
                    | uu____5310 ->
                        let uu____5317 = sub_prob scope1 args q in
                        (match uu____5317 with
                         | (ktec,prob) -> (ktec, [prob])) in
                  (match uu____5062 with
                   | (tc,probs) ->
                       let uu____5335 =
                         match q with
                         | (Some b,uu____5361,uu____5362) ->
                             let uu____5370 =
                               let uu____5374 =
                                 FStar_Syntax_Util.arg_of_non_null_binder b in
                               uu____5374 :: args in
                             ((Some b), (b :: scope1), uu____5370)
                         | uu____5392 -> (None, scope1, args) in
                       (match uu____5335 with
                        | (bopt,scope2,args1) ->
                            let uu____5435 = aux scope2 args1 qs2 in
                            (match uu____5435 with
>>>>>>> origin/guido_tactics
                             | (sub_probs,tcs,f) ->
                                 let f1 =
                                   match bopt with
                                   | None  ->
<<<<<<< HEAD
                                       let uu____5341 =
                                         let uu____5343 =
=======
                                       let uu____5456 =
                                         let uu____5458 =
>>>>>>> origin/guido_tactics
                                           FStar_All.pipe_right probs
                                             (FStar_List.map
                                                (fun prob  ->
                                                   FStar_All.pipe_right
                                                     (p_guard prob)
                                                     FStar_Pervasives.fst)) in
<<<<<<< HEAD
                                         f :: uu____5343 in
                                       FStar_Syntax_Util.mk_conj_l uu____5341
=======
                                         f :: uu____5458 in
                                       FStar_Syntax_Util.mk_conj_l uu____5456
>>>>>>> origin/guido_tactics
                                   | Some b ->
                                       let u_b =
                                         env.FStar_TypeChecker_Env.universe_of
                                           env
                                           (fst b).FStar_Syntax_Syntax.sort in
<<<<<<< HEAD
                                       let uu____5357 =
                                         let uu____5359 =
                                           FStar_Syntax_Util.mk_forall u_b
                                             (fst b) f in
                                         let uu____5360 =
=======
                                       let uu____5471 =
                                         let uu____5473 =
                                           FStar_Syntax_Util.mk_forall u_b
                                             (fst b) f in
                                         let uu____5474 =
>>>>>>> origin/guido_tactics
                                           FStar_All.pipe_right probs
                                             (FStar_List.map
                                                (fun prob  ->
                                                   FStar_All.pipe_right
                                                     (p_guard prob)
                                                     FStar_Pervasives.fst)) in
<<<<<<< HEAD
                                         uu____5359 :: uu____5360 in
                                       FStar_Syntax_Util.mk_conj_l uu____5357 in
=======
                                         uu____5473 :: uu____5474 in
                                       FStar_Syntax_Util.mk_conj_l uu____5471 in
>>>>>>> origin/guido_tactics
                                 ((FStar_List.append probs sub_probs), (tc ::
                                   tcs), f1)))) in
            aux scope ps qs
type flex_t =
  (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.uvar*
    FStar_Syntax_Syntax.typ* FStar_Syntax_Syntax.args)
type im_or_proj_t =
  (((FStar_Syntax_Syntax.uvar* FStar_Syntax_Syntax.typ)*
    FStar_Syntax_Syntax.binders* FStar_Syntax_Syntax.comp)*
    FStar_Syntax_Syntax.arg Prims.list*
    ((tc Prims.list -> FStar_Syntax_Syntax.typ)*
    (FStar_Syntax_Syntax.typ -> Prims.bool)* (FStar_Syntax_Syntax.binder
    option* variance* tc) Prims.list))
let rigid_rigid: Prims.int = Prims.parse_int "0"
let flex_rigid_eq: Prims.int = Prims.parse_int "1"
let flex_refine_inner: Prims.int = Prims.parse_int "2"
let flex_refine: Prims.int = Prims.parse_int "3"
let flex_rigid: Prims.int = Prims.parse_int "4"
let rigid_flex: Prims.int = Prims.parse_int "5"
let refine_flex: Prims.int = Prims.parse_int "6"
let flex_flex: Prims.int = Prims.parse_int "7"
let compress_tprob wl p =
<<<<<<< HEAD
  let uu___147_5414 = p in
  let uu____5417 = whnf wl.tcenv p.FStar_TypeChecker_Common.lhs in
  let uu____5418 = whnf wl.tcenv p.FStar_TypeChecker_Common.rhs in
  {
    FStar_TypeChecker_Common.pid =
      (uu___147_5414.FStar_TypeChecker_Common.pid);
    FStar_TypeChecker_Common.lhs = uu____5417;
    FStar_TypeChecker_Common.relation =
      (uu___147_5414.FStar_TypeChecker_Common.relation);
    FStar_TypeChecker_Common.rhs = uu____5418;
    FStar_TypeChecker_Common.element =
      (uu___147_5414.FStar_TypeChecker_Common.element);
    FStar_TypeChecker_Common.logical_guard =
      (uu___147_5414.FStar_TypeChecker_Common.logical_guard);
    FStar_TypeChecker_Common.scope =
      (uu___147_5414.FStar_TypeChecker_Common.scope);
    FStar_TypeChecker_Common.reason =
      (uu___147_5414.FStar_TypeChecker_Common.reason);
    FStar_TypeChecker_Common.loc =
      (uu___147_5414.FStar_TypeChecker_Common.loc);
    FStar_TypeChecker_Common.rank =
      (uu___147_5414.FStar_TypeChecker_Common.rank)
=======
  let uu___149_5530 = p in
  let uu____5533 = whnf wl.tcenv p.FStar_TypeChecker_Common.lhs in
  let uu____5534 = whnf wl.tcenv p.FStar_TypeChecker_Common.rhs in
  {
    FStar_TypeChecker_Common.pid =
      (uu___149_5530.FStar_TypeChecker_Common.pid);
    FStar_TypeChecker_Common.lhs = uu____5533;
    FStar_TypeChecker_Common.relation =
      (uu___149_5530.FStar_TypeChecker_Common.relation);
    FStar_TypeChecker_Common.rhs = uu____5534;
    FStar_TypeChecker_Common.element =
      (uu___149_5530.FStar_TypeChecker_Common.element);
    FStar_TypeChecker_Common.logical_guard =
      (uu___149_5530.FStar_TypeChecker_Common.logical_guard);
    FStar_TypeChecker_Common.scope =
      (uu___149_5530.FStar_TypeChecker_Common.scope);
    FStar_TypeChecker_Common.reason =
      (uu___149_5530.FStar_TypeChecker_Common.reason);
    FStar_TypeChecker_Common.loc =
      (uu___149_5530.FStar_TypeChecker_Common.loc);
    FStar_TypeChecker_Common.rank =
      (uu___149_5530.FStar_TypeChecker_Common.rank)
>>>>>>> origin/guido_tactics
  }
let compress_prob:
  worklist -> FStar_TypeChecker_Common.prob -> FStar_TypeChecker_Common.prob
  =
  fun wl  ->
    fun p  ->
      match p with
      | FStar_TypeChecker_Common.TProb p1 ->
<<<<<<< HEAD
          let uu____5428 = compress_tprob wl p1 in
          FStar_All.pipe_right uu____5428
            (fun _0_42  -> FStar_TypeChecker_Common.TProb _0_42)
      | FStar_TypeChecker_Common.CProb uu____5433 -> p
=======
          let uu____5546 = compress_tprob wl p1 in
          FStar_All.pipe_right uu____5546
            (fun _0_49  -> FStar_TypeChecker_Common.TProb _0_49)
      | FStar_TypeChecker_Common.CProb uu____5551 -> p
>>>>>>> origin/guido_tactics
let rank:
  worklist ->
    FStar_TypeChecker_Common.prob ->
      (Prims.int* FStar_TypeChecker_Common.prob)
  =
  fun wl  ->
    fun pr  ->
      let prob =
<<<<<<< HEAD
        let uu____5447 = compress_prob wl pr in
        FStar_All.pipe_right uu____5447 maybe_invert_p in
      match prob with
      | FStar_TypeChecker_Common.TProb tp ->
          let uu____5453 =
            FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.lhs in
          (match uu____5453 with
           | (lh,uu____5466) ->
               let uu____5481 =
                 FStar_Syntax_Util.head_and_args
                   tp.FStar_TypeChecker_Common.rhs in
               (match uu____5481 with
                | (rh,uu____5494) ->
                    let uu____5509 =
=======
        let uu____5567 = compress_prob wl pr in
        FStar_All.pipe_right uu____5567 maybe_invert_p in
      match prob with
      | FStar_TypeChecker_Common.TProb tp ->
          let uu____5573 =
            FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.lhs in
          (match uu____5573 with
           | (lh,uu____5586) ->
               let uu____5601 =
                 FStar_Syntax_Util.head_and_args
                   tp.FStar_TypeChecker_Common.rhs in
               (match uu____5601 with
                | (rh,uu____5614) ->
                    let uu____5629 =
>>>>>>> origin/guido_tactics
                      match ((lh.FStar_Syntax_Syntax.n),
                              (rh.FStar_Syntax_Syntax.n))
                      with
                      | (FStar_Syntax_Syntax.Tm_uvar
<<<<<<< HEAD
                         uu____5518,FStar_Syntax_Syntax.Tm_uvar uu____5519)
                          -> (flex_flex, tp)
                      | (FStar_Syntax_Syntax.Tm_uvar uu____5542,uu____5543)
=======
                         uu____5638,FStar_Syntax_Syntax.Tm_uvar uu____5639)
                          -> (flex_flex, tp)
                      | (FStar_Syntax_Syntax.Tm_uvar uu____5658,uu____5659)
>>>>>>> origin/guido_tactics
                          when
                          (tp.FStar_TypeChecker_Common.relation =
                             FStar_TypeChecker_Common.EQ)
                            || (FStar_Options.eager_inference ())
                          -> (flex_rigid_eq, tp)
<<<<<<< HEAD
                      | (uu____5556,FStar_Syntax_Syntax.Tm_uvar uu____5557)
=======
                      | (uu____5670,FStar_Syntax_Syntax.Tm_uvar uu____5671)
>>>>>>> origin/guido_tactics
                          when
                          (tp.FStar_TypeChecker_Common.relation =
                             FStar_TypeChecker_Common.EQ)
                            || (FStar_Options.eager_inference ())
                          -> (flex_rigid_eq, tp)
<<<<<<< HEAD
                      | (FStar_Syntax_Syntax.Tm_uvar uu____5570,uu____5571)
                          ->
                          let uu____5582 =
                            base_and_refinement wl.tcenv wl
                              tp.FStar_TypeChecker_Common.rhs in
                          (match uu____5582 with
                           | (b,ref_opt) ->
                               (match ref_opt with
                                | None  -> (flex_rigid, tp)
                                | uu____5622 ->
                                    let rank =
                                      let uu____5629 = is_top_level_prob prob in
                                      if uu____5629
                                      then flex_refine
                                      else flex_refine_inner in
                                    let uu____5631 =
                                      let uu___148_5634 = tp in
                                      let uu____5637 =
                                        force_refinement (b, ref_opt) in
                                      {
                                        FStar_TypeChecker_Common.pid =
                                          (uu___148_5634.FStar_TypeChecker_Common.pid);
                                        FStar_TypeChecker_Common.lhs =
                                          (uu___148_5634.FStar_TypeChecker_Common.lhs);
                                        FStar_TypeChecker_Common.relation =
                                          (uu___148_5634.FStar_TypeChecker_Common.relation);
                                        FStar_TypeChecker_Common.rhs =
                                          uu____5637;
                                        FStar_TypeChecker_Common.element =
                                          (uu___148_5634.FStar_TypeChecker_Common.element);
                                        FStar_TypeChecker_Common.logical_guard
                                          =
                                          (uu___148_5634.FStar_TypeChecker_Common.logical_guard);
                                        FStar_TypeChecker_Common.scope =
                                          (uu___148_5634.FStar_TypeChecker_Common.scope);
                                        FStar_TypeChecker_Common.reason =
                                          (uu___148_5634.FStar_TypeChecker_Common.reason);
                                        FStar_TypeChecker_Common.loc =
                                          (uu___148_5634.FStar_TypeChecker_Common.loc);
                                        FStar_TypeChecker_Common.rank =
                                          (uu___148_5634.FStar_TypeChecker_Common.rank)
                                      } in
                                    (rank, uu____5631)))
                      | (uu____5647,FStar_Syntax_Syntax.Tm_uvar uu____5648)
                          ->
                          let uu____5659 =
                            base_and_refinement wl.tcenv wl
                              tp.FStar_TypeChecker_Common.lhs in
                          (match uu____5659 with
                           | (b,ref_opt) ->
                               (match ref_opt with
                                | None  -> (rigid_flex, tp)
                                | uu____5699 ->
                                    let uu____5705 =
                                      let uu___149_5710 = tp in
                                      let uu____5713 =
                                        force_refinement (b, ref_opt) in
                                      {
                                        FStar_TypeChecker_Common.pid =
                                          (uu___149_5710.FStar_TypeChecker_Common.pid);
                                        FStar_TypeChecker_Common.lhs =
                                          uu____5713;
                                        FStar_TypeChecker_Common.relation =
                                          (uu___149_5710.FStar_TypeChecker_Common.relation);
                                        FStar_TypeChecker_Common.rhs =
                                          (uu___149_5710.FStar_TypeChecker_Common.rhs);
                                        FStar_TypeChecker_Common.element =
                                          (uu___149_5710.FStar_TypeChecker_Common.element);
                                        FStar_TypeChecker_Common.logical_guard
                                          =
                                          (uu___149_5710.FStar_TypeChecker_Common.logical_guard);
                                        FStar_TypeChecker_Common.scope =
                                          (uu___149_5710.FStar_TypeChecker_Common.scope);
                                        FStar_TypeChecker_Common.reason =
                                          (uu___149_5710.FStar_TypeChecker_Common.reason);
                                        FStar_TypeChecker_Common.loc =
                                          (uu___149_5710.FStar_TypeChecker_Common.loc);
                                        FStar_TypeChecker_Common.rank =
                                          (uu___149_5710.FStar_TypeChecker_Common.rank)
                                      } in
                                    (refine_flex, uu____5705)))
                      | (uu____5729,uu____5730) -> (rigid_rigid, tp) in
                    (match uu____5509 with
                     | (rank,tp1) ->
                         let uu____5741 =
                           FStar_All.pipe_right
                             (let uu___150_5745 = tp1 in
                              {
                                FStar_TypeChecker_Common.pid =
                                  (uu___150_5745.FStar_TypeChecker_Common.pid);
                                FStar_TypeChecker_Common.lhs =
                                  (uu___150_5745.FStar_TypeChecker_Common.lhs);
                                FStar_TypeChecker_Common.relation =
                                  (uu___150_5745.FStar_TypeChecker_Common.relation);
                                FStar_TypeChecker_Common.rhs =
                                  (uu___150_5745.FStar_TypeChecker_Common.rhs);
                                FStar_TypeChecker_Common.element =
                                  (uu___150_5745.FStar_TypeChecker_Common.element);
                                FStar_TypeChecker_Common.logical_guard =
                                  (uu___150_5745.FStar_TypeChecker_Common.logical_guard);
                                FStar_TypeChecker_Common.scope =
                                  (uu___150_5745.FStar_TypeChecker_Common.scope);
                                FStar_TypeChecker_Common.reason =
                                  (uu___150_5745.FStar_TypeChecker_Common.reason);
                                FStar_TypeChecker_Common.loc =
                                  (uu___150_5745.FStar_TypeChecker_Common.loc);
                                FStar_TypeChecker_Common.rank = (Some rank)
                              })
                             (fun _0_43  ->
                                FStar_TypeChecker_Common.TProb _0_43) in
                         (rank, uu____5741))))
      | FStar_TypeChecker_Common.CProb cp ->
          let uu____5751 =
            FStar_All.pipe_right
              (let uu___151_5755 = cp in
               {
                 FStar_TypeChecker_Common.pid =
                   (uu___151_5755.FStar_TypeChecker_Common.pid);
                 FStar_TypeChecker_Common.lhs =
                   (uu___151_5755.FStar_TypeChecker_Common.lhs);
                 FStar_TypeChecker_Common.relation =
                   (uu___151_5755.FStar_TypeChecker_Common.relation);
                 FStar_TypeChecker_Common.rhs =
                   (uu___151_5755.FStar_TypeChecker_Common.rhs);
                 FStar_TypeChecker_Common.element =
                   (uu___151_5755.FStar_TypeChecker_Common.element);
                 FStar_TypeChecker_Common.logical_guard =
                   (uu___151_5755.FStar_TypeChecker_Common.logical_guard);
                 FStar_TypeChecker_Common.scope =
                   (uu___151_5755.FStar_TypeChecker_Common.scope);
                 FStar_TypeChecker_Common.reason =
                   (uu___151_5755.FStar_TypeChecker_Common.reason);
                 FStar_TypeChecker_Common.loc =
                   (uu___151_5755.FStar_TypeChecker_Common.loc);
                 FStar_TypeChecker_Common.rank = (Some rigid_rigid)
               }) (fun _0_44  -> FStar_TypeChecker_Common.CProb _0_44) in
          (rigid_rigid, uu____5751)
=======
                      | (FStar_Syntax_Syntax.Tm_uvar uu____5682,uu____5683)
                          ->
                          let uu____5692 =
                            base_and_refinement wl.tcenv wl
                              tp.FStar_TypeChecker_Common.rhs in
                          (match uu____5692 with
                           | (b,ref_opt) ->
                               (match ref_opt with
                                | None  -> (flex_rigid, tp)
                                | uu____5732 ->
                                    let rank =
                                      let uu____5739 = is_top_level_prob prob in
                                      if uu____5739
                                      then flex_refine
                                      else flex_refine_inner in
                                    let uu____5741 =
                                      let uu___150_5744 = tp in
                                      let uu____5747 =
                                        force_refinement (b, ref_opt) in
                                      {
                                        FStar_TypeChecker_Common.pid =
                                          (uu___150_5744.FStar_TypeChecker_Common.pid);
                                        FStar_TypeChecker_Common.lhs =
                                          (uu___150_5744.FStar_TypeChecker_Common.lhs);
                                        FStar_TypeChecker_Common.relation =
                                          (uu___150_5744.FStar_TypeChecker_Common.relation);
                                        FStar_TypeChecker_Common.rhs =
                                          uu____5747;
                                        FStar_TypeChecker_Common.element =
                                          (uu___150_5744.FStar_TypeChecker_Common.element);
                                        FStar_TypeChecker_Common.logical_guard
                                          =
                                          (uu___150_5744.FStar_TypeChecker_Common.logical_guard);
                                        FStar_TypeChecker_Common.scope =
                                          (uu___150_5744.FStar_TypeChecker_Common.scope);
                                        FStar_TypeChecker_Common.reason =
                                          (uu___150_5744.FStar_TypeChecker_Common.reason);
                                        FStar_TypeChecker_Common.loc =
                                          (uu___150_5744.FStar_TypeChecker_Common.loc);
                                        FStar_TypeChecker_Common.rank =
                                          (uu___150_5744.FStar_TypeChecker_Common.rank)
                                      } in
                                    (rank, uu____5741)))
                      | (uu____5757,FStar_Syntax_Syntax.Tm_uvar uu____5758)
                          ->
                          let uu____5767 =
                            base_and_refinement wl.tcenv wl
                              tp.FStar_TypeChecker_Common.lhs in
                          (match uu____5767 with
                           | (b,ref_opt) ->
                               (match ref_opt with
                                | None  -> (rigid_flex, tp)
                                | uu____5807 ->
                                    let uu____5813 =
                                      let uu___151_5818 = tp in
                                      let uu____5821 =
                                        force_refinement (b, ref_opt) in
                                      {
                                        FStar_TypeChecker_Common.pid =
                                          (uu___151_5818.FStar_TypeChecker_Common.pid);
                                        FStar_TypeChecker_Common.lhs =
                                          uu____5821;
                                        FStar_TypeChecker_Common.relation =
                                          (uu___151_5818.FStar_TypeChecker_Common.relation);
                                        FStar_TypeChecker_Common.rhs =
                                          (uu___151_5818.FStar_TypeChecker_Common.rhs);
                                        FStar_TypeChecker_Common.element =
                                          (uu___151_5818.FStar_TypeChecker_Common.element);
                                        FStar_TypeChecker_Common.logical_guard
                                          =
                                          (uu___151_5818.FStar_TypeChecker_Common.logical_guard);
                                        FStar_TypeChecker_Common.scope =
                                          (uu___151_5818.FStar_TypeChecker_Common.scope);
                                        FStar_TypeChecker_Common.reason =
                                          (uu___151_5818.FStar_TypeChecker_Common.reason);
                                        FStar_TypeChecker_Common.loc =
                                          (uu___151_5818.FStar_TypeChecker_Common.loc);
                                        FStar_TypeChecker_Common.rank =
                                          (uu___151_5818.FStar_TypeChecker_Common.rank)
                                      } in
                                    (refine_flex, uu____5813)))
                      | (uu____5837,uu____5838) -> (rigid_rigid, tp) in
                    (match uu____5629 with
                     | (rank,tp1) ->
                         let uu____5849 =
                           FStar_All.pipe_right
                             (let uu___152_5852 = tp1 in
                              {
                                FStar_TypeChecker_Common.pid =
                                  (uu___152_5852.FStar_TypeChecker_Common.pid);
                                FStar_TypeChecker_Common.lhs =
                                  (uu___152_5852.FStar_TypeChecker_Common.lhs);
                                FStar_TypeChecker_Common.relation =
                                  (uu___152_5852.FStar_TypeChecker_Common.relation);
                                FStar_TypeChecker_Common.rhs =
                                  (uu___152_5852.FStar_TypeChecker_Common.rhs);
                                FStar_TypeChecker_Common.element =
                                  (uu___152_5852.FStar_TypeChecker_Common.element);
                                FStar_TypeChecker_Common.logical_guard =
                                  (uu___152_5852.FStar_TypeChecker_Common.logical_guard);
                                FStar_TypeChecker_Common.scope =
                                  (uu___152_5852.FStar_TypeChecker_Common.scope);
                                FStar_TypeChecker_Common.reason =
                                  (uu___152_5852.FStar_TypeChecker_Common.reason);
                                FStar_TypeChecker_Common.loc =
                                  (uu___152_5852.FStar_TypeChecker_Common.loc);
                                FStar_TypeChecker_Common.rank = (Some rank)
                              })
                             (fun _0_50  ->
                                FStar_TypeChecker_Common.TProb _0_50) in
                         (rank, uu____5849))))
      | FStar_TypeChecker_Common.CProb cp ->
          let uu____5858 =
            FStar_All.pipe_right
              (let uu___153_5861 = cp in
               {
                 FStar_TypeChecker_Common.pid =
                   (uu___153_5861.FStar_TypeChecker_Common.pid);
                 FStar_TypeChecker_Common.lhs =
                   (uu___153_5861.FStar_TypeChecker_Common.lhs);
                 FStar_TypeChecker_Common.relation =
                   (uu___153_5861.FStar_TypeChecker_Common.relation);
                 FStar_TypeChecker_Common.rhs =
                   (uu___153_5861.FStar_TypeChecker_Common.rhs);
                 FStar_TypeChecker_Common.element =
                   (uu___153_5861.FStar_TypeChecker_Common.element);
                 FStar_TypeChecker_Common.logical_guard =
                   (uu___153_5861.FStar_TypeChecker_Common.logical_guard);
                 FStar_TypeChecker_Common.scope =
                   (uu___153_5861.FStar_TypeChecker_Common.scope);
                 FStar_TypeChecker_Common.reason =
                   (uu___153_5861.FStar_TypeChecker_Common.reason);
                 FStar_TypeChecker_Common.loc =
                   (uu___153_5861.FStar_TypeChecker_Common.loc);
                 FStar_TypeChecker_Common.rank = (Some rigid_rigid)
               }) (fun _0_51  -> FStar_TypeChecker_Common.CProb _0_51) in
          (rigid_rigid, uu____5858)
>>>>>>> origin/guido_tactics
let next_prob:
  worklist ->
    (FStar_TypeChecker_Common.prob option* FStar_TypeChecker_Common.prob
      Prims.list* Prims.int)
  =
  fun wl  ->
<<<<<<< HEAD
    let rec aux uu____5787 probs =
      match uu____5787 with
=======
    let rec aux uu____5894 probs =
      match uu____5894 with
>>>>>>> origin/guido_tactics
      | (min_rank,min1,out) ->
          (match probs with
           | [] -> (min1, out, min_rank)
           | hd1::tl1 ->
<<<<<<< HEAD
               let uu____5817 = rank wl hd1 in
               (match uu____5817 with
=======
               let uu____5924 = rank wl hd1 in
               (match uu____5924 with
>>>>>>> origin/guido_tactics
                | (rank1,hd2) ->
                    if rank1 <= flex_rigid_eq
                    then
                      (match min1 with
                       | None  ->
                           ((Some hd2), (FStar_List.append out tl1), rank1)
                       | Some m ->
                           ((Some hd2), (FStar_List.append out (m :: tl1)),
                             rank1))
                    else
                      if rank1 < min_rank
                      then
                        (match min1 with
                         | None  -> aux (rank1, (Some hd2), out) tl1
                         | Some m -> aux (rank1, (Some hd2), (m :: out)) tl1)
                      else aux (min_rank, min1, (hd2 :: out)) tl1)) in
    aux ((flex_flex + (Prims.parse_int "1")), None, []) wl.attempting
let is_flex_rigid: Prims.int -> Prims.bool =
  fun rank1  -> (flex_refine_inner <= rank1) && (rank1 <= flex_rigid)
let is_rigid_flex: Prims.int -> Prims.bool =
  fun rank1  -> (rigid_flex <= rank1) && (rank1 <= refine_flex)
type univ_eq_sol =
  | UDeferred of worklist
  | USolved of worklist
  | UFailed of Prims.string
let uu___is_UDeferred: univ_eq_sol -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | UDeferred _0 -> true | uu____5885 -> false
=======
    match projectee with | UDeferred _0 -> true | uu____5995 -> false
>>>>>>> origin/guido_tactics
let __proj__UDeferred__item___0: univ_eq_sol -> worklist =
  fun projectee  -> match projectee with | UDeferred _0 -> _0
let uu___is_USolved: univ_eq_sol -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | USolved _0 -> true | uu____5897 -> false
=======
    match projectee with | USolved _0 -> true | uu____6009 -> false
>>>>>>> origin/guido_tactics
let __proj__USolved__item___0: univ_eq_sol -> worklist =
  fun projectee  -> match projectee with | USolved _0 -> _0
let uu___is_UFailed: univ_eq_sol -> Prims.bool =
  fun projectee  ->
<<<<<<< HEAD
    match projectee with | UFailed _0 -> true | uu____5909 -> false
=======
    match projectee with | UFailed _0 -> true | uu____6023 -> false
>>>>>>> origin/guido_tactics
let __proj__UFailed__item___0: univ_eq_sol -> Prims.string =
  fun projectee  -> match projectee with | UFailed _0 -> _0
let rec really_solve_universe_eq:
  Prims.int ->
    worklist ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.universe -> univ_eq_sol
  =
  fun pid_orig  ->
    fun wl  ->
      fun u1  ->
        fun u2  ->
          let u11 =
            FStar_TypeChecker_Normalize.normalize_universe wl.tcenv u1 in
          let u21 =
            FStar_TypeChecker_Normalize.normalize_universe wl.tcenv u2 in
          let rec occurs_univ v1 u =
            match u with
            | FStar_Syntax_Syntax.U_max us ->
                FStar_All.pipe_right us
                  (FStar_Util.for_some
                     (fun u3  ->
<<<<<<< HEAD
                        let uu____5947 = FStar_Syntax_Util.univ_kernel u3 in
                        match uu____5947 with
                        | (k,uu____5951) ->
                            (match k with
                             | FStar_Syntax_Syntax.U_unif v2 ->
                                 FStar_Syntax_Unionfind.univ_equiv v1 v2
                             | uu____5957 -> false)))
            | uu____5958 -> occurs_univ v1 (FStar_Syntax_Syntax.U_max [u]) in
=======
                        let uu____6061 = FStar_Syntax_Util.univ_kernel u3 in
                        match uu____6061 with
                        | (k,uu____6065) ->
                            (match k with
                             | FStar_Syntax_Syntax.U_unif v2 ->
                                 FStar_Syntax_Unionfind.univ_equiv v1 v2
                             | uu____6069 -> false)))
            | uu____6070 -> occurs_univ v1 (FStar_Syntax_Syntax.U_max [u]) in
>>>>>>> origin/guido_tactics
          let try_umax_components u12 u22 msg =
            match (u12, u22) with
            | (FStar_Syntax_Syntax.U_max us1,FStar_Syntax_Syntax.U_max us2)
                ->
                if (FStar_List.length us1) = (FStar_List.length us2)
                then
                  let rec aux wl1 us11 us21 =
                    match (us11, us21) with
                    | (u13::us12,u23::us22) ->
<<<<<<< HEAD
                        let uu____6001 =
                          really_solve_universe_eq pid_orig wl1 u13 u23 in
                        (match uu____6001 with
                         | USolved wl2 -> aux wl2 us12 us22
                         | failed -> failed)
                    | uu____6004 -> USolved wl1 in
                  aux wl us1 us2
                else
                  (let uu____6010 =
                     let uu____6011 = FStar_Syntax_Print.univ_to_string u12 in
                     let uu____6012 = FStar_Syntax_Print.univ_to_string u22 in
                     FStar_Util.format2
                       "Unable to unify universes: %s and %s" uu____6011
                       uu____6012 in
                   UFailed uu____6010)
=======
                        let uu____6117 =
                          really_solve_universe_eq pid_orig wl1 u13 u23 in
                        (match uu____6117 with
                         | USolved wl2 -> aux wl2 us12 us22
                         | failed -> failed)
                    | uu____6120 -> USolved wl1 in
                  aux wl us1 us2
                else
                  (let uu____6126 =
                     let uu____6127 = FStar_Syntax_Print.univ_to_string u12 in
                     let uu____6128 = FStar_Syntax_Print.univ_to_string u22 in
                     FStar_Util.format2
                       "Unable to unify universes: %s and %s" uu____6127
                       uu____6128 in
                   UFailed uu____6126)
>>>>>>> origin/guido_tactics
            | (FStar_Syntax_Syntax.U_max us,u') ->
                let rec aux wl1 us1 =
                  match us1 with
                  | [] -> USolved wl1
                  | u::us2 ->
<<<<<<< HEAD
                      let uu____6028 =
                        really_solve_universe_eq pid_orig wl1 u u' in
                      (match uu____6028 with
=======
                      let uu____6144 =
                        really_solve_universe_eq pid_orig wl1 u u' in
                      (match uu____6144 with
>>>>>>> origin/guido_tactics
                       | USolved wl2 -> aux wl2 us2
                       | failed -> failed) in
                aux wl us
            | (u',FStar_Syntax_Syntax.U_max us) ->
                let rec aux wl1 us1 =
                  match us1 with
                  | [] -> USolved wl1
                  | u::us2 ->
<<<<<<< HEAD
                      let uu____6046 =
                        really_solve_universe_eq pid_orig wl1 u u' in
                      (match uu____6046 with
                       | USolved wl2 -> aux wl2 us2
                       | failed -> failed) in
                aux wl us
            | uu____6049 ->
                let uu____6052 =
                  let uu____6053 = FStar_Syntax_Print.univ_to_string u12 in
                  let uu____6054 = FStar_Syntax_Print.univ_to_string u22 in
                  FStar_Util.format3
                    "Unable to unify universes: %s and %s (%s)" uu____6053
                    uu____6054 msg in
                UFailed uu____6052 in
          match (u11, u21) with
          | (FStar_Syntax_Syntax.U_bvar uu____6055,uu____6056) ->
              let uu____6057 =
                let uu____6058 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6059 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6058 uu____6059 in
              failwith uu____6057
          | (FStar_Syntax_Syntax.U_unknown ,uu____6060) ->
              let uu____6061 =
                let uu____6062 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6063 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6062 uu____6063 in
              failwith uu____6061
          | (uu____6064,FStar_Syntax_Syntax.U_bvar uu____6065) ->
              let uu____6066 =
                let uu____6067 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6068 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6067 uu____6068 in
              failwith uu____6066
          | (uu____6069,FStar_Syntax_Syntax.U_unknown ) ->
              let uu____6070 =
                let uu____6071 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6072 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6071 uu____6072 in
              failwith uu____6070
=======
                      let uu____6162 =
                        really_solve_universe_eq pid_orig wl1 u u' in
                      (match uu____6162 with
                       | USolved wl2 -> aux wl2 us2
                       | failed -> failed) in
                aux wl us
            | uu____6165 ->
                let uu____6168 =
                  let uu____6169 = FStar_Syntax_Print.univ_to_string u12 in
                  let uu____6170 = FStar_Syntax_Print.univ_to_string u22 in
                  FStar_Util.format3
                    "Unable to unify universes: %s and %s (%s)" uu____6169
                    uu____6170 msg in
                UFailed uu____6168 in
          match (u11, u21) with
          | (FStar_Syntax_Syntax.U_bvar uu____6171,uu____6172) ->
              let uu____6173 =
                let uu____6174 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6175 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6174 uu____6175 in
              failwith uu____6173
          | (FStar_Syntax_Syntax.U_unknown ,uu____6176) ->
              let uu____6177 =
                let uu____6178 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6179 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6178 uu____6179 in
              failwith uu____6177
          | (uu____6180,FStar_Syntax_Syntax.U_bvar uu____6181) ->
              let uu____6182 =
                let uu____6183 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6184 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6183 uu____6184 in
              failwith uu____6182
          | (uu____6185,FStar_Syntax_Syntax.U_unknown ) ->
              let uu____6186 =
                let uu____6187 = FStar_Syntax_Print.univ_to_string u11 in
                let uu____6188 = FStar_Syntax_Print.univ_to_string u21 in
                FStar_Util.format2
                  "Impossible: found an de Bruijn universe variable or unknown universe: %s, %s"
                  uu____6187 uu____6188 in
              failwith uu____6186
>>>>>>> origin/guido_tactics
          | (FStar_Syntax_Syntax.U_name x,FStar_Syntax_Syntax.U_name y) ->
              if x.FStar_Ident.idText = y.FStar_Ident.idText
              then USolved wl
              else UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_zero ) ->
              USolved wl
          | (FStar_Syntax_Syntax.U_succ u12,FStar_Syntax_Syntax.U_succ u22)
              -> really_solve_universe_eq pid_orig wl u12 u22
          | (FStar_Syntax_Syntax.U_unif v1,FStar_Syntax_Syntax.U_unif v2) ->
<<<<<<< HEAD
              let uu____6088 = FStar_Syntax_Unionfind.univ_equiv v1 v2 in
              if uu____6088
=======
              let uu____6200 = FStar_Syntax_Unionfind.univ_equiv v1 v2 in
              if uu____6200
>>>>>>> origin/guido_tactics
              then USolved wl
              else
                (let wl1 = extend_solution pid_orig [UNIV (v1, u21)] wl in
                 USolved wl1)
          | (FStar_Syntax_Syntax.U_unif v1,u) ->
              let u3 = norm_univ wl u in
<<<<<<< HEAD
              let uu____6102 = occurs_univ v1 u3 in
              if uu____6102
              then
                let uu____6103 =
                  let uu____6104 =
                    FStar_Syntax_Print.univ_to_string
                      (FStar_Syntax_Syntax.U_unif v1) in
                  let uu____6105 = FStar_Syntax_Print.univ_to_string u3 in
                  FStar_Util.format2 "Failed occurs check: %s occurs in %s"
                    uu____6104 uu____6105 in
                try_umax_components u11 u21 uu____6103
              else
                (let uu____6107 = extend_solution pid_orig [UNIV (v1, u3)] wl in
                 USolved uu____6107)
          | (u,FStar_Syntax_Syntax.U_unif v1) ->
              let u3 = norm_univ wl u in
              let uu____6119 = occurs_univ v1 u3 in
              if uu____6119
              then
                let uu____6120 =
                  let uu____6121 =
                    FStar_Syntax_Print.univ_to_string
                      (FStar_Syntax_Syntax.U_unif v1) in
                  let uu____6122 = FStar_Syntax_Print.univ_to_string u3 in
                  FStar_Util.format2 "Failed occurs check: %s occurs in %s"
                    uu____6121 uu____6122 in
                try_umax_components u11 u21 uu____6120
              else
                (let uu____6124 = extend_solution pid_orig [UNIV (v1, u3)] wl in
                 USolved uu____6124)
          | (FStar_Syntax_Syntax.U_max uu____6129,uu____6130) ->
=======
              let uu____6210 = occurs_univ v1 u3 in
              if uu____6210
              then
                let uu____6211 =
                  let uu____6212 =
                    FStar_Syntax_Print.univ_to_string
                      (FStar_Syntax_Syntax.U_unif v1) in
                  let uu____6213 = FStar_Syntax_Print.univ_to_string u3 in
                  FStar_Util.format2 "Failed occurs check: %s occurs in %s"
                    uu____6212 uu____6213 in
                try_umax_components u11 u21 uu____6211
              else
                (let uu____6215 = extend_solution pid_orig [UNIV (v1, u3)] wl in
                 USolved uu____6215)
          | (u,FStar_Syntax_Syntax.U_unif v1) ->
              let u3 = norm_univ wl u in
              let uu____6223 = occurs_univ v1 u3 in
              if uu____6223
              then
                let uu____6224 =
                  let uu____6225 =
                    FStar_Syntax_Print.univ_to_string
                      (FStar_Syntax_Syntax.U_unif v1) in
                  let uu____6226 = FStar_Syntax_Print.univ_to_string u3 in
                  FStar_Util.format2 "Failed occurs check: %s occurs in %s"
                    uu____6225 uu____6226 in
                try_umax_components u11 u21 uu____6224
              else
                (let uu____6228 = extend_solution pid_orig [UNIV (v1, u3)] wl in
                 USolved uu____6228)
          | (FStar_Syntax_Syntax.U_max uu____6231,uu____6232) ->
>>>>>>> origin/guido_tactics
              if wl.defer_ok
              then UDeferred wl
              else
                (let u12 = norm_univ wl u11 in
                 let u22 = norm_univ wl u21 in
<<<<<<< HEAD
                 let uu____6135 = FStar_Syntax_Util.eq_univs u12 u22 in
                 if uu____6135
                 then USolved wl
                 else try_umax_components u12 u22 "")
          | (uu____6137,FStar_Syntax_Syntax.U_max uu____6138) ->
=======
                 let uu____6237 = FStar_Syntax_Util.eq_univs u12 u22 in
                 if uu____6237
                 then USolved wl
                 else try_umax_components u12 u22 "")
          | (uu____6239,FStar_Syntax_Syntax.U_max uu____6240) ->
>>>>>>> origin/guido_tactics
              if wl.defer_ok
              then UDeferred wl
              else
                (let u12 = norm_univ wl u11 in
                 let u22 = norm_univ wl u21 in
<<<<<<< HEAD
                 let uu____6143 = FStar_Syntax_Util.eq_univs u12 u22 in
                 if uu____6143
                 then USolved wl
                 else try_umax_components u12 u22 "")
          | (FStar_Syntax_Syntax.U_succ uu____6145,FStar_Syntax_Syntax.U_zero
             ) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_succ uu____6146,FStar_Syntax_Syntax.U_name
             uu____6147) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_succ
             uu____6148) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_name
             uu____6149) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_name uu____6150,FStar_Syntax_Syntax.U_succ
             uu____6151) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_name uu____6152,FStar_Syntax_Syntax.U_zero
=======
                 let uu____6245 = FStar_Syntax_Util.eq_univs u12 u22 in
                 if uu____6245
                 then USolved wl
                 else try_umax_components u12 u22 "")
          | (FStar_Syntax_Syntax.U_succ uu____6247,FStar_Syntax_Syntax.U_zero
             ) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_succ uu____6248,FStar_Syntax_Syntax.U_name
             uu____6249) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_succ
             uu____6250) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_zero ,FStar_Syntax_Syntax.U_name
             uu____6251) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_name uu____6252,FStar_Syntax_Syntax.U_succ
             uu____6253) -> UFailed "Incompatible universes"
          | (FStar_Syntax_Syntax.U_name uu____6254,FStar_Syntax_Syntax.U_zero
>>>>>>> origin/guido_tactics
             ) -> UFailed "Incompatible universes"
let solve_universe_eq:
  Prims.int ->
    worklist ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.universe -> univ_eq_sol
  =
  fun orig  ->
    fun wl  ->
      fun u1  ->
        fun u2  ->
          if (wl.tcenv).FStar_TypeChecker_Env.lax_universes
          then USolved wl
          else really_solve_universe_eq orig wl u1 u2
let match_num_binders bc1 bc2 =
<<<<<<< HEAD
  let uu____6214 = bc1 in
  match uu____6214 with
  | (bs1,mk_cod1) ->
      let uu____6239 = bc2 in
      (match uu____6239 with
       | (bs2,mk_cod2) ->
           let curry n1 bs mk_cod =
             let uu____6286 = FStar_Util.first_N n1 bs in
             match uu____6286 with
             | (bs3,rest) ->
                 let uu____6300 = mk_cod rest in (bs3, uu____6300) in
=======
  let uu____6324 = bc1 in
  match uu____6324 with
  | (bs1,mk_cod1) ->
      let uu____6349 = bc2 in
      (match uu____6349 with
       | (bs2,mk_cod2) ->
           let curry n1 bs mk_cod =
             let uu____6396 = FStar_Util.first_N n1 bs in
             match uu____6396 with
             | (bs3,rest) ->
                 let uu____6410 = mk_cod rest in (bs3, uu____6410) in
>>>>>>> origin/guido_tactics
           let l1 = FStar_List.length bs1 in
           let l2 = FStar_List.length bs2 in
           if l1 = l2
           then
<<<<<<< HEAD
             let uu____6318 =
               let uu____6322 = mk_cod1 [] in (bs1, uu____6322) in
             let uu____6324 =
               let uu____6328 = mk_cod2 [] in (bs2, uu____6328) in
             (uu____6318, uu____6324)
           else
             if l1 > l2
             then
               (let uu____6350 = curry l2 bs1 mk_cod1 in
                let uu____6357 =
                  let uu____6361 = mk_cod2 [] in (bs2, uu____6361) in
                (uu____6350, uu____6357))
             else
               (let uu____6370 =
                  let uu____6374 = mk_cod1 [] in (bs1, uu____6374) in
                let uu____6376 = curry l1 bs2 mk_cod2 in
                (uu____6370, uu____6376)))
let rec solve: FStar_TypeChecker_Env.env -> worklist -> solution =
  fun env  ->
    fun probs  ->
      (let uu____6480 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "RelCheck") in
       if uu____6480
       then
         let uu____6481 = wl_to_string probs in
         FStar_Util.print1 "solve:\n\t%s\n" uu____6481
       else ());
      (let uu____6483 = next_prob probs in
       match uu____6483 with
       | (Some hd1,tl1,rank1) ->
           let probs1 =
             let uu___152_6496 = probs in
             {
               attempting = tl1;
               wl_deferred = (uu___152_6496.wl_deferred);
               ctr = (uu___152_6496.ctr);
               defer_ok = (uu___152_6496.defer_ok);
               smt_ok = (uu___152_6496.smt_ok);
               tcenv = (uu___152_6496.tcenv)
=======
             let uu____6434 =
               let uu____6438 = mk_cod1 [] in (bs1, uu____6438) in
             let uu____6440 =
               let uu____6444 = mk_cod2 [] in (bs2, uu____6444) in
             (uu____6434, uu____6440)
           else
             if l1 > l2
             then
               (let uu____6471 = curry l2 bs1 mk_cod1 in
                let uu____6481 =
                  let uu____6485 = mk_cod2 [] in (bs2, uu____6485) in
                (uu____6471, uu____6481))
             else
               (let uu____6494 =
                  let uu____6498 = mk_cod1 [] in (bs1, uu____6498) in
                let uu____6500 = curry l1 bs2 mk_cod2 in
                (uu____6494, uu____6500)))
let rec solve: FStar_TypeChecker_Env.env -> worklist -> solution =
  fun env  ->
    fun probs  ->
      (let uu____6607 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "RelCheck") in
       if uu____6607
       then
         let uu____6608 = wl_to_string probs in
         FStar_Util.print1 "solve:\n\t%s\n" uu____6608
       else ());
      (let uu____6610 = next_prob probs in
       match uu____6610 with
       | (Some hd1,tl1,rank1) ->
           let probs1 =
             let uu___154_6623 = probs in
             {
               attempting = tl1;
               wl_deferred = (uu___154_6623.wl_deferred);
               ctr = (uu___154_6623.ctr);
               defer_ok = (uu___154_6623.defer_ok);
               smt_ok = (uu___154_6623.smt_ok);
               tcenv = (uu___154_6623.tcenv)
>>>>>>> origin/guido_tactics
             } in
           (match hd1 with
            | FStar_TypeChecker_Common.CProb cp ->
                solve_c env (maybe_invert cp) probs1
            | FStar_TypeChecker_Common.TProb tp ->
                if
                  ((Prims.op_Negation probs1.defer_ok) &&
                     (flex_refine_inner <= rank1))
                    && (rank1 <= flex_rigid)
                then
<<<<<<< HEAD
                  let uu____6503 = solve_flex_rigid_join env tp probs1 in
                  (match uu____6503 with
=======
                  let uu____6630 = solve_flex_rigid_join env tp probs1 in
                  (match uu____6630 with
>>>>>>> origin/guido_tactics
                   | None  -> solve_t' env (maybe_invert tp) probs1
                   | Some wl -> solve env wl)
                else
                  if
                    ((Prims.op_Negation probs1.defer_ok) &&
                       (rigid_flex <= rank1))
                      && (rank1 <= refine_flex)
                  then
<<<<<<< HEAD
                    (let uu____6507 = solve_rigid_flex_meet env tp probs1 in
                     match uu____6507 with
                     | None  -> solve_t' env (maybe_invert tp) probs1
                     | Some wl -> solve env wl)
                  else solve_t' env (maybe_invert tp) probs1)
       | (None ,uu____6511,uu____6512) ->
           (match probs.wl_deferred with
            | [] -> Success []
            | uu____6521 ->
                let uu____6526 =
                  FStar_All.pipe_right probs.wl_deferred
                    (FStar_List.partition
                       (fun uu____6558  ->
                          match uu____6558 with
                          | (c,uu____6563,uu____6564) -> c < probs.ctr)) in
                (match uu____6526 with
                 | (attempt1,rest) ->
                     (match attempt1 with
                      | [] ->
                          let uu____6586 =
                            FStar_List.map
                              (fun uu____6596  ->
                                 match uu____6596 with
                                 | (uu____6602,x,y) -> (x, y))
                              probs.wl_deferred in
                          Success uu____6586
                      | uu____6605 ->
                          let uu____6610 =
                            let uu___153_6611 = probs in
                            let uu____6612 =
                              FStar_All.pipe_right attempt1
                                (FStar_List.map
                                   (fun uu____6625  ->
                                      match uu____6625 with
                                      | (uu____6629,uu____6630,y) -> y)) in
                            {
                              attempting = uu____6612;
                              wl_deferred = rest;
                              ctr = (uu___153_6611.ctr);
                              defer_ok = (uu___153_6611.defer_ok);
                              smt_ok = (uu___153_6611.smt_ok);
                              tcenv = (uu___153_6611.tcenv)
                            } in
                          solve env uu____6610))))
=======
                    (let uu____6634 = solve_rigid_flex_meet env tp probs1 in
                     match uu____6634 with
                     | None  -> solve_t' env (maybe_invert tp) probs1
                     | Some wl -> solve env wl)
                  else solve_t' env (maybe_invert tp) probs1)
       | (None ,uu____6638,uu____6639) ->
           (match probs.wl_deferred with
            | [] -> Success []
            | uu____6648 ->
                let uu____6653 =
                  FStar_All.pipe_right probs.wl_deferred
                    (FStar_List.partition
                       (fun uu____6681  ->
                          match uu____6681 with
                          | (c,uu____6686,uu____6687) -> c < probs.ctr)) in
                (match uu____6653 with
                 | (attempt1,rest) ->
                     (match attempt1 with
                      | [] ->
                          let uu____6709 =
                            FStar_List.map
                              (fun uu____6715  ->
                                 match uu____6715 with
                                 | (uu____6721,x,y) -> (x, y))
                              probs.wl_deferred in
                          Success uu____6709
                      | uu____6724 ->
                          let uu____6729 =
                            let uu___155_6730 = probs in
                            let uu____6731 =
                              FStar_All.pipe_right attempt1
                                (FStar_List.map
                                   (fun uu____6740  ->
                                      match uu____6740 with
                                      | (uu____6744,uu____6745,y) -> y)) in
                            {
                              attempting = uu____6731;
                              wl_deferred = rest;
                              ctr = (uu___155_6730.ctr);
                              defer_ok = (uu___155_6730.defer_ok);
                              smt_ok = (uu___155_6730.smt_ok);
                              tcenv = (uu___155_6730.tcenv)
                            } in
                          solve env uu____6729))))
>>>>>>> origin/guido_tactics
and solve_one_universe_eq:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.universe ->
        FStar_Syntax_Syntax.universe -> worklist -> solution
  =
  fun env  ->
    fun orig  ->
      fun u1  ->
        fun u2  ->
          fun wl  ->
<<<<<<< HEAD
            let uu____6637 = solve_universe_eq (p_pid orig) wl u1 u2 in
            match uu____6637 with
            | USolved wl1 ->
                let uu____6639 = solve_prob orig None [] wl1 in
                solve env uu____6639
=======
            let uu____6752 = solve_universe_eq (p_pid orig) wl u1 u2 in
            match uu____6752 with
            | USolved wl1 ->
                let uu____6754 = solve_prob orig None [] wl1 in
                solve env uu____6754
>>>>>>> origin/guido_tactics
            | UFailed msg -> giveup env msg orig
            | UDeferred wl1 -> solve env (defer "" orig wl1)
and solve_maybe_uinsts:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.term -> worklist -> univ_eq_sol
  =
  fun env  ->
    fun orig  ->
      fun t1  ->
        fun t2  ->
          fun wl  ->
            let rec aux wl1 us1 us2 =
              match (us1, us2) with
              | ([],[]) -> USolved wl1
              | (u1::us11,u2::us21) ->
<<<<<<< HEAD
                  let uu____6673 = solve_universe_eq (p_pid orig) wl1 u1 u2 in
                  (match uu____6673 with
                   | USolved wl2 -> aux wl2 us11 us21
                   | failed_or_deferred -> failed_or_deferred)
              | uu____6676 -> UFailed "Unequal number of universes" in
=======
                  let uu____6788 = solve_universe_eq (p_pid orig) wl1 u1 u2 in
                  (match uu____6788 with
                   | USolved wl2 -> aux wl2 us11 us21
                   | failed_or_deferred -> failed_or_deferred)
              | uu____6791 -> UFailed "Unequal number of universes" in
>>>>>>> origin/guido_tactics
            let t11 = whnf env t1 in
            let t21 = whnf env t2 in
            match ((t11.FStar_Syntax_Syntax.n), (t21.FStar_Syntax_Syntax.n))
            with
            | (FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar f;
<<<<<<< HEAD
                  FStar_Syntax_Syntax.tk = uu____6684;
                  FStar_Syntax_Syntax.pos = uu____6685;
                  FStar_Syntax_Syntax.vars = uu____6686;_},us1),FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar g;
                  FStar_Syntax_Syntax.tk = uu____6689;
                  FStar_Syntax_Syntax.pos = uu____6690;
                  FStar_Syntax_Syntax.vars = uu____6691;_},us2))
                -> let b = FStar_Syntax_Syntax.fv_eq f g in aux wl us1 us2
            | (FStar_Syntax_Syntax.Tm_uinst uu____6704,uu____6705) ->
                failwith "Impossible: expect head symbols to match"
            | (uu____6710,FStar_Syntax_Syntax.Tm_uinst uu____6711) ->
                failwith "Impossible: expect head symbols to match"
            | uu____6716 -> USolved wl
=======
                  FStar_Syntax_Syntax.tk = uu____6799;
                  FStar_Syntax_Syntax.pos = uu____6800;
                  FStar_Syntax_Syntax.vars = uu____6801;_},us1),FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar g;
                  FStar_Syntax_Syntax.tk = uu____6804;
                  FStar_Syntax_Syntax.pos = uu____6805;
                  FStar_Syntax_Syntax.vars = uu____6806;_},us2))
                -> let b = FStar_Syntax_Syntax.fv_eq f g in aux wl us1 us2
            | (FStar_Syntax_Syntax.Tm_uinst uu____6818,uu____6819) ->
                failwith "Impossible: expect head symbols to match"
            | (uu____6824,FStar_Syntax_Syntax.Tm_uinst uu____6825) ->
                failwith "Impossible: expect head symbols to match"
            | uu____6830 -> USolved wl
>>>>>>> origin/guido_tactics
and giveup_or_defer:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob -> worklist -> Prims.string -> solution
  =
  fun env  ->
    fun orig  ->
      fun wl  ->
        fun msg  ->
          if wl.defer_ok
          then
<<<<<<< HEAD
            ((let uu____6724 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "Rel") in
              if uu____6724
              then
                let uu____6725 = prob_to_string env orig in
                FStar_Util.print2 "\n\t\tDeferring %s\n\t\tBecause %s\n"
                  uu____6725 msg
=======
            ((let uu____6838 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "Rel") in
              if uu____6838
              then
                let uu____6839 = prob_to_string env orig in
                FStar_Util.print2 "\n\t\tDeferring %s\n\t\tBecause %s\n"
                  uu____6839 msg
>>>>>>> origin/guido_tactics
              else ());
             solve env (defer msg orig wl))
          else giveup env msg orig
and solve_rigid_flex_meet:
  FStar_TypeChecker_Env.env -> tprob -> worklist -> worklist option =
  fun env  ->
    fun tp  ->
      fun wl  ->
<<<<<<< HEAD
        (let uu____6733 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "RelCheck") in
         if uu____6733
         then
           let uu____6734 =
             FStar_Util.string_of_int tp.FStar_TypeChecker_Common.pid in
           FStar_Util.print1 "Trying to solve by meeting refinements:%s\n"
             uu____6734
         else ());
        (let uu____6736 =
           FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.rhs in
         match uu____6736 with
         | (u,args) ->
             let rec disjoin t1 t2 =
               let uu____6778 = head_matches_delta env () t1 t2 in
               match uu____6778 with
               | (mr,ts) ->
                   (match mr with
                    | MisMatch uu____6800 -> None
=======
        (let uu____6847 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "RelCheck") in
         if uu____6847
         then
           let uu____6848 =
             FStar_Util.string_of_int tp.FStar_TypeChecker_Common.pid in
           FStar_Util.print1 "Trying to solve by meeting refinements:%s\n"
             uu____6848
         else ());
        (let uu____6850 =
           FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.rhs in
         match uu____6850 with
         | (u,args) ->
             let rec disjoin t1 t2 =
               let uu____6892 = head_matches_delta env () t1 t2 in
               match uu____6892 with
               | (mr,ts) ->
                   (match mr with
                    | MisMatch uu____6914 -> None
>>>>>>> origin/guido_tactics
                    | FullMatch  ->
                        (match ts with
                         | None  -> Some (t1, [])
                         | Some (t11,t21) -> Some (t11, []))
                    | HeadMatch  ->
<<<<<<< HEAD
                        let uu____6826 =
                          match ts with
                          | Some (t11,t21) ->
                              let uu____6835 =
                                FStar_Syntax_Subst.compress t11 in
                              let uu____6836 =
                                FStar_Syntax_Subst.compress t21 in
                              (uu____6835, uu____6836)
                          | None  ->
                              let uu____6839 = FStar_Syntax_Subst.compress t1 in
                              let uu____6840 = FStar_Syntax_Subst.compress t2 in
                              (uu____6839, uu____6840) in
                        (match uu____6826 with
                         | (t11,t21) ->
                             let eq_prob t12 t22 =
                               let uu____6862 =
=======
                        let uu____6940 =
                          match ts with
                          | Some (t11,t21) ->
                              let uu____6949 =
                                FStar_Syntax_Subst.compress t11 in
                              let uu____6950 =
                                FStar_Syntax_Subst.compress t21 in
                              (uu____6949, uu____6950)
                          | None  ->
                              let uu____6953 = FStar_Syntax_Subst.compress t1 in
                              let uu____6954 = FStar_Syntax_Subst.compress t2 in
                              (uu____6953, uu____6954) in
                        (match uu____6940 with
                         | (t11,t21) ->
                             let eq_prob t12 t22 =
                               let uu____6976 =
>>>>>>> origin/guido_tactics
                                 new_problem env t12
                                   FStar_TypeChecker_Common.EQ t22 None
                                   t12.FStar_Syntax_Syntax.pos
                                   "meeting refinements" in
                               FStar_All.pipe_left
<<<<<<< HEAD
                                 (fun _0_45  ->
                                    FStar_TypeChecker_Common.TProb _0_45)
                                 uu____6862 in
=======
                                 (fun _0_52  ->
                                    FStar_TypeChecker_Common.TProb _0_52)
                                 uu____6976 in
>>>>>>> origin/guido_tactics
                             (match ((t11.FStar_Syntax_Syntax.n),
                                      (t21.FStar_Syntax_Syntax.n))
                              with
                              | (FStar_Syntax_Syntax.Tm_refine
                                 (x,phi1),FStar_Syntax_Syntax.Tm_refine
                                 (y,phi2)) ->
<<<<<<< HEAD
                                  let uu____6885 =
                                    let uu____6891 =
                                      let uu____6894 =
                                        let uu____6897 =
                                          let uu____6898 =
                                            let uu____6903 =
                                              FStar_Syntax_Util.mk_disj phi1
                                                phi2 in
                                            (x, uu____6903) in
                                          FStar_Syntax_Syntax.Tm_refine
                                            uu____6898 in
                                        FStar_Syntax_Syntax.mk uu____6897 in
                                      uu____6894 None
                                        t11.FStar_Syntax_Syntax.pos in
                                    let uu____6916 =
                                      let uu____6918 =
                                        eq_prob x.FStar_Syntax_Syntax.sort
                                          y.FStar_Syntax_Syntax.sort in
                                      [uu____6918] in
                                    (uu____6891, uu____6916) in
                                  Some uu____6885
                              | (uu____6927,FStar_Syntax_Syntax.Tm_refine
                                 (x,uu____6929)) ->
                                  let uu____6934 =
                                    let uu____6938 =
                                      let uu____6940 =
                                        eq_prob x.FStar_Syntax_Syntax.sort
                                          t11 in
                                      [uu____6940] in
                                    (t11, uu____6938) in
                                  Some uu____6934
                              | (FStar_Syntax_Syntax.Tm_refine
                                 (x,uu____6946),uu____6947) ->
                                  let uu____6952 =
                                    let uu____6956 =
                                      let uu____6958 =
                                        eq_prob x.FStar_Syntax_Syntax.sort
                                          t21 in
                                      [uu____6958] in
                                    (t21, uu____6956) in
                                  Some uu____6952
                              | uu____6963 ->
                                  let uu____6966 =
                                    FStar_Syntax_Util.head_and_args t11 in
                                  (match uu____6966 with
                                   | (head1,uu____6981) ->
                                       let uu____6996 =
                                         let uu____6997 =
                                           FStar_Syntax_Util.un_uinst head1 in
                                         uu____6997.FStar_Syntax_Syntax.n in
                                       (match uu____6996 with
                                        | FStar_Syntax_Syntax.Tm_fvar
                                            {
                                              FStar_Syntax_Syntax.fv_name =
                                                uu____7004;
=======
                                  let uu____6999 =
                                    let uu____7005 =
                                      let uu____7008 =
                                        let uu____7011 =
                                          let uu____7012 =
                                            let uu____7017 =
                                              FStar_Syntax_Util.mk_disj phi1
                                                phi2 in
                                            (x, uu____7017) in
                                          FStar_Syntax_Syntax.Tm_refine
                                            uu____7012 in
                                        FStar_Syntax_Syntax.mk uu____7011 in
                                      uu____7008 None
                                        t11.FStar_Syntax_Syntax.pos in
                                    let uu____7030 =
                                      let uu____7032 =
                                        eq_prob x.FStar_Syntax_Syntax.sort
                                          y.FStar_Syntax_Syntax.sort in
                                      [uu____7032] in
                                    (uu____7005, uu____7030) in
                                  Some uu____6999
                              | (uu____7041,FStar_Syntax_Syntax.Tm_refine
                                 (x,uu____7043)) ->
                                  let uu____7048 =
                                    let uu____7052 =
                                      let uu____7054 =
                                        eq_prob x.FStar_Syntax_Syntax.sort
                                          t11 in
                                      [uu____7054] in
                                    (t11, uu____7052) in
                                  Some uu____7048
                              | (FStar_Syntax_Syntax.Tm_refine
                                 (x,uu____7060),uu____7061) ->
                                  let uu____7066 =
                                    let uu____7070 =
                                      let uu____7072 =
                                        eq_prob x.FStar_Syntax_Syntax.sort
                                          t21 in
                                      [uu____7072] in
                                    (t21, uu____7070) in
                                  Some uu____7066
                              | uu____7077 ->
                                  let uu____7080 =
                                    FStar_Syntax_Util.head_and_args t11 in
                                  (match uu____7080 with
                                   | (head1,uu____7095) ->
                                       let uu____7110 =
                                         let uu____7111 =
                                           FStar_Syntax_Util.un_uinst head1 in
                                         uu____7111.FStar_Syntax_Syntax.n in
                                       (match uu____7110 with
                                        | FStar_Syntax_Syntax.Tm_fvar
                                            {
                                              FStar_Syntax_Syntax.fv_name =
                                                uu____7118;
>>>>>>> origin/guido_tactics
                                              FStar_Syntax_Syntax.fv_delta =
                                                FStar_Syntax_Syntax.Delta_defined_at_level
                                                i;
                                              FStar_Syntax_Syntax.fv_qual =
<<<<<<< HEAD
                                                uu____7006;_}
=======
                                                uu____7120;_}
>>>>>>> origin/guido_tactics
                                            ->
                                            let prev =
                                              if i > (Prims.parse_int "1")
                                              then
                                                FStar_Syntax_Syntax.Delta_defined_at_level
                                                  (i - (Prims.parse_int "1"))
                                              else
                                                FStar_Syntax_Syntax.Delta_constant in
                                            let t12 =
                                              FStar_TypeChecker_Normalize.normalize
                                                [FStar_TypeChecker_Normalize.WHNF;
                                                FStar_TypeChecker_Normalize.UnfoldUntil
                                                  prev] env t11 in
                                            let t22 =
                                              FStar_TypeChecker_Normalize.normalize
                                                [FStar_TypeChecker_Normalize.WHNF;
                                                FStar_TypeChecker_Normalize.UnfoldUntil
                                                  prev] env t21 in
                                            disjoin t12 t22
<<<<<<< HEAD
                                        | uu____7012 -> None))))) in
             let tt = u in
             (match tt.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_uvar (uv,uu____7021) ->
                  let uu____7038 =
                    FStar_All.pipe_right wl.attempting
                      (FStar_List.partition
                         (fun uu___127_7056  ->
                            match uu___127_7056 with
                            | FStar_TypeChecker_Common.TProb tp1 ->
                                (match tp1.FStar_TypeChecker_Common.rank with
                                 | Some rank1 when is_rigid_flex rank1 ->
                                     let uu____7061 =
                                       FStar_Syntax_Util.head_and_args
                                         tp1.FStar_TypeChecker_Common.rhs in
                                     (match uu____7061 with
                                      | (u',uu____7072) ->
                                          let uu____7087 =
                                            let uu____7088 = whnf env u' in
                                            uu____7088.FStar_Syntax_Syntax.n in
                                          (match uu____7087 with
                                           | FStar_Syntax_Syntax.Tm_uvar
                                               (uv',uu____7092) ->
                                               FStar_Syntax_Unionfind.equiv
                                                 uv uv'
                                           | uu____7109 -> false))
                                 | uu____7110 -> false)
                            | uu____7112 -> false)) in
                  (match uu____7038 with
                   | (lower_bounds,rest) ->
                       let rec make_lower_bound uu____7133 tps =
                         match uu____7133 with
=======
                                        | uu____7129 -> None))))) in
             let tt = u in
             (match tt.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_uvar (uv,uu____7138) ->
                  let uu____7151 =
                    FStar_All.pipe_right wl.attempting
                      (FStar_List.partition
                         (fun uu___129_7160  ->
                            match uu___129_7160 with
                            | FStar_TypeChecker_Common.TProb tp1 ->
                                (match tp1.FStar_TypeChecker_Common.rank with
                                 | Some rank1 when is_rigid_flex rank1 ->
                                     let uu____7165 =
                                       FStar_Syntax_Util.head_and_args
                                         tp1.FStar_TypeChecker_Common.rhs in
                                     (match uu____7165 with
                                      | (u',uu____7176) ->
                                          let uu____7191 =
                                            let uu____7192 = whnf env u' in
                                            uu____7192.FStar_Syntax_Syntax.n in
                                          (match uu____7191 with
                                           | FStar_Syntax_Syntax.Tm_uvar
                                               (uv',uu____7196) ->
                                               FStar_Syntax_Unionfind.equiv
                                                 uv uv'
                                           | uu____7209 -> false))
                                 | uu____7210 -> false)
                            | uu____7212 -> false)) in
                  (match uu____7151 with
                   | (lower_bounds,rest) ->
                       let rec make_lower_bound uu____7233 tps =
                         match uu____7233 with
>>>>>>> origin/guido_tactics
                         | (bound,sub_probs) ->
                             (match tps with
                              | [] -> Some (bound, sub_probs)
                              | (FStar_TypeChecker_Common.TProb hd1)::tl1 ->
<<<<<<< HEAD
                                  let uu____7160 =
                                    let uu____7165 =
                                      whnf env
                                        hd1.FStar_TypeChecker_Common.lhs in
                                    disjoin bound uu____7165 in
                                  (match uu____7160 with
=======
                                  let uu____7260 =
                                    let uu____7265 =
                                      whnf env
                                        hd1.FStar_TypeChecker_Common.lhs in
                                    disjoin bound uu____7265 in
                                  (match uu____7260 with
>>>>>>> origin/guido_tactics
                                   | Some (bound1,sub1) ->
                                       make_lower_bound
                                         (bound1,
                                           (FStar_List.append sub1 sub_probs))
                                         tl1
                                   | None  -> None)
<<<<<<< HEAD
                              | uu____7184 -> None) in
                       let uu____7189 =
                         let uu____7194 =
                           let uu____7198 =
                             whnf env tp.FStar_TypeChecker_Common.lhs in
                           (uu____7198, []) in
                         make_lower_bound uu____7194 lower_bounds in
                       (match uu____7189 with
                        | None  ->
                            ((let uu____7205 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "RelCheck") in
                              if uu____7205
=======
                              | uu____7284 -> None) in
                       let uu____7289 =
                         let uu____7294 =
                           let uu____7298 =
                             whnf env tp.FStar_TypeChecker_Common.lhs in
                           (uu____7298, []) in
                         make_lower_bound uu____7294 lower_bounds in
                       (match uu____7289 with
                        | None  ->
                            ((let uu____7305 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "RelCheck") in
                              if uu____7305
>>>>>>> origin/guido_tactics
                              then
                                FStar_Util.print_string "No lower bounds\n"
                              else ());
                             None)
                        | Some (lhs_bound,sub_probs) ->
                            let eq_prob =
                              new_problem env lhs_bound
                                FStar_TypeChecker_Common.EQ
                                tp.FStar_TypeChecker_Common.rhs None
                                tp.FStar_TypeChecker_Common.loc
                                "meeting refinements" in
<<<<<<< HEAD
                            ((let uu____7218 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "RelCheck") in
                              if uu____7218
                              then
                                let wl' =
                                  let uu___154_7220 = wl in
=======
                            ((let uu____7318 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "RelCheck") in
                              if uu____7318
                              then
                                let wl' =
                                  let uu___156_7320 = wl in
>>>>>>> origin/guido_tactics
                                  {
                                    attempting =
                                      ((FStar_TypeChecker_Common.TProb
                                          eq_prob) :: sub_probs);
<<<<<<< HEAD
                                    wl_deferred = (uu___154_7220.wl_deferred);
                                    ctr = (uu___154_7220.ctr);
                                    defer_ok = (uu___154_7220.defer_ok);
                                    smt_ok = (uu___154_7220.smt_ok);
                                    tcenv = (uu___154_7220.tcenv)
                                  } in
                                let uu____7221 = wl_to_string wl' in
                                FStar_Util.print1
                                  "After meeting refinements: %s\n"
                                  uu____7221
                              else ());
                             (let uu____7223 =
                                solve_t env eq_prob
                                  (let uu___155_7225 = wl in
                                   {
                                     attempting = sub_probs;
                                     wl_deferred =
                                       (uu___155_7225.wl_deferred);
                                     ctr = (uu___155_7225.ctr);
                                     defer_ok = (uu___155_7225.defer_ok);
                                     smt_ok = (uu___155_7225.smt_ok);
                                     tcenv = (uu___155_7225.tcenv)
                                   }) in
                              match uu____7223 with
                              | Success uu____7227 ->
                                  let wl1 =
                                    let uu___156_7229 = wl in
                                    {
                                      attempting = rest;
                                      wl_deferred =
                                        (uu___156_7229.wl_deferred);
                                      ctr = (uu___156_7229.ctr);
                                      defer_ok = (uu___156_7229.defer_ok);
                                      smt_ok = (uu___156_7229.smt_ok);
                                      tcenv = (uu___156_7229.tcenv)
=======
                                    wl_deferred = (uu___156_7320.wl_deferred);
                                    ctr = (uu___156_7320.ctr);
                                    defer_ok = (uu___156_7320.defer_ok);
                                    smt_ok = (uu___156_7320.smt_ok);
                                    tcenv = (uu___156_7320.tcenv)
                                  } in
                                let uu____7321 = wl_to_string wl' in
                                FStar_Util.print1
                                  "After meeting refinements: %s\n"
                                  uu____7321
                              else ());
                             (let uu____7323 =
                                solve_t env eq_prob
                                  (let uu___157_7324 = wl in
                                   {
                                     attempting = sub_probs;
                                     wl_deferred =
                                       (uu___157_7324.wl_deferred);
                                     ctr = (uu___157_7324.ctr);
                                     defer_ok = (uu___157_7324.defer_ok);
                                     smt_ok = (uu___157_7324.smt_ok);
                                     tcenv = (uu___157_7324.tcenv)
                                   }) in
                              match uu____7323 with
                              | Success uu____7326 ->
                                  let wl1 =
                                    let uu___158_7328 = wl in
                                    {
                                      attempting = rest;
                                      wl_deferred =
                                        (uu___158_7328.wl_deferred);
                                      ctr = (uu___158_7328.ctr);
                                      defer_ok = (uu___158_7328.defer_ok);
                                      smt_ok = (uu___158_7328.smt_ok);
                                      tcenv = (uu___158_7328.tcenv)
>>>>>>> origin/guido_tactics
                                    } in
                                  let wl2 =
                                    solve_prob' false
                                      (FStar_TypeChecker_Common.TProb tp)
                                      None [] wl1 in
<<<<<<< HEAD
                                  let uu____7231 =
=======
                                  let uu____7330 =
>>>>>>> origin/guido_tactics
                                    FStar_List.fold_left
                                      (fun wl3  ->
                                         fun p  ->
                                           solve_prob' true p None [] wl3)
                                      wl2 lower_bounds in
                                  Some wl2
<<<<<<< HEAD
                              | uu____7236 -> None))))
              | uu____7237 -> failwith "Impossible: Not a rigid-flex"))
=======
                              | uu____7333 -> None))))
              | uu____7334 -> failwith "Impossible: Not a rigid-flex"))
>>>>>>> origin/guido_tactics
and solve_flex_rigid_join:
  FStar_TypeChecker_Env.env -> tprob -> worklist -> worklist option =
  fun env  ->
    fun tp  ->
      fun wl  ->
<<<<<<< HEAD
        (let uu____7244 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "RelCheck") in
         if uu____7244
         then
           let uu____7245 =
             FStar_Util.string_of_int tp.FStar_TypeChecker_Common.pid in
           FStar_Util.print1 "Trying to solve by joining refinements:%s\n"
             uu____7245
         else ());
        (let uu____7247 =
           FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.lhs in
         match uu____7247 with
         | (u,args) ->
             let uu____7274 =
               ((Prims.parse_int "0"), (Prims.parse_int "1"),
                 (Prims.parse_int "2"), (Prims.parse_int "3"),
                 (Prims.parse_int "4")) in
             (match uu____7274 with
              | (ok,head_match1,partial_match,fallback,failed_match) ->
                  let max1 i j = if i < j then j else i in
                  let base_types_match t1 t2 =
                    let uu____7305 = FStar_Syntax_Util.head_and_args t1 in
                    match uu____7305 with
                    | (h1,args1) ->
                        let uu____7333 = FStar_Syntax_Util.head_and_args t2 in
                        (match uu____7333 with
                         | (h2,uu____7346) ->
=======
        (let uu____7341 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "RelCheck") in
         if uu____7341
         then
           let uu____7342 =
             FStar_Util.string_of_int tp.FStar_TypeChecker_Common.pid in
           FStar_Util.print1 "Trying to solve by joining refinements:%s\n"
             uu____7342
         else ());
        (let uu____7344 =
           FStar_Syntax_Util.head_and_args tp.FStar_TypeChecker_Common.lhs in
         match uu____7344 with
         | (u,args) ->
             let uu____7371 =
               ((Prims.parse_int "0"), (Prims.parse_int "1"),
                 (Prims.parse_int "2"), (Prims.parse_int "3"),
                 (Prims.parse_int "4")) in
             (match uu____7371 with
              | (ok,head_match1,partial_match,fallback,failed_match) ->
                  let max1 i j = if i < j then j else i in
                  let base_types_match t1 t2 =
                    let uu____7402 = FStar_Syntax_Util.head_and_args t1 in
                    match uu____7402 with
                    | (h1,args1) ->
                        let uu____7430 = FStar_Syntax_Util.head_and_args t2 in
                        (match uu____7430 with
                         | (h2,uu____7443) ->
>>>>>>> origin/guido_tactics
                             (match ((h1.FStar_Syntax_Syntax.n),
                                      (h2.FStar_Syntax_Syntax.n))
                              with
                              | (FStar_Syntax_Syntax.Tm_fvar
                                 tc1,FStar_Syntax_Syntax.Tm_fvar tc2) ->
<<<<<<< HEAD
                                  let uu____7365 =
                                    FStar_Syntax_Syntax.fv_eq tc1 tc2 in
                                  if uu____7365
=======
                                  let uu____7462 =
                                    FStar_Syntax_Syntax.fv_eq tc1 tc2 in
                                  if uu____7462
>>>>>>> origin/guido_tactics
                                  then
                                    (if
                                       (FStar_List.length args1) =
                                         (Prims.parse_int "0")
                                     then Some []
                                     else
<<<<<<< HEAD
                                       (let uu____7378 =
                                          let uu____7380 =
                                            let uu____7381 =
=======
                                       (let uu____7477 =
                                          let uu____7479 =
                                            let uu____7480 =
>>>>>>> origin/guido_tactics
                                              new_problem env t1
                                                FStar_TypeChecker_Common.EQ
                                                t2 None
                                                t1.FStar_Syntax_Syntax.pos
                                                "joining refinements" in
                                            FStar_All.pipe_left
                                              (fun _0_53  ->
                                                 FStar_TypeChecker_Common.TProb
<<<<<<< HEAD
                                                   _0_46) uu____7381 in
                                          [uu____7380] in
                                        Some uu____7378))
=======
                                                   _0_53) uu____7480 in
                                          [uu____7479] in
                                        Some uu____7477))
>>>>>>> origin/guido_tactics
                                  else None
                              | (FStar_Syntax_Syntax.Tm_name
                                 a,FStar_Syntax_Syntax.Tm_name b) ->
                                  if FStar_Syntax_Syntax.bv_eq a b
                                  then
                                    (if
                                       (FStar_List.length args1) =
                                         (Prims.parse_int "0")
                                     then Some []
                                     else
<<<<<<< HEAD
                                       (let uu____7403 =
                                          let uu____7405 =
                                            let uu____7406 =
=======
                                       (let uu____7504 =
                                          let uu____7506 =
                                            let uu____7507 =
>>>>>>> origin/guido_tactics
                                              new_problem env t1
                                                FStar_TypeChecker_Common.EQ
                                                t2 None
                                                t1.FStar_Syntax_Syntax.pos
                                                "joining refinements" in
                                            FStar_All.pipe_left
                                              (fun _0_54  ->
                                                 FStar_TypeChecker_Common.TProb
<<<<<<< HEAD
                                                   _0_47) uu____7406 in
                                          [uu____7405] in
                                        Some uu____7403))
                                  else None
                              | uu____7414 -> None)) in
=======
                                                   _0_54) uu____7507 in
                                          [uu____7506] in
                                        Some uu____7504))
                                  else None
                              | uu____7515 -> None)) in
>>>>>>> origin/guido_tactics
                  let conjoin t1 t2 =
                    match ((t1.FStar_Syntax_Syntax.n),
                            (t2.FStar_Syntax_Syntax.n))
                    with
                    | (FStar_Syntax_Syntax.Tm_refine
                       (x,phi1),FStar_Syntax_Syntax.Tm_refine (y,phi2)) ->
                        let m =
                          base_types_match x.FStar_Syntax_Syntax.sort
                            y.FStar_Syntax_Syntax.sort in
                        (match m with
                         | None  -> None
                         | Some m1 ->
                             let x1 = FStar_Syntax_Syntax.freshen_bv x in
                             let subst1 =
                               [FStar_Syntax_Syntax.DB
                                  ((Prims.parse_int "0"), x1)] in
                             let phi11 = FStar_Syntax_Subst.subst subst1 phi1 in
                             let phi21 = FStar_Syntax_Subst.subst subst1 phi2 in
<<<<<<< HEAD
                             let uu____7480 =
                               let uu____7486 =
                                 let uu____7489 =
                                   FStar_Syntax_Util.mk_conj phi11 phi21 in
                                 FStar_Syntax_Util.refine x1 uu____7489 in
                               (uu____7486, m1) in
                             Some uu____7480)
                    | (uu____7498,FStar_Syntax_Syntax.Tm_refine
                       (y,uu____7500)) ->
=======
                             let uu____7581 =
                               let uu____7587 =
                                 let uu____7590 =
                                   FStar_Syntax_Util.mk_conj phi11 phi21 in
                                 FStar_Syntax_Util.refine x1 uu____7590 in
                               (uu____7587, m1) in
                             Some uu____7581)
                    | (uu____7599,FStar_Syntax_Syntax.Tm_refine
                       (y,uu____7601)) ->
>>>>>>> origin/guido_tactics
                        let m =
                          base_types_match t1 y.FStar_Syntax_Syntax.sort in
                        (match m with
                         | None  -> None
                         | Some m1 -> Some (t2, m1))
                    | (FStar_Syntax_Syntax.Tm_refine
<<<<<<< HEAD
                       (x,uu____7532),uu____7533) ->
=======
                       (x,uu____7633),uu____7634) ->
>>>>>>> origin/guido_tactics
                        let m =
                          base_types_match x.FStar_Syntax_Syntax.sort t2 in
                        (match m with
                         | None  -> None
                         | Some m1 -> Some (t1, m1))
<<<<<<< HEAD
                    | uu____7564 ->
=======
                    | uu____7665 ->
>>>>>>> origin/guido_tactics
                        let m = base_types_match t1 t2 in
                        (match m with
                         | None  -> None
                         | Some m1 -> Some (t1, m1)) in
                  let tt = u in
                  (match tt.FStar_Syntax_Syntax.n with
<<<<<<< HEAD
                   | FStar_Syntax_Syntax.Tm_uvar (uv,uu____7598) ->
                       let uu____7615 =
                         FStar_All.pipe_right wl.attempting
                           (FStar_List.partition
                              (fun uu___128_7633  ->
                                 match uu___128_7633 with
=======
                   | FStar_Syntax_Syntax.Tm_uvar (uv,uu____7699) ->
                       let uu____7712 =
                         FStar_All.pipe_right wl.attempting
                           (FStar_List.partition
                              (fun uu___130_7721  ->
                                 match uu___130_7721 with
>>>>>>> origin/guido_tactics
                                 | FStar_TypeChecker_Common.TProb tp1 ->
                                     (match tp1.FStar_TypeChecker_Common.rank
                                      with
                                      | Some rank1 when is_flex_rigid rank1
                                          ->
<<<<<<< HEAD
                                          let uu____7638 =
                                            FStar_Syntax_Util.head_and_args
                                              tp1.FStar_TypeChecker_Common.lhs in
                                          (match uu____7638 with
                                           | (u',uu____7649) ->
                                               let uu____7664 =
                                                 let uu____7665 = whnf env u' in
                                                 uu____7665.FStar_Syntax_Syntax.n in
                                               (match uu____7664 with
                                                | FStar_Syntax_Syntax.Tm_uvar
                                                    (uv',uu____7669) ->
                                                    FStar_Syntax_Unionfind.equiv
                                                      uv uv'
                                                | uu____7686 -> false))
                                      | uu____7687 -> false)
                                 | uu____7689 -> false)) in
                       (match uu____7615 with
                        | (upper_bounds,rest) ->
                            let rec make_upper_bound uu____7714 tps =
                              match uu____7714 with
=======
                                          let uu____7726 =
                                            FStar_Syntax_Util.head_and_args
                                              tp1.FStar_TypeChecker_Common.lhs in
                                          (match uu____7726 with
                                           | (u',uu____7737) ->
                                               let uu____7752 =
                                                 let uu____7753 = whnf env u' in
                                                 uu____7753.FStar_Syntax_Syntax.n in
                                               (match uu____7752 with
                                                | FStar_Syntax_Syntax.Tm_uvar
                                                    (uv',uu____7757) ->
                                                    FStar_Syntax_Unionfind.equiv
                                                      uv uv'
                                                | uu____7770 -> false))
                                      | uu____7771 -> false)
                                 | uu____7773 -> false)) in
                       (match uu____7712 with
                        | (upper_bounds,rest) ->
                            let rec make_upper_bound uu____7798 tps =
                              match uu____7798 with
>>>>>>> origin/guido_tactics
                              | (bound,sub_probs) ->
                                  (match tps with
                                   | [] -> Some (bound, sub_probs)
                                   | (FStar_TypeChecker_Common.TProb
                                       hd1)::tl1 ->
<<<<<<< HEAD
                                       let uu____7755 =
                                         let uu____7762 =
                                           whnf env
                                             hd1.FStar_TypeChecker_Common.rhs in
                                         conjoin bound uu____7762 in
                                       (match uu____7755 with
=======
                                       let uu____7839 =
                                         let uu____7846 =
                                           whnf env
                                             hd1.FStar_TypeChecker_Common.rhs in
                                         conjoin bound uu____7846 in
                                       (match uu____7839 with
>>>>>>> origin/guido_tactics
                                        | Some (bound1,sub1) ->
                                            make_upper_bound
                                              (bound1,
                                                (FStar_List.append sub1
                                                   sub_probs)) tl1
                                        | None  -> None)
<<<<<<< HEAD
                                   | uu____7797 -> None) in
                            let uu____7804 =
                              let uu____7811 =
                                let uu____7817 =
                                  whnf env tp.FStar_TypeChecker_Common.rhs in
                                (uu____7817, []) in
                              make_upper_bound uu____7811 upper_bounds in
                            (match uu____7804 with
                             | None  ->
                                 ((let uu____7826 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "RelCheck") in
                                   if uu____7826
=======
                                   | uu____7881 -> None) in
                            let uu____7888 =
                              let uu____7895 =
                                let uu____7901 =
                                  whnf env tp.FStar_TypeChecker_Common.rhs in
                                (uu____7901, []) in
                              make_upper_bound uu____7895 upper_bounds in
                            (match uu____7888 with
                             | None  ->
                                 ((let uu____7910 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "RelCheck") in
                                   if uu____7910
>>>>>>> origin/guido_tactics
                                   then
                                     FStar_Util.print_string
                                       "No upper bounds\n"
                                   else ());
                                  None)
                             | Some (rhs_bound,sub_probs) ->
                                 let eq_prob =
                                   new_problem env
                                     tp.FStar_TypeChecker_Common.lhs
                                     FStar_TypeChecker_Common.EQ rhs_bound
                                     None tp.FStar_TypeChecker_Common.loc
                                     "joining refinements" in
<<<<<<< HEAD
                                 ((let uu____7845 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "RelCheck") in
                                   if uu____7845
                                   then
                                     let wl' =
                                       let uu___157_7847 = wl in
=======
                                 ((let uu____7929 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "RelCheck") in
                                   if uu____7929
                                   then
                                     let wl' =
                                       let uu___159_7931 = wl in
>>>>>>> origin/guido_tactics
                                       {
                                         attempting =
                                           ((FStar_TypeChecker_Common.TProb
                                               eq_prob) :: sub_probs);
                                         wl_deferred =
<<<<<<< HEAD
                                           (uu___157_7847.wl_deferred);
                                         ctr = (uu___157_7847.ctr);
                                         defer_ok = (uu___157_7847.defer_ok);
                                         smt_ok = (uu___157_7847.smt_ok);
                                         tcenv = (uu___157_7847.tcenv)
                                       } in
                                     let uu____7848 = wl_to_string wl' in
                                     FStar_Util.print1
                                       "After joining refinements: %s\n"
                                       uu____7848
                                   else ());
                                  (let uu____7850 =
                                     solve_t env eq_prob
                                       (let uu___158_7852 = wl in
                                        {
                                          attempting = sub_probs;
                                          wl_deferred =
                                            (uu___158_7852.wl_deferred);
                                          ctr = (uu___158_7852.ctr);
                                          defer_ok = (uu___158_7852.defer_ok);
                                          smt_ok = (uu___158_7852.smt_ok);
                                          tcenv = (uu___158_7852.tcenv)
                                        }) in
                                   match uu____7850 with
                                   | Success uu____7854 ->
                                       let wl1 =
                                         let uu___159_7856 = wl in
                                         {
                                           attempting = rest;
                                           wl_deferred =
                                             (uu___159_7856.wl_deferred);
                                           ctr = (uu___159_7856.ctr);
                                           defer_ok =
                                             (uu___159_7856.defer_ok);
                                           smt_ok = (uu___159_7856.smt_ok);
                                           tcenv = (uu___159_7856.tcenv)
=======
                                           (uu___159_7931.wl_deferred);
                                         ctr = (uu___159_7931.ctr);
                                         defer_ok = (uu___159_7931.defer_ok);
                                         smt_ok = (uu___159_7931.smt_ok);
                                         tcenv = (uu___159_7931.tcenv)
                                       } in
                                     let uu____7932 = wl_to_string wl' in
                                     FStar_Util.print1
                                       "After joining refinements: %s\n"
                                       uu____7932
                                   else ());
                                  (let uu____7934 =
                                     solve_t env eq_prob
                                       (let uu___160_7935 = wl in
                                        {
                                          attempting = sub_probs;
                                          wl_deferred =
                                            (uu___160_7935.wl_deferred);
                                          ctr = (uu___160_7935.ctr);
                                          defer_ok = (uu___160_7935.defer_ok);
                                          smt_ok = (uu___160_7935.smt_ok);
                                          tcenv = (uu___160_7935.tcenv)
                                        }) in
                                   match uu____7934 with
                                   | Success uu____7937 ->
                                       let wl1 =
                                         let uu___161_7939 = wl in
                                         {
                                           attempting = rest;
                                           wl_deferred =
                                             (uu___161_7939.wl_deferred);
                                           ctr = (uu___161_7939.ctr);
                                           defer_ok =
                                             (uu___161_7939.defer_ok);
                                           smt_ok = (uu___161_7939.smt_ok);
                                           tcenv = (uu___161_7939.tcenv)
>>>>>>> origin/guido_tactics
                                         } in
                                       let wl2 =
                                         solve_prob' false
                                           (FStar_TypeChecker_Common.TProb tp)
                                           None [] wl1 in
<<<<<<< HEAD
                                       let uu____7858 =
=======
                                       let uu____7941 =
>>>>>>> origin/guido_tactics
                                         FStar_List.fold_left
                                           (fun wl3  ->
                                              fun p  ->
                                                solve_prob' true p None []
                                                  wl3) wl2 upper_bounds in
                                       Some wl2
<<<<<<< HEAD
                                   | uu____7863 -> None))))
                   | uu____7864 -> failwith "Impossible: Not a flex-rigid")))
=======
                                   | uu____7944 -> None))))
                   | uu____7945 -> failwith "Impossible: Not a flex-rigid")))
>>>>>>> origin/guido_tactics
and solve_binders:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_Syntax_Syntax.binders ->
        FStar_TypeChecker_Common.prob ->
          worklist ->
            (FStar_Syntax_Syntax.binders ->
               FStar_TypeChecker_Env.env ->
                 FStar_Syntax_Syntax.subst_elt Prims.list ->
                   FStar_TypeChecker_Common.prob)
              -> solution
  =
  fun env  ->
    fun bs1  ->
      fun bs2  ->
        fun orig  ->
          fun wl  ->
            fun rhs  ->
              let rec aux scope env1 subst1 xs ys =
                match (xs, ys) with
                | ([],[]) ->
                    let rhs_prob = rhs (FStar_List.rev scope) env1 subst1 in
<<<<<<< HEAD
                    ((let uu____7925 =
                        FStar_All.pipe_left
                          (FStar_TypeChecker_Env.debug env1)
                          (FStar_Options.Other "Rel") in
                      if uu____7925
                      then
                        let uu____7926 = prob_to_string env1 rhs_prob in
                        FStar_Util.print1 "rhs_prob = %s\n" uu____7926
=======
                    ((let uu____8010 =
                        FStar_All.pipe_left
                          (FStar_TypeChecker_Env.debug env1)
                          (FStar_Options.Other "Rel") in
                      if uu____8010
                      then
                        let uu____8011 = prob_to_string env1 rhs_prob in
                        FStar_Util.print1 "rhs_prob = %s\n" uu____8011
>>>>>>> origin/guido_tactics
                      else ());
                     (let formula =
                        FStar_All.pipe_right (p_guard rhs_prob)
                          FStar_Pervasives.fst in
                      FStar_Util.Inl ([rhs_prob], formula)))
                | ((hd1,imp)::xs1,(hd2,imp')::ys1) when imp = imp' ->
                    let hd11 =
<<<<<<< HEAD
                      let uu___160_7958 = hd1 in
                      let uu____7959 =
=======
                      let uu___162_8043 = hd1 in
                      let uu____8044 =
>>>>>>> origin/guido_tactics
                        FStar_Syntax_Subst.subst subst1
                          hd1.FStar_Syntax_Syntax.sort in
                      {
                        FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                          (uu___160_7958.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___160_7958.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = uu____7959
                      } in
                    let hd21 =
                      let uu___161_7963 = hd2 in
                      let uu____7964 =
=======
                          (uu___162_8043.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___162_8043.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = uu____8044
                      } in
                    let hd21 =
                      let uu___163_8048 = hd2 in
                      let uu____8049 =
>>>>>>> origin/guido_tactics
                        FStar_Syntax_Subst.subst subst1
                          hd2.FStar_Syntax_Syntax.sort in
                      {
                        FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                          (uu___161_7963.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___161_7963.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = uu____7964
                      } in
                    let prob =
                      let uu____7968 =
                        let uu____7971 =
                          FStar_All.pipe_left invert_rel (p_rel orig) in
                        mk_problem scope orig hd11.FStar_Syntax_Syntax.sort
                          uu____7971 hd21.FStar_Syntax_Syntax.sort None
                          "Formal parameter" in
                      FStar_All.pipe_left
                        (fun _0_48  -> FStar_TypeChecker_Common.TProb _0_48)
                        uu____7968 in
                    let hd12 = FStar_Syntax_Syntax.freshen_bv hd11 in
                    let subst2 =
                      let uu____7979 =
                        FStar_Syntax_Subst.shift_subst (Prims.parse_int "1")
                          subst1 in
                      (FStar_Syntax_Syntax.DB ((Prims.parse_int "0"), hd12))
                        :: uu____7979 in
                    let env2 = FStar_TypeChecker_Env.push_bv env1 hd12 in
                    let uu____7982 =
                      aux ((hd12, imp) :: scope) env2 subst2 xs1 ys1 in
                    (match uu____7982 with
                     | FStar_Util.Inl (sub_probs,phi) ->
                         let phi1 =
                           let uu____8000 =
                             FStar_All.pipe_right (p_guard prob)
                               FStar_Pervasives.fst in
                           let uu____8003 =
                             close_forall env2 [(hd12, imp)] phi in
                           FStar_Syntax_Util.mk_conj uu____8000 uu____8003 in
                         ((let uu____8009 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env2)
                               (FStar_Options.Other "Rel") in
                           if uu____8009
                           then
                             let uu____8010 =
                               FStar_Syntax_Print.term_to_string phi1 in
                             let uu____8011 =
                               FStar_Syntax_Print.bv_to_string hd12 in
                             FStar_Util.print2 "Formula is %s\n\thd1=%s\n"
                               uu____8010 uu____8011
                           else ());
                          FStar_Util.Inl ((prob :: sub_probs), phi1))
                     | fail -> fail)
                | uu____8026 ->
                    FStar_Util.Inr "arity or argument-qualifier mismatch" in
              let scope = p_scope orig in
              let uu____8032 = aux scope env [] bs1 bs2 in
              match uu____8032 with
=======
                          (uu___163_8048.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___163_8048.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = uu____8049
                      } in
                    let prob =
                      let uu____8053 =
                        let uu____8056 =
                          FStar_All.pipe_left invert_rel (p_rel orig) in
                        mk_problem scope orig hd11.FStar_Syntax_Syntax.sort
                          uu____8056 hd21.FStar_Syntax_Syntax.sort None
                          "Formal parameter" in
                      FStar_All.pipe_left
                        (fun _0_55  -> FStar_TypeChecker_Common.TProb _0_55)
                        uu____8053 in
                    let hd12 = FStar_Syntax_Syntax.freshen_bv hd11 in
                    let subst2 =
                      let uu____8064 =
                        FStar_Syntax_Subst.shift_subst (Prims.parse_int "1")
                          subst1 in
                      (FStar_Syntax_Syntax.DB ((Prims.parse_int "0"), hd12))
                        :: uu____8064 in
                    let env2 = FStar_TypeChecker_Env.push_bv env1 hd12 in
                    let uu____8067 =
                      aux ((hd12, imp) :: scope) env2 subst2 xs1 ys1 in
                    (match uu____8067 with
                     | FStar_Util.Inl (sub_probs,phi) ->
                         let phi1 =
                           let uu____8085 =
                             FStar_All.pipe_right (p_guard prob)
                               FStar_Pervasives.fst in
                           let uu____8088 =
                             close_forall env2 [(hd12, imp)] phi in
                           FStar_Syntax_Util.mk_conj uu____8085 uu____8088 in
                         ((let uu____8094 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env2)
                               (FStar_Options.Other "Rel") in
                           if uu____8094
                           then
                             let uu____8095 =
                               FStar_Syntax_Print.term_to_string phi1 in
                             let uu____8096 =
                               FStar_Syntax_Print.bv_to_string hd12 in
                             FStar_Util.print2 "Formula is %s\n\thd1=%s\n"
                               uu____8095 uu____8096
                           else ());
                          FStar_Util.Inl ((prob :: sub_probs), phi1))
                     | fail -> fail)
                | uu____8111 ->
                    FStar_Util.Inr "arity or argument-qualifier mismatch" in
              let scope = p_scope orig in
              let uu____8117 = aux scope env [] bs1 bs2 in
              match uu____8117 with
>>>>>>> origin/guido_tactics
              | FStar_Util.Inr msg -> giveup env msg orig
              | FStar_Util.Inl (sub_probs,phi) ->
                  let wl1 = solve_prob orig (Some phi) [] wl in
                  solve env (attempt sub_probs wl1)
and solve_t: FStar_TypeChecker_Env.env -> tprob -> worklist -> solution =
  fun env  ->
    fun problem  ->
      fun wl  ->
<<<<<<< HEAD
        let uu____8048 = compress_tprob wl problem in
        solve_t' env uu____8048 wl
=======
        let uu____8133 = compress_tprob wl problem in
        solve_t' env uu____8133 wl
>>>>>>> origin/guido_tactics
and solve_t': FStar_TypeChecker_Env.env -> tprob -> worklist -> solution =
  fun env  ->
    fun problem  ->
      fun wl  ->
        let giveup_or_defer1 orig msg = giveup_or_defer env orig wl msg in
        let rigid_rigid_delta env1 orig wl1 head1 head2 t1 t2 =
<<<<<<< HEAD
          let uu____8081 = head_matches_delta env1 wl1 t1 t2 in
          match uu____8081 with
          | (m,o) ->
              (match (m, o) with
               | (MisMatch uu____8098,uu____8099) ->
                   let may_relate head3 =
                     let uu____8114 =
                       let uu____8115 = FStar_Syntax_Util.un_uinst head3 in
                       uu____8115.FStar_Syntax_Syntax.n in
                     match uu____8114 with
                     | FStar_Syntax_Syntax.Tm_name uu____8118 -> true
                     | FStar_Syntax_Syntax.Tm_match uu____8119 -> true
                     | FStar_Syntax_Syntax.Tm_fvar tc ->
                         tc.FStar_Syntax_Syntax.fv_delta =
                           FStar_Syntax_Syntax.Delta_equational
                     | uu____8135 -> false in
                   let uu____8136 =
                     ((may_relate head1) || (may_relate head2)) && wl1.smt_ok in
                   if uu____8136
=======
          let uu____8166 = head_matches_delta env1 wl1 t1 t2 in
          match uu____8166 with
          | (m,o) ->
              (match (m, o) with
               | (MisMatch uu____8183,uu____8184) ->
                   let may_relate head3 =
                     let uu____8199 =
                       let uu____8200 = FStar_Syntax_Util.un_uinst head3 in
                       uu____8200.FStar_Syntax_Syntax.n in
                     match uu____8199 with
                     | FStar_Syntax_Syntax.Tm_name uu____8203 -> true
                     | FStar_Syntax_Syntax.Tm_match uu____8204 -> true
                     | FStar_Syntax_Syntax.Tm_fvar tc ->
                         tc.FStar_Syntax_Syntax.fv_delta =
                           FStar_Syntax_Syntax.Delta_equational
                     | uu____8221 -> false in
                   let uu____8222 =
                     ((may_relate head1) || (may_relate head2)) && wl1.smt_ok in
                   if uu____8222
>>>>>>> origin/guido_tactics
                   then
                     let guard =
                       if
                         problem.FStar_TypeChecker_Common.relation =
                           FStar_TypeChecker_Common.EQ
                       then mk_eq2 env1 t1 t2
                       else
                         (let has_type_guard t11 t21 =
                            match problem.FStar_TypeChecker_Common.element
                            with
                            | Some t ->
                                FStar_Syntax_Util.mk_has_type t11 t t21
                            | None  ->
                                let x = FStar_Syntax_Syntax.new_bv None t11 in
                                let u_x =
                                  env1.FStar_TypeChecker_Env.universe_of env1
                                    t11 in
<<<<<<< HEAD
                                let uu____8153 =
                                  let uu____8154 =
                                    FStar_Syntax_Syntax.bv_to_name x in
                                  FStar_Syntax_Util.mk_has_type t11
                                    uu____8154 t21 in
                                FStar_Syntax_Util.mk_forall u_x x uu____8153 in
=======
                                let uu____8239 =
                                  let uu____8240 =
                                    FStar_Syntax_Syntax.bv_to_name x in
                                  FStar_Syntax_Util.mk_has_type t11
                                    uu____8240 t21 in
                                FStar_Syntax_Util.mk_forall u_x x uu____8239 in
>>>>>>> origin/guido_tactics
                          if
                            problem.FStar_TypeChecker_Common.relation =
                              FStar_TypeChecker_Common.SUB
                          then has_type_guard t1 t2
                          else has_type_guard t2 t1) in
<<<<<<< HEAD
                     let uu____8156 = solve_prob orig (Some guard) [] wl1 in
                     solve env1 uu____8156
                   else giveup env1 "head mismatch" orig
               | (uu____8158,Some (t11,t21)) ->
                   solve_t env1
                     (let uu___162_8167 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___162_8167.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs = t11;
                        FStar_TypeChecker_Common.relation =
                          (uu___162_8167.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs = t21;
                        FStar_TypeChecker_Common.element =
                          (uu___162_8167.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___162_8167.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___162_8167.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___162_8167.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___162_8167.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___162_8167.FStar_TypeChecker_Common.rank)
                      }) wl1
               | (uu____8168,None ) ->
                   ((let uu____8175 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "Rel") in
                     if uu____8175
                     then
                       let uu____8176 = FStar_Syntax_Print.term_to_string t1 in
                       let uu____8177 = FStar_Syntax_Print.tag_of_term t1 in
                       let uu____8178 = FStar_Syntax_Print.term_to_string t2 in
                       let uu____8179 = FStar_Syntax_Print.tag_of_term t2 in
                       FStar_Util.print4
                         "Head matches: %s (%s) and %s (%s)\n" uu____8176
                         uu____8177 uu____8178 uu____8179
                     else ());
                    (let uu____8181 = FStar_Syntax_Util.head_and_args t1 in
                     match uu____8181 with
                     | (head11,args1) ->
                         let uu____8207 = FStar_Syntax_Util.head_and_args t2 in
                         (match uu____8207 with
=======
                     let uu____8242 = solve_prob orig (Some guard) [] wl1 in
                     solve env1 uu____8242
                   else
                     (let uu____8244 =
                        let uu____8245 =
                          FStar_Syntax_Print.term_to_string head1 in
                        let uu____8246 =
                          FStar_Syntax_Print.term_to_string head2 in
                        FStar_Util.format2 "head mismatch (%s vs %s)"
                          uu____8245 uu____8246 in
                      giveup env1 uu____8244 orig)
               | (uu____8247,Some (t11,t21)) ->
                   solve_t env1
                     (let uu___164_8255 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___164_8255.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs = t11;
                        FStar_TypeChecker_Common.relation =
                          (uu___164_8255.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs = t21;
                        FStar_TypeChecker_Common.element =
                          (uu___164_8255.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___164_8255.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___164_8255.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___164_8255.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___164_8255.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___164_8255.FStar_TypeChecker_Common.rank)
                      }) wl1
               | (uu____8256,None ) ->
                   ((let uu____8263 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "Rel") in
                     if uu____8263
                     then
                       let uu____8264 = FStar_Syntax_Print.term_to_string t1 in
                       let uu____8265 = FStar_Syntax_Print.tag_of_term t1 in
                       let uu____8266 = FStar_Syntax_Print.term_to_string t2 in
                       let uu____8267 = FStar_Syntax_Print.tag_of_term t2 in
                       FStar_Util.print4
                         "Head matches: %s (%s) and %s (%s)\n" uu____8264
                         uu____8265 uu____8266 uu____8267
                     else ());
                    (let uu____8269 = FStar_Syntax_Util.head_and_args t1 in
                     match uu____8269 with
                     | (head11,args1) ->
                         let uu____8295 = FStar_Syntax_Util.head_and_args t2 in
                         (match uu____8295 with
>>>>>>> origin/guido_tactics
                          | (head21,args2) ->
                              let nargs = FStar_List.length args1 in
                              if nargs <> (FStar_List.length args2)
                              then
<<<<<<< HEAD
                                let uu____8247 =
                                  let uu____8248 =
                                    FStar_Syntax_Print.term_to_string head11 in
                                  let uu____8249 = args_to_string args1 in
                                  let uu____8250 =
                                    FStar_Syntax_Print.term_to_string head21 in
                                  let uu____8251 = args_to_string args2 in
                                  FStar_Util.format4
                                    "unequal number of arguments: %s[%s] and %s[%s]"
                                    uu____8248 uu____8249 uu____8250
                                    uu____8251 in
                                giveup env1 uu____8247 orig
                              else
                                (let uu____8253 =
                                   (nargs = (Prims.parse_int "0")) ||
                                     (let uu____8257 =
                                        FStar_Syntax_Util.eq_args args1 args2 in
                                      uu____8257 = FStar_Syntax_Util.Equal) in
                                 if uu____8253
                                 then
                                   let uu____8258 =
                                     solve_maybe_uinsts env1 orig head11
                                       head21 wl1 in
                                   match uu____8258 with
                                   | USolved wl2 ->
                                       let uu____8260 =
                                         solve_prob orig None [] wl2 in
                                       solve env1 uu____8260
=======
                                let uu____8340 =
                                  let uu____8341 =
                                    FStar_Syntax_Print.term_to_string head11 in
                                  let uu____8342 = args_to_string args1 in
                                  let uu____8343 =
                                    FStar_Syntax_Print.term_to_string head21 in
                                  let uu____8344 = args_to_string args2 in
                                  FStar_Util.format4
                                    "unequal number of arguments: %s[%s] and %s[%s]"
                                    uu____8341 uu____8342 uu____8343
                                    uu____8344 in
                                giveup env1 uu____8340 orig
                              else
                                (let uu____8346 =
                                   (nargs = (Prims.parse_int "0")) ||
                                     (let uu____8351 =
                                        FStar_Syntax_Util.eq_args args1 args2 in
                                      uu____8351 = FStar_Syntax_Util.Equal) in
                                 if uu____8346
                                 then
                                   let uu____8352 =
                                     solve_maybe_uinsts env1 orig head11
                                       head21 wl1 in
                                   match uu____8352 with
                                   | USolved wl2 ->
                                       let uu____8354 =
                                         solve_prob orig None [] wl2 in
                                       solve env1 uu____8354
>>>>>>> origin/guido_tactics
                                   | UFailed msg -> giveup env1 msg orig
                                   | UDeferred wl2 ->
                                       solve env1
                                         (defer "universe constraints" orig
                                            wl2)
                                 else
<<<<<<< HEAD
                                   (let uu____8264 =
                                      base_and_refinement env1 wl1 t1 in
                                    match uu____8264 with
                                    | (base1,refinement1) ->
                                        let uu____8290 =
                                          base_and_refinement env1 wl1 t2 in
                                        (match uu____8290 with
=======
                                   (let uu____8358 =
                                      base_and_refinement env1 wl1 t1 in
                                    match uu____8358 with
                                    | (base1,refinement1) ->
                                        let uu____8384 =
                                          base_and_refinement env1 wl1 t2 in
                                        (match uu____8384 with
>>>>>>> origin/guido_tactics
                                         | (base2,refinement2) ->
                                             (match (refinement1,
                                                      refinement2)
                                              with
                                              | (None ,None ) ->
<<<<<<< HEAD
                                                  let uu____8344 =
                                                    solve_maybe_uinsts env1
                                                      orig head11 head21 wl1 in
                                                  (match uu____8344 with
=======
                                                  let uu____8438 =
                                                    solve_maybe_uinsts env1
                                                      orig head11 head21 wl1 in
                                                  (match uu____8438 with
>>>>>>> origin/guido_tactics
                                                   | UFailed msg ->
                                                       giveup env1 msg orig
                                                   | UDeferred wl2 ->
                                                       solve env1
                                                         (defer
                                                            "universe constraints"
                                                            orig wl2)
                                                   | USolved wl2 ->
                                                       let subprobs =
                                                         FStar_List.map2
<<<<<<< HEAD
                                                           (fun uu____8361 
                                                              ->
                                                              fun uu____8362 
                                                                ->
                                                                match 
                                                                  (uu____8361,
                                                                    uu____8362)
                                                                with
                                                                | ((a,uu____8372),
                                                                   (a',uu____8374))
                                                                    ->
                                                                    let uu____8379
=======
                                                           (fun uu____8448 
                                                              ->
                                                              fun uu____8449 
                                                                ->
                                                                match 
                                                                  (uu____8448,
                                                                    uu____8449)
                                                                with
                                                                | ((a,uu____8459),
                                                                   (a',uu____8461))
                                                                    ->
                                                                    let uu____8466
>>>>>>> origin/guido_tactics
                                                                    =
                                                                    mk_problem
                                                                    (p_scope
                                                                    orig)
                                                                    orig a
                                                                    FStar_TypeChecker_Common.EQ
                                                                    a' None
                                                                    "index" in
                                                                    FStar_All.pipe_left
                                                                    (fun
                                                                    _0_56  ->
                                                                    FStar_TypeChecker_Common.TProb
<<<<<<< HEAD
                                                                    _0_49)
                                                                    uu____8379)
                                                           args1 args2 in
                                                       let formula =
                                                         let uu____8385 =
=======
                                                                    _0_56)
                                                                    uu____8466)
                                                           args1 args2 in
                                                       let formula =
                                                         let uu____8472 =
>>>>>>> origin/guido_tactics
                                                           FStar_List.map
                                                             (fun p  ->
                                                                fst
                                                                  (p_guard p))
                                                             subprobs in
                                                         FStar_Syntax_Util.mk_conj_l
<<<<<<< HEAD
                                                           uu____8385 in
=======
                                                           uu____8472 in
>>>>>>> origin/guido_tactics
                                                       let wl3 =
                                                         solve_prob orig
                                                           (Some formula) []
                                                           wl2 in
                                                       solve env1
                                                         (attempt subprobs
                                                            wl3))
<<<<<<< HEAD
                                              | uu____8390 ->
=======
                                              | uu____8476 ->
>>>>>>> origin/guido_tactics
                                                  let lhs =
                                                    force_refinement
                                                      (base1, refinement1) in
                                                  let rhs =
                                                    force_refinement
                                                      (base2, refinement2) in
                                                  solve_t env1
<<<<<<< HEAD
                                                    (let uu___163_8424 =
=======
                                                    (let uu___165_8509 =
>>>>>>> origin/guido_tactics
                                                       problem in
                                                     {
                                                       FStar_TypeChecker_Common.pid
                                                         =
<<<<<<< HEAD
                                                         (uu___163_8424.FStar_TypeChecker_Common.pid);
=======
                                                         (uu___165_8509.FStar_TypeChecker_Common.pid);
>>>>>>> origin/guido_tactics
                                                       FStar_TypeChecker_Common.lhs
                                                         = lhs;
                                                       FStar_TypeChecker_Common.relation
                                                         =
<<<<<<< HEAD
                                                         (uu___163_8424.FStar_TypeChecker_Common.relation);
=======
                                                         (uu___165_8509.FStar_TypeChecker_Common.relation);
>>>>>>> origin/guido_tactics
                                                       FStar_TypeChecker_Common.rhs
                                                         = rhs;
                                                       FStar_TypeChecker_Common.element
                                                         =
<<<<<<< HEAD
                                                         (uu___163_8424.FStar_TypeChecker_Common.element);
                                                       FStar_TypeChecker_Common.logical_guard
                                                         =
                                                         (uu___163_8424.FStar_TypeChecker_Common.logical_guard);
                                                       FStar_TypeChecker_Common.scope
                                                         =
                                                         (uu___163_8424.FStar_TypeChecker_Common.scope);
                                                       FStar_TypeChecker_Common.reason
                                                         =
                                                         (uu___163_8424.FStar_TypeChecker_Common.reason);
                                                       FStar_TypeChecker_Common.loc
                                                         =
                                                         (uu___163_8424.FStar_TypeChecker_Common.loc);
                                                       FStar_TypeChecker_Common.rank
                                                         =
                                                         (uu___163_8424.FStar_TypeChecker_Common.rank)
                                                     }) wl1)))))))) in
        let imitate orig env1 wl1 p =
          let uu____8444 = p in
          match uu____8444 with
          | (((u,k),xs,c),ps,(h,uu____8455,qs)) ->
              let xs1 = sn_binders env1 xs in
              let r = FStar_TypeChecker_Env.get_range env1 in
              let uu____8504 = imitation_sub_probs orig env1 xs1 ps qs in
              (match uu____8504 with
               | (sub_probs,gs_xs,formula) ->
                   let im =
                     let uu____8518 = h gs_xs in
                     let uu____8519 =
                       let uu____8526 =
                         FStar_All.pipe_right
                           (FStar_Syntax_Util.lcomp_of_comp c)
                           (fun _0_50  -> FStar_Util.Inl _0_50) in
                       FStar_All.pipe_right uu____8526
                         (fun _0_51  -> Some _0_51) in
                     FStar_Syntax_Util.abs xs1 uu____8518 uu____8519 in
                   ((let uu____8557 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "Rel") in
                     if uu____8557
                     then
                       let uu____8558 =
                         FStar_Syntax_Print.binders_to_string ", " xs1 in
                       let uu____8559 = FStar_Syntax_Print.comp_to_string c in
                       let uu____8560 = FStar_Syntax_Print.term_to_string im in
                       let uu____8561 = FStar_Syntax_Print.tag_of_term im in
                       let uu____8562 =
                         let uu____8563 =
                           FStar_List.map (prob_to_string env1) sub_probs in
                         FStar_All.pipe_right uu____8563
                           (FStar_String.concat ", ") in
                       let uu____8566 =
=======
                                                         (uu___165_8509.FStar_TypeChecker_Common.element);
                                                       FStar_TypeChecker_Common.logical_guard
                                                         =
                                                         (uu___165_8509.FStar_TypeChecker_Common.logical_guard);
                                                       FStar_TypeChecker_Common.scope
                                                         =
                                                         (uu___165_8509.FStar_TypeChecker_Common.scope);
                                                       FStar_TypeChecker_Common.reason
                                                         =
                                                         (uu___165_8509.FStar_TypeChecker_Common.reason);
                                                       FStar_TypeChecker_Common.loc
                                                         =
                                                         (uu___165_8509.FStar_TypeChecker_Common.loc);
                                                       FStar_TypeChecker_Common.rank
                                                         =
                                                         (uu___165_8509.FStar_TypeChecker_Common.rank)
                                                     }) wl1)))))))) in
        let imitate orig env1 wl1 p =
          let uu____8529 = p in
          match uu____8529 with
          | (((u,k),xs,c),ps,(h,uu____8540,qs)) ->
              let xs1 = sn_binders env1 xs in
              let r = FStar_TypeChecker_Env.get_range env1 in
              let uu____8589 = imitation_sub_probs orig env1 xs1 ps qs in
              (match uu____8589 with
               | (sub_probs,gs_xs,formula) ->
                   let im =
                     let uu____8603 = h gs_xs in
                     let uu____8604 =
                       FStar_All.pipe_right
                         (FStar_Syntax_Util.residual_comp_of_comp c)
                         (fun _0_57  -> Some _0_57) in
                     FStar_Syntax_Util.abs xs1 uu____8603 uu____8604 in
                   ((let uu____8608 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env1)
                         (FStar_Options.Other "Rel") in
                     if uu____8608
                     then
                       let uu____8609 =
                         FStar_Syntax_Print.binders_to_string ", " xs1 in
                       let uu____8610 = FStar_Syntax_Print.comp_to_string c in
                       let uu____8611 = FStar_Syntax_Print.term_to_string im in
                       let uu____8612 = FStar_Syntax_Print.tag_of_term im in
                       let uu____8613 =
                         let uu____8614 =
                           FStar_List.map (prob_to_string env1) sub_probs in
                         FStar_All.pipe_right uu____8614
                           (FStar_String.concat ", ") in
                       let uu____8617 =
>>>>>>> origin/guido_tactics
                         FStar_TypeChecker_Normalize.term_to_string env1
                           formula in
                       FStar_Util.print6
                         "Imitating  binders are {%s}, comp=%s\n\t%s (%s)\nsub_probs = %s\nformula=%s\n"
<<<<<<< HEAD
                         uu____8558 uu____8559 uu____8560 uu____8561
                         uu____8562 uu____8566
=======
                         uu____8609 uu____8610 uu____8611 uu____8612
                         uu____8613 uu____8617
>>>>>>> origin/guido_tactics
                     else ());
                    (let wl2 =
                       solve_prob orig (Some formula) [TERM ((u, k), im)] wl1 in
                     solve env1 (attempt sub_probs wl2)))) in
<<<<<<< HEAD
        let imitate' orig env1 wl1 uu___129_8584 =
          match uu___129_8584 with
          | None  -> giveup env1 "unable to compute subterms" orig
          | Some p -> imitate orig env1 wl1 p in
        let project orig env1 wl1 i p =
          let uu____8613 = p in
          match uu____8613 with
          | ((u,xs,c),ps,(h,matches,qs)) ->
              let r = FStar_TypeChecker_Env.get_range env1 in
              let uu____8671 = FStar_List.nth ps i in
              (match uu____8671 with
               | (pi,uu____8674) ->
                   let uu____8679 = FStar_List.nth xs i in
                   (match uu____8679 with
                    | (xi,uu____8686) ->
                        let rec gs k =
                          let uu____8695 = FStar_Syntax_Util.arrow_formals k in
                          match uu____8695 with
=======
        let imitate' orig env1 wl1 uu___131_8635 =
          match uu___131_8635 with
          | None  -> giveup env1 "unable to compute subterms" orig
          | Some p -> imitate orig env1 wl1 p in
        let project orig env1 wl1 i p =
          let uu____8664 = p in
          match uu____8664 with
          | ((u,xs,c),ps,(h,matches,qs)) ->
              let r = FStar_TypeChecker_Env.get_range env1 in
              let uu____8722 = FStar_List.nth ps i in
              (match uu____8722 with
               | (pi,uu____8725) ->
                   let uu____8730 = FStar_List.nth xs i in
                   (match uu____8730 with
                    | (xi,uu____8737) ->
                        let rec gs k =
                          let uu____8746 = FStar_Syntax_Util.arrow_formals k in
                          match uu____8746 with
>>>>>>> origin/guido_tactics
                          | (bs,k1) ->
                              let rec aux subst1 bs1 =
                                match bs1 with
                                | [] -> ([], [])
<<<<<<< HEAD
                                | (a,uu____8747)::tl1 ->
                                    let k_a =
                                      FStar_Syntax_Subst.subst subst1
                                        a.FStar_Syntax_Syntax.sort in
                                    let uu____8755 = new_uvar r xs k_a in
                                    (match uu____8755 with
=======
                                | (a,uu____8798)::tl1 ->
                                    let k_a =
                                      FStar_Syntax_Subst.subst subst1
                                        a.FStar_Syntax_Syntax.sort in
                                    let uu____8806 = new_uvar r xs k_a in
                                    (match uu____8806 with
>>>>>>> origin/guido_tactics
                                     | (gi_xs,gi) ->
                                         let gi_xs1 =
                                           FStar_TypeChecker_Normalize.eta_expand
                                             env1 gi_xs in
                                         let gi_ps =
                                           FStar_Syntax_Syntax.mk_Tm_app gi
                                             ps
                                             (Some
                                                (k_a.FStar_Syntax_Syntax.n))
                                             r in
                                         let subst2 =
                                           (FStar_Syntax_Syntax.NT
                                              (a, gi_xs1))
                                           :: subst1 in
<<<<<<< HEAD
                                         let uu____8772 = aux subst2 tl1 in
                                         (match uu____8772 with
                                          | (gi_xs',gi_ps') ->
                                              let uu____8787 =
                                                let uu____8789 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    gi_xs1 in
                                                uu____8789 :: gi_xs' in
                                              let uu____8790 =
                                                let uu____8792 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    gi_ps in
                                                uu____8792 :: gi_ps' in
                                              (uu____8787, uu____8790))) in
                              aux [] bs in
                        let uu____8795 =
                          let uu____8796 = matches pi in
                          FStar_All.pipe_left Prims.op_Negation uu____8796 in
                        if uu____8795
                        then None
                        else
                          (let uu____8799 = gs xi.FStar_Syntax_Syntax.sort in
                           match uu____8799 with
                           | (g_xs,uu____8806) ->
                               let xi1 = FStar_Syntax_Syntax.bv_to_name xi in
                               let proj =
                                 let uu____8813 =
                                   FStar_Syntax_Syntax.mk_Tm_app xi1 g_xs
                                     None r in
                                 let uu____8816 =
                                   let uu____8823 =
                                     FStar_All.pipe_right
                                       (FStar_Syntax_Util.lcomp_of_comp c)
                                       (fun _0_52  -> FStar_Util.Inl _0_52) in
                                   FStar_All.pipe_right uu____8823
                                     (fun _0_53  -> Some _0_53) in
                                 FStar_Syntax_Util.abs xs uu____8813
                                   uu____8816 in
                               let sub1 =
                                 let uu____8854 =
                                   let uu____8857 =
                                     FStar_Syntax_Syntax.mk_Tm_app proj ps
                                       None r in
                                   let uu____8862 =
                                     let uu____8865 =
                                       FStar_List.map
                                         (fun uu____8875  ->
                                            match uu____8875 with
                                            | (uu____8880,uu____8881,y) -> y)
                                         qs in
                                     FStar_All.pipe_left h uu____8865 in
                                   mk_problem (p_scope orig) orig uu____8857
                                     (p_rel orig) uu____8862 None
                                     "projection" in
                                 FStar_All.pipe_left
                                   (fun _0_54  ->
                                      FStar_TypeChecker_Common.TProb _0_54)
                                   uu____8854 in
                               ((let uu____8891 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env1)
                                     (FStar_Options.Other "Rel") in
                                 if uu____8891
                                 then
                                   let uu____8892 =
                                     FStar_Syntax_Print.term_to_string proj in
                                   let uu____8893 = prob_to_string env1 sub1 in
                                   FStar_Util.print2
                                     "Projecting %s\n\tsubprob=%s\n"
                                     uu____8892 uu____8893
                                 else ());
                                (let wl2 =
                                   let uu____8896 =
                                     let uu____8898 =
                                       FStar_All.pipe_left
                                         FStar_Pervasives.fst (p_guard sub1) in
                                     Some uu____8898 in
                                   solve_prob orig uu____8896
                                     [TERM (u, proj)] wl1 in
                                 let uu____8903 =
                                   solve env1 (attempt [sub1] wl2) in
                                 FStar_All.pipe_left
                                   (fun _0_55  -> Some _0_55) uu____8903))))) in
        let solve_t_flex_rigid patterns_only orig lhs t2 wl1 =
          let uu____8927 = lhs in
          match uu____8927 with
          | ((t1,uv,k_uv,args_lhs),maybe_pat_vars) ->
              let subterms ps =
                let uu____8950 = FStar_Syntax_Util.arrow_formals_comp k_uv in
                match uu____8950 with
                | (xs,c) ->
                    if (FStar_List.length xs) = (FStar_List.length ps)
                    then
                      let uu____8972 =
                        let uu____8998 = decompose env t2 in
                        (((uv, k_uv), xs, c), ps, uu____8998) in
                      Some uu____8972
=======
                                         let uu____8825 = aux subst2 tl1 in
                                         (match uu____8825 with
                                          | (gi_xs',gi_ps') ->
                                              let uu____8840 =
                                                let uu____8842 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    gi_xs1 in
                                                uu____8842 :: gi_xs' in
                                              let uu____8843 =
                                                let uu____8845 =
                                                  FStar_Syntax_Syntax.as_arg
                                                    gi_ps in
                                                uu____8845 :: gi_ps' in
                                              (uu____8840, uu____8843))) in
                              aux [] bs in
                        let uu____8848 =
                          let uu____8849 = matches pi in
                          FStar_All.pipe_left Prims.op_Negation uu____8849 in
                        if uu____8848
                        then None
                        else
                          (let uu____8852 = gs xi.FStar_Syntax_Syntax.sort in
                           match uu____8852 with
                           | (g_xs,uu____8859) ->
                               let xi1 = FStar_Syntax_Syntax.bv_to_name xi in
                               let proj =
                                 let uu____8866 =
                                   (FStar_Syntax_Syntax.mk_Tm_app xi1 g_xs)
                                     None r in
                                 let uu____8871 =
                                   FStar_All.pipe_right
                                     (FStar_Syntax_Util.residual_comp_of_comp
                                        c) (fun _0_58  -> Some _0_58) in
                                 FStar_Syntax_Util.abs xs uu____8866
                                   uu____8871 in
                               let sub1 =
                                 let uu____8875 =
                                   let uu____8878 =
                                     (FStar_Syntax_Syntax.mk_Tm_app proj ps)
                                       None r in
                                   let uu____8885 =
                                     let uu____8888 =
                                       FStar_List.map
                                         (fun uu____8894  ->
                                            match uu____8894 with
                                            | (uu____8899,uu____8900,y) -> y)
                                         qs in
                                     FStar_All.pipe_left h uu____8888 in
                                   mk_problem (p_scope orig) orig uu____8878
                                     (p_rel orig) uu____8885 None
                                     "projection" in
                                 FStar_All.pipe_left
                                   (fun _0_59  ->
                                      FStar_TypeChecker_Common.TProb _0_59)
                                   uu____8875 in
                               ((let uu____8910 =
                                   FStar_All.pipe_left
                                     (FStar_TypeChecker_Env.debug env1)
                                     (FStar_Options.Other "Rel") in
                                 if uu____8910
                                 then
                                   let uu____8911 =
                                     FStar_Syntax_Print.term_to_string proj in
                                   let uu____8912 = prob_to_string env1 sub1 in
                                   FStar_Util.print2
                                     "Projecting %s\n\tsubprob=%s\n"
                                     uu____8911 uu____8912
                                 else ());
                                (let wl2 =
                                   let uu____8915 =
                                     let uu____8917 =
                                       FStar_All.pipe_left
                                         FStar_Pervasives.fst (p_guard sub1) in
                                     Some uu____8917 in
                                   solve_prob orig uu____8915
                                     [TERM (u, proj)] wl1 in
                                 let uu____8922 =
                                   solve env1 (attempt [sub1] wl2) in
                                 FStar_All.pipe_left
                                   (fun _0_60  -> Some _0_60) uu____8922))))) in
        let solve_t_flex_rigid patterns_only orig lhs t2 wl1 =
          let uu____8946 = lhs in
          match uu____8946 with
          | ((t1,uv,k_uv,args_lhs),maybe_pat_vars) ->
              let subterms ps =
                let uu____8969 = FStar_Syntax_Util.arrow_formals_comp k_uv in
                match uu____8969 with
                | (xs,c) ->
                    if (FStar_List.length xs) = (FStar_List.length ps)
                    then
                      let uu____8995 =
                        let uu____9021 = decompose env t2 in
                        (((uv, k_uv), xs, c), ps, uu____9021) in
                      Some uu____8995
>>>>>>> origin/guido_tactics
                    else
                      (let k_uv1 =
                         FStar_TypeChecker_Normalize.normalize
                           [FStar_TypeChecker_Normalize.Beta] env k_uv in
                       let rec elim k args =
<<<<<<< HEAD
                         let uu____9081 =
                           let uu____9085 =
                             let uu____9086 = FStar_Syntax_Subst.compress k in
                             uu____9086.FStar_Syntax_Syntax.n in
                           (uu____9085, args) in
                         match uu____9081 with
                         | (uu____9093,[]) ->
                             let uu____9095 =
                               let uu____9101 =
                                 FStar_Syntax_Syntax.mk_Total k in
                               ([], uu____9101) in
                             Some uu____9095
                         | (FStar_Syntax_Syntax.Tm_uvar
                            uu____9112,uu____9113) ->
                             let uu____9126 =
                               FStar_Syntax_Util.head_and_args k in
                             (match uu____9126 with
                              | (uv1,uv_args) ->
                                  let uu____9155 =
                                    let uu____9156 =
                                      FStar_Syntax_Subst.compress uv1 in
                                    uu____9156.FStar_Syntax_Syntax.n in
                                  (match uu____9155 with
                                   | FStar_Syntax_Syntax.Tm_uvar
                                       (uvar,uu____9163) ->
                                       let uu____9180 =
                                         pat_vars env [] uv_args in
                                       (match uu____9180 with
=======
                         let uu____9104 =
                           let uu____9108 =
                             let uu____9109 = FStar_Syntax_Subst.compress k in
                             uu____9109.FStar_Syntax_Syntax.n in
                           (uu____9108, args) in
                         match uu____9104 with
                         | (uu____9116,[]) ->
                             let uu____9118 =
                               let uu____9124 =
                                 FStar_Syntax_Syntax.mk_Total k in
                               ([], uu____9124) in
                             Some uu____9118
                         | (FStar_Syntax_Syntax.Tm_uvar
                            uu____9135,uu____9136) ->
                             let uu____9147 =
                               FStar_Syntax_Util.head_and_args k in
                             (match uu____9147 with
                              | (uv1,uv_args) ->
                                  let uu____9176 =
                                    let uu____9177 =
                                      FStar_Syntax_Subst.compress uv1 in
                                    uu____9177.FStar_Syntax_Syntax.n in
                                  (match uu____9176 with
                                   | FStar_Syntax_Syntax.Tm_uvar
                                       (uvar,uu____9184) ->
                                       let uu____9197 =
                                         pat_vars env [] uv_args in
                                       (match uu____9197 with
>>>>>>> origin/guido_tactics
                                        | None  -> None
                                        | Some scope ->
                                            let xs1 =
                                              FStar_All.pipe_right args
                                                (FStar_List.map
<<<<<<< HEAD
                                                   (fun uu____9196  ->
                                                      let uu____9197 =
                                                        let uu____9198 =
                                                          let uu____9199 =
                                                            let uu____9202 =
                                                              let uu____9203
=======
                                                   (fun uu____9211  ->
                                                      let uu____9212 =
                                                        let uu____9213 =
                                                          let uu____9214 =
                                                            let uu____9217 =
                                                              let uu____9218
>>>>>>> origin/guido_tactics
                                                                =
                                                                FStar_Syntax_Util.type_u
                                                                  () in
                                                              FStar_All.pipe_right
<<<<<<< HEAD
                                                                uu____9203
=======
                                                                uu____9218
>>>>>>> origin/guido_tactics
                                                                FStar_Pervasives.fst in
                                                            new_uvar
                                                              k.FStar_Syntax_Syntax.pos
                                                              scope
<<<<<<< HEAD
                                                              uu____9202 in
                                                          fst uu____9199 in
                                                        FStar_Syntax_Syntax.new_bv
                                                          (Some
                                                             (k.FStar_Syntax_Syntax.pos))
                                                          uu____9198 in
                                                      FStar_All.pipe_left
                                                        FStar_Syntax_Syntax.mk_binder
                                                        uu____9197)) in
                                            let c1 =
                                              let uu____9209 =
                                                let uu____9210 =
                                                  let uu____9213 =
                                                    let uu____9214 =
                                                      FStar_Syntax_Util.type_u
                                                        () in
                                                    FStar_All.pipe_right
                                                      uu____9214
                                                      FStar_Pervasives.fst in
                                                  new_uvar
                                                    k.FStar_Syntax_Syntax.pos
                                                    scope uu____9213 in
                                                fst uu____9210 in
                                              FStar_Syntax_Syntax.mk_Total
                                                uu____9209 in
                                            let k' =
                                              FStar_Syntax_Util.arrow xs1 c1 in
                                            let uv_sol =
                                              let uu____9223 =
                                                let uu____9230 =
                                                  let uu____9236 =
                                                    let uu____9237 =
                                                      let uu____9240 =
                                                        let uu____9241 =
                                                          FStar_Syntax_Util.type_u
                                                            () in
                                                        FStar_All.pipe_right
                                                          uu____9241
                                                          FStar_Pervasives.fst in
                                                      FStar_Syntax_Syntax.mk_Total
                                                        uu____9240 in
                                                    FStar_All.pipe_left
                                                      FStar_Syntax_Util.lcomp_of_comp
                                                      uu____9237 in
                                                  FStar_Util.Inl uu____9236 in
                                                Some uu____9230 in
                                              FStar_Syntax_Util.abs scope k'
                                                uu____9223 in
                                            (FStar_Syntax_Unionfind.change
                                               uvar uv_sol;
                                             Some (xs1, c1)))
                                   | uu____9261 -> None))
                         | (FStar_Syntax_Syntax.Tm_app uu____9264,uu____9265)
                             ->
                             let uu____9277 =
                               FStar_Syntax_Util.head_and_args k in
                             (match uu____9277 with
                              | (uv1,uv_args) ->
                                  let uu____9306 =
                                    let uu____9307 =
                                      FStar_Syntax_Subst.compress uv1 in
                                    uu____9307.FStar_Syntax_Syntax.n in
                                  (match uu____9306 with
                                   | FStar_Syntax_Syntax.Tm_uvar
                                       (uvar,uu____9314) ->
                                       let uu____9331 =
                                         pat_vars env [] uv_args in
                                       (match uu____9331 with
=======
                                                              uu____9217 in
                                                          fst uu____9214 in
                                                        FStar_Syntax_Syntax.new_bv
                                                          (Some
                                                             (k.FStar_Syntax_Syntax.pos))
                                                          uu____9213 in
                                                      FStar_All.pipe_left
                                                        FStar_Syntax_Syntax.mk_binder
                                                        uu____9212)) in
                                            let c1 =
                                              let uu____9224 =
                                                let uu____9225 =
                                                  let uu____9228 =
                                                    let uu____9229 =
                                                      FStar_Syntax_Util.type_u
                                                        () in
                                                    FStar_All.pipe_right
                                                      uu____9229
                                                      FStar_Pervasives.fst in
                                                  new_uvar
                                                    k.FStar_Syntax_Syntax.pos
                                                    scope uu____9228 in
                                                fst uu____9225 in
                                              FStar_Syntax_Syntax.mk_Total
                                                uu____9224 in
                                            let k' =
                                              FStar_Syntax_Util.arrow xs1 c1 in
                                            let uv_sol =
                                              let uu____9238 =
                                                let uu____9240 =
                                                  let uu____9241 =
                                                    let uu____9244 =
                                                      FStar_Syntax_Util.type_u
                                                        () in
                                                    FStar_All.pipe_right
                                                      uu____9244
                                                      FStar_Pervasives.fst in
                                                  FStar_Syntax_Util.residual_tot
                                                    uu____9241 in
                                                Some uu____9240 in
                                              FStar_Syntax_Util.abs scope k'
                                                uu____9238 in
                                            (FStar_Syntax_Unionfind.change
                                               uvar uv_sol;
                                             Some (xs1, c1)))
                                   | uu____9254 -> None))
                         | (FStar_Syntax_Syntax.Tm_app uu____9257,uu____9258)
                             ->
                             let uu____9270 =
                               FStar_Syntax_Util.head_and_args k in
                             (match uu____9270 with
                              | (uv1,uv_args) ->
                                  let uu____9299 =
                                    let uu____9300 =
                                      FStar_Syntax_Subst.compress uv1 in
                                    uu____9300.FStar_Syntax_Syntax.n in
                                  (match uu____9299 with
                                   | FStar_Syntax_Syntax.Tm_uvar
                                       (uvar,uu____9307) ->
                                       let uu____9320 =
                                         pat_vars env [] uv_args in
                                       (match uu____9320 with
>>>>>>> origin/guido_tactics
                                        | None  -> None
                                        | Some scope ->
                                            let xs1 =
                                              FStar_All.pipe_right args
                                                (FStar_List.map
<<<<<<< HEAD
                                                   (fun uu____9347  ->
                                                      let uu____9348 =
                                                        let uu____9349 =
                                                          let uu____9350 =
                                                            let uu____9353 =
                                                              let uu____9354
=======
                                                   (fun uu____9334  ->
                                                      let uu____9335 =
                                                        let uu____9336 =
                                                          let uu____9337 =
                                                            let uu____9340 =
                                                              let uu____9341
>>>>>>> origin/guido_tactics
                                                                =
                                                                FStar_Syntax_Util.type_u
                                                                  () in
                                                              FStar_All.pipe_right
<<<<<<< HEAD
                                                                uu____9354
=======
                                                                uu____9341
>>>>>>> origin/guido_tactics
                                                                FStar_Pervasives.fst in
                                                            new_uvar
                                                              k.FStar_Syntax_Syntax.pos
                                                              scope
<<<<<<< HEAD
                                                              uu____9353 in
                                                          fst uu____9350 in
                                                        FStar_Syntax_Syntax.new_bv
                                                          (Some
                                                             (k.FStar_Syntax_Syntax.pos))
                                                          uu____9349 in
                                                      FStar_All.pipe_left
                                                        FStar_Syntax_Syntax.mk_binder
                                                        uu____9348)) in
                                            let c1 =
                                              let uu____9360 =
                                                let uu____9361 =
                                                  let uu____9364 =
                                                    let uu____9365 =
                                                      FStar_Syntax_Util.type_u
                                                        () in
                                                    FStar_All.pipe_right
                                                      uu____9365
                                                      FStar_Pervasives.fst in
                                                  new_uvar
                                                    k.FStar_Syntax_Syntax.pos
                                                    scope uu____9364 in
                                                fst uu____9361 in
                                              FStar_Syntax_Syntax.mk_Total
                                                uu____9360 in
                                            let k' =
                                              FStar_Syntax_Util.arrow xs1 c1 in
                                            let uv_sol =
                                              let uu____9374 =
                                                let uu____9381 =
                                                  let uu____9387 =
                                                    let uu____9388 =
                                                      let uu____9391 =
                                                        let uu____9392 =
                                                          FStar_Syntax_Util.type_u
                                                            () in
                                                        FStar_All.pipe_right
                                                          uu____9392
                                                          FStar_Pervasives.fst in
                                                      FStar_Syntax_Syntax.mk_Total
                                                        uu____9391 in
                                                    FStar_All.pipe_left
                                                      FStar_Syntax_Util.lcomp_of_comp
                                                      uu____9388 in
                                                  FStar_Util.Inl uu____9387 in
                                                Some uu____9381 in
                                              FStar_Syntax_Util.abs scope k'
                                                uu____9374 in
                                            (FStar_Syntax_Unionfind.change
                                               uvar uv_sol;
                                             Some (xs1, c1)))
                                   | uu____9412 -> None))
                         | (FStar_Syntax_Syntax.Tm_arrow (xs1,c1),uu____9417)
=======
                                                              uu____9340 in
                                                          fst uu____9337 in
                                                        FStar_Syntax_Syntax.new_bv
                                                          (Some
                                                             (k.FStar_Syntax_Syntax.pos))
                                                          uu____9336 in
                                                      FStar_All.pipe_left
                                                        FStar_Syntax_Syntax.mk_binder
                                                        uu____9335)) in
                                            let c1 =
                                              let uu____9347 =
                                                let uu____9348 =
                                                  let uu____9351 =
                                                    let uu____9352 =
                                                      FStar_Syntax_Util.type_u
                                                        () in
                                                    FStar_All.pipe_right
                                                      uu____9352
                                                      FStar_Pervasives.fst in
                                                  new_uvar
                                                    k.FStar_Syntax_Syntax.pos
                                                    scope uu____9351 in
                                                fst uu____9348 in
                                              FStar_Syntax_Syntax.mk_Total
                                                uu____9347 in
                                            let k' =
                                              FStar_Syntax_Util.arrow xs1 c1 in
                                            let uv_sol =
                                              let uu____9361 =
                                                let uu____9363 =
                                                  let uu____9364 =
                                                    let uu____9367 =
                                                      FStar_Syntax_Util.type_u
                                                        () in
                                                    FStar_All.pipe_right
                                                      uu____9367
                                                      FStar_Pervasives.fst in
                                                  FStar_Syntax_Util.residual_tot
                                                    uu____9364 in
                                                Some uu____9363 in
                                              FStar_Syntax_Util.abs scope k'
                                                uu____9361 in
                                            (FStar_Syntax_Unionfind.change
                                               uvar uv_sol;
                                             Some (xs1, c1)))
                                   | uu____9377 -> None))
                         | (FStar_Syntax_Syntax.Tm_arrow (xs1,c1),uu____9382)
>>>>>>> origin/guido_tactics
                             ->
                             let n_args = FStar_List.length args in
                             let n_xs = FStar_List.length xs1 in
                             if n_xs = n_args
                             then
<<<<<<< HEAD
                               let uu____9443 =
                                 FStar_Syntax_Subst.open_comp xs1 c1 in
                               FStar_All.pipe_right uu____9443
                                 (fun _0_56  -> Some _0_56)
                             else
                               if n_xs < n_args
                               then
                                 (let uu____9462 =
                                    FStar_Util.first_N n_xs args in
                                  match uu____9462 with
                                  | (args1,rest) ->
                                      let uu____9478 =
                                        FStar_Syntax_Subst.open_comp xs1 c1 in
                                      (match uu____9478 with
                                       | (xs2,c2) ->
                                           let uu____9486 =
                                             elim
                                               (FStar_Syntax_Util.comp_result
                                                  c2) rest in
                                           FStar_Util.bind_opt uu____9486
                                             (fun uu____9500  ->
                                                match uu____9500 with
=======
                               let uu____9414 =
                                 FStar_Syntax_Subst.open_comp xs1 c1 in
                               FStar_All.pipe_right uu____9414
                                 (fun _0_61  -> Some _0_61)
                             else
                               if n_xs < n_args
                               then
                                 (let uu____9438 =
                                    FStar_Util.first_N n_xs args in
                                  match uu____9438 with
                                  | (args1,rest) ->
                                      let uu____9456 =
                                        FStar_Syntax_Subst.open_comp xs1 c1 in
                                      (match uu____9456 with
                                       | (xs2,c2) ->
                                           let uu____9464 =
                                             elim
                                               (FStar_Syntax_Util.comp_result
                                                  c2) rest in
                                           FStar_Util.bind_opt uu____9464
                                             (fun uu____9475  ->
                                                match uu____9475 with
>>>>>>> origin/guido_tactics
                                                | (xs',c3) ->
                                                    Some
                                                      ((FStar_List.append xs2
                                                          xs'), c3))))
                               else
<<<<<<< HEAD
                                 (let uu____9522 =
                                    FStar_Util.first_N n_args xs1 in
                                  match uu____9522 with
=======
                                 (let uu____9497 =
                                    FStar_Util.first_N n_args xs1 in
                                  match uu____9497 with
>>>>>>> origin/guido_tactics
                                  | (xs2,rest) ->
                                      let t =
                                        FStar_Syntax_Syntax.mk
                                          (FStar_Syntax_Syntax.Tm_arrow
                                             (rest, c1)) None
                                          k.FStar_Syntax_Syntax.pos in
<<<<<<< HEAD
                                      let uu____9564 =
                                        let uu____9567 =
                                          FStar_Syntax_Syntax.mk_Total t in
                                        FStar_Syntax_Subst.open_comp xs2
                                          uu____9567 in
                                      FStar_All.pipe_right uu____9564
                                        (fun _0_57  -> Some _0_57))
                         | uu____9575 ->
                             let uu____9579 =
                               let uu____9580 =
                                 FStar_Syntax_Print.uvar_to_string uv in
                               let uu____9581 =
                                 FStar_Syntax_Print.term_to_string k in
                               let uu____9582 =
                                 FStar_Syntax_Print.term_to_string k_uv1 in
                               FStar_Util.format3
                                 "Impossible: ill-typed application %s : %s\n\t%s"
                                 uu____9580 uu____9581 uu____9582 in
                             failwith uu____9579 in
                       let uu____9586 = elim k_uv1 ps in
                       FStar_Util.bind_opt uu____9586
                         (fun uu____9618  ->
                            match uu____9618 with
                            | (xs1,c1) ->
                                let uu____9646 =
                                  let uu____9669 = decompose env t2 in
                                  (((uv, k_uv1), xs1, c1), ps, uu____9669) in
                                Some uu____9646)) in
=======
                                      let uu____9545 =
                                        let uu____9548 =
                                          FStar_Syntax_Syntax.mk_Total t in
                                        FStar_Syntax_Subst.open_comp xs2
                                          uu____9548 in
                                      FStar_All.pipe_right uu____9545
                                        (fun _0_62  -> Some _0_62))
                         | uu____9556 ->
                             let uu____9560 =
                               let uu____9561 =
                                 FStar_Syntax_Print.uvar_to_string uv in
                               let uu____9562 =
                                 FStar_Syntax_Print.term_to_string k in
                               let uu____9563 =
                                 FStar_Syntax_Print.term_to_string k_uv1 in
                               FStar_Util.format3
                                 "Impossible: ill-typed application %s : %s\n\t%s"
                                 uu____9561 uu____9562 uu____9563 in
                             failwith uu____9560 in
                       let uu____9567 = elim k_uv1 ps in
                       FStar_Util.bind_opt uu____9567
                         (fun uu____9595  ->
                            match uu____9595 with
                            | (xs1,c1) ->
                                let uu____9623 =
                                  let uu____9646 = decompose env t2 in
                                  (((uv, k_uv1), xs1, c1), ps, uu____9646) in
                                Some uu____9623)) in
>>>>>>> origin/guido_tactics
              let rec imitate_or_project n1 stopt i =
                if (i >= n1) || (FStar_Option.isNone stopt)
                then
                  giveup env
                    "flex-rigid case failed all backtracking attempts" orig
                else
                  (let st = FStar_Option.get stopt in
                   let tx = FStar_Syntax_Unionfind.new_transaction () in
                   if i = (- (Prims.parse_int "1"))
                   then
<<<<<<< HEAD
                     let uu____9741 = imitate orig env wl1 st in
                     match uu____9741 with
                     | Failed uu____9746 ->
=======
                     let uu____9718 = imitate orig env wl1 st in
                     match uu____9718 with
                     | Failed uu____9723 ->
>>>>>>> origin/guido_tactics
                         (FStar_Syntax_Unionfind.rollback tx;
                          imitate_or_project n1 stopt
                            (i + (Prims.parse_int "1")))
                     | sol -> sol
                   else
<<<<<<< HEAD
                     (let uu____9752 = project orig env wl1 i st in
                      match uu____9752 with
=======
                     (let uu____9729 = project orig env wl1 i st in
                      match uu____9729 with
>>>>>>> origin/guido_tactics
                      | None  ->
                          (FStar_Syntax_Unionfind.rollback tx;
                           imitate_or_project n1 stopt
                             (i + (Prims.parse_int "1")))
<<<<<<< HEAD
                      | Some (Failed uu____9759) ->
=======
                      | Some (Failed uu____9736) ->
>>>>>>> origin/guido_tactics
                          (FStar_Syntax_Unionfind.rollback tx;
                           imitate_or_project n1 stopt
                             (i + (Prims.parse_int "1")))
                      | Some sol -> sol)) in
              let check_head fvs1 t21 =
<<<<<<< HEAD
                let uu____9773 = FStar_Syntax_Util.head_and_args t21 in
                match uu____9773 with
                | (hd1,uu____9784) ->
                    (match hd1.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_arrow uu____9799 -> true
                     | FStar_Syntax_Syntax.Tm_constant uu____9807 -> true
                     | FStar_Syntax_Syntax.Tm_abs uu____9808 -> true
                     | uu____9823 ->
                         let fvs_hd = FStar_Syntax_Free.names hd1 in
                         let uu____9826 =
                           FStar_Util.set_is_subset_of fvs_hd fvs1 in
                         if uu____9826
                         then true
                         else
                           ((let uu____9829 =
                               FStar_All.pipe_left
                                 (FStar_TypeChecker_Env.debug env)
                                 (FStar_Options.Other "Rel") in
                             if uu____9829
                             then
                               let uu____9830 = names_to_string fvs_hd in
                               FStar_Util.print1 "Free variables are %s"
                                 uu____9830
=======
                let uu____9750 = FStar_Syntax_Util.head_and_args t21 in
                match uu____9750 with
                | (hd1,uu____9761) ->
                    (match hd1.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_arrow uu____9776 -> true
                     | FStar_Syntax_Syntax.Tm_constant uu____9784 -> true
                     | FStar_Syntax_Syntax.Tm_abs uu____9785 -> true
                     | uu____9795 ->
                         let fvs_hd = FStar_Syntax_Free.names hd1 in
                         let uu____9798 =
                           FStar_Util.set_is_subset_of fvs_hd fvs1 in
                         if uu____9798
                         then true
                         else
                           ((let uu____9801 =
                               FStar_All.pipe_left
                                 (FStar_TypeChecker_Env.debug env)
                                 (FStar_Options.Other "Rel") in
                             if uu____9801
                             then
                               let uu____9802 = names_to_string fvs_hd in
                               FStar_Util.print1 "Free variables are %s"
                                 uu____9802
>>>>>>> origin/guido_tactics
                             else ());
                            false)) in
              let imitate_ok t21 =
                let fvs_hd =
<<<<<<< HEAD
                  let uu____9838 =
                    let uu____9841 = FStar_Syntax_Util.head_and_args t21 in
                    FStar_All.pipe_right uu____9841 FStar_Pervasives.fst in
                  FStar_All.pipe_right uu____9838 FStar_Syntax_Free.names in
                let uu____9872 = FStar_Util.set_is_empty fvs_hd in
                if uu____9872
=======
                  let uu____9810 =
                    let uu____9813 = FStar_Syntax_Util.head_and_args t21 in
                    FStar_All.pipe_right uu____9813 FStar_Pervasives.fst in
                  FStar_All.pipe_right uu____9810 FStar_Syntax_Free.names in
                let uu____9844 = FStar_Util.set_is_empty fvs_hd in
                if uu____9844
>>>>>>> origin/guido_tactics
                then - (Prims.parse_int "1")
                else Prims.parse_int "0" in
              (match maybe_pat_vars with
               | Some vars ->
                   let t11 = sn env t1 in
                   let t21 = sn env t2 in
                   let fvs1 = FStar_Syntax_Free.names t11 in
                   let fvs2 = FStar_Syntax_Free.names t21 in
<<<<<<< HEAD
                   let uu____9881 = occurs_check env wl1 (uv, k_uv) t21 in
                   (match uu____9881 with
                    | (occurs_ok,msg) ->
                        if Prims.op_Negation occurs_ok
                        then
                          let uu____9889 =
                            let uu____9890 = FStar_Option.get msg in
                            Prims.strcat "occurs-check failed: " uu____9890 in
                          giveup_or_defer1 orig uu____9889
                        else
                          (let uu____9892 =
                             FStar_Util.set_is_subset_of fvs2 fvs1 in
                           if uu____9892
                           then
                             let uu____9893 =
=======
                   let uu____9853 = occurs_check env wl1 (uv, k_uv) t21 in
                   (match uu____9853 with
                    | (occurs_ok,msg) ->
                        if Prims.op_Negation occurs_ok
                        then
                          let uu____9861 =
                            let uu____9862 = FStar_Option.get msg in
                            Prims.strcat "occurs-check failed: " uu____9862 in
                          giveup_or_defer1 orig uu____9861
                        else
                          (let uu____9864 =
                             FStar_Util.set_is_subset_of fvs2 fvs1 in
                           if uu____9864
                           then
                             let uu____9865 =
>>>>>>> origin/guido_tactics
                               ((Prims.op_Negation patterns_only) &&
                                  (FStar_Syntax_Util.is_function_typ t21))
                                 &&
                                 ((p_rel orig) <> FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                             (if uu____9893
                              then
                                let uu____9894 = subterms args_lhs in
                                imitate' orig env wl1 uu____9894
                              else
                                ((let uu____9898 =
                                    FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "Rel") in
                                  if uu____9898
                                  then
                                    let uu____9899 =
                                      FStar_Syntax_Print.term_to_string t11 in
                                    let uu____9900 = names_to_string fvs1 in
                                    let uu____9901 = names_to_string fvs2 in
                                    FStar_Util.print3
                                      "Pattern %s with fvars=%s succeeded fvar check: %s\n"
                                      uu____9899 uu____9900 uu____9901
=======
                             (if uu____9865
                              then
                                let uu____9866 = subterms args_lhs in
                                imitate' orig env wl1 uu____9866
                              else
                                ((let uu____9870 =
                                    FStar_All.pipe_left
                                      (FStar_TypeChecker_Env.debug env)
                                      (FStar_Options.Other "Rel") in
                                  if uu____9870
                                  then
                                    let uu____9871 =
                                      FStar_Syntax_Print.term_to_string t11 in
                                    let uu____9872 = names_to_string fvs1 in
                                    let uu____9873 = names_to_string fvs2 in
                                    FStar_Util.print3
                                      "Pattern %s with fvars=%s succeeded fvar check: %s\n"
                                      uu____9871 uu____9872 uu____9873
>>>>>>> origin/guido_tactics
                                  else ());
                                 (let sol =
                                    match vars with
                                    | [] -> t21
<<<<<<< HEAD
                                    | uu____9906 ->
                                        let uu____9907 = sn_binders env vars in
                                        u_abs k_uv uu____9907 t21 in
=======
                                    | uu____9878 ->
                                        let uu____9879 = sn_binders env vars in
                                        u_abs k_uv uu____9879 t21 in
>>>>>>> origin/guido_tactics
                                  let wl2 =
                                    solve_prob orig None
                                      [TERM ((uv, k_uv), sol)] wl1 in
                                  solve env wl2)))
                           else
                             if
                               ((Prims.op_Negation patterns_only) &&
                                  wl1.defer_ok)
                                 &&
                                 ((p_rel orig) <> FStar_TypeChecker_Common.EQ)
                             then
                               solve env
                                 (defer
                                    "flex pattern/rigid: occurs or freevar check"
                                    orig wl1)
                             else
<<<<<<< HEAD
                               (let uu____9916 =
                                  (Prims.op_Negation patterns_only) &&
                                    (check_head fvs1 t21) in
                                if uu____9916
                                then
                                  ((let uu____9918 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        (FStar_Options.Other "Rel") in
                                    if uu____9918
                                    then
                                      let uu____9919 =
                                        FStar_Syntax_Print.term_to_string t11 in
                                      let uu____9920 = names_to_string fvs1 in
                                      let uu____9921 = names_to_string fvs2 in
                                      FStar_Util.print3
                                        "Pattern %s with fvars=%s failed fvar check: %s ... imitating\n"
                                        uu____9919 uu____9920 uu____9921
                                    else ());
                                   (let uu____9923 = subterms args_lhs in
                                    imitate_or_project
                                      (FStar_List.length args_lhs) uu____9923
=======
                               (let uu____9888 =
                                  (Prims.op_Negation patterns_only) &&
                                    (check_head fvs1 t21) in
                                if uu____9888
                                then
                                  ((let uu____9890 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        (FStar_Options.Other "Rel") in
                                    if uu____9890
                                    then
                                      let uu____9891 =
                                        FStar_Syntax_Print.term_to_string t11 in
                                      let uu____9892 = names_to_string fvs1 in
                                      let uu____9893 = names_to_string fvs2 in
                                      FStar_Util.print3
                                        "Pattern %s with fvars=%s failed fvar check: %s ... imitating\n"
                                        uu____9891 uu____9892 uu____9893
                                    else ());
                                   (let uu____9895 = subterms args_lhs in
                                    imitate_or_project
                                      (FStar_List.length args_lhs) uu____9895
>>>>>>> origin/guido_tactics
                                      (- (Prims.parse_int "1"))))
                                else
                                  giveup env
                                    "free-variable check failed on a non-redex"
                                    orig)))
               | None  when patterns_only -> giveup env "not a pattern" orig
               | None  ->
                   if wl1.defer_ok
                   then solve env (defer "not a pattern" orig wl1)
                   else
<<<<<<< HEAD
                     (let uu____9934 =
                        let uu____9935 = FStar_Syntax_Free.names t1 in
                        check_head uu____9935 t2 in
                      if uu____9934
                      then
                        let im_ok = imitate_ok t2 in
                        ((let uu____9939 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env)
                              (FStar_Options.Other "Rel") in
                          if uu____9939
                          then
                            let uu____9940 =
                              FStar_Syntax_Print.term_to_string t1 in
                            FStar_Util.print2 "Not a pattern (%s) ... %s\n"
                              uu____9940
=======
                     (let uu____9909 =
                        let uu____9910 = FStar_Syntax_Free.names t1 in
                        check_head uu____9910 t2 in
                      if uu____9909
                      then
                        let im_ok = imitate_ok t2 in
                        ((let uu____9914 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env)
                              (FStar_Options.Other "Rel") in
                          if uu____9914
                          then
                            let uu____9915 =
                              FStar_Syntax_Print.term_to_string t1 in
                            FStar_Util.print2 "Not a pattern (%s) ... %s\n"
                              uu____9915
>>>>>>> origin/guido_tactics
                              (if im_ok < (Prims.parse_int "0")
                               then "imitating"
                               else "projecting")
                          else ());
<<<<<<< HEAD
                         (let uu____9943 = subterms args_lhs in
                          imitate_or_project (FStar_List.length args_lhs)
                            uu____9943 im_ok))
=======
                         (let uu____9918 = subterms args_lhs in
                          imitate_or_project (FStar_List.length args_lhs)
                            uu____9918 im_ok))
>>>>>>> origin/guido_tactics
                      else giveup env "head-symbol is free" orig)) in
        let flex_flex1 orig lhs rhs =
          if wl.defer_ok && ((p_rel orig) <> FStar_TypeChecker_Common.EQ)
          then solve env (defer "flex-flex deferred" orig wl)
          else
<<<<<<< HEAD
            (let force_quasi_pattern xs_opt uu____9985 =
               match uu____9985 with
=======
            (let force_quasi_pattern xs_opt uu____9963 =
               match uu____9963 with
>>>>>>> origin/guido_tactics
               | (t,u,k,args) ->
                   let k1 =
                     FStar_TypeChecker_Normalize.normalize
                       [FStar_TypeChecker_Normalize.Beta] env k in
<<<<<<< HEAD
                   let uu____10016 = FStar_Syntax_Util.arrow_formals k1 in
                   (match uu____10016 with
                    | (all_formals,uu____10027) ->
=======
                   let uu____9994 = FStar_Syntax_Util.arrow_formals k1 in
                   (match uu____9994 with
                    | (all_formals,uu____10005) ->
>>>>>>> origin/guido_tactics
                        let rec aux pat_args pattern_vars pattern_var_set
                          formals args1 =
                          match (formals, args1) with
                          | ([],[]) ->
                              let pat_args1 =
                                FStar_All.pipe_right
                                  (FStar_List.rev pat_args)
                                  (FStar_List.map
<<<<<<< HEAD
                                     (fun uu____10122  ->
                                        match uu____10122 with
                                        | (x,imp) ->
                                            let uu____10129 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                x in
                                            (uu____10129, imp))) in
                              let pattern_vars1 = FStar_List.rev pattern_vars in
                              let kk =
                                let uu____10137 = FStar_Syntax_Util.type_u () in
                                match uu____10137 with
                                | (t1,uu____10141) ->
                                    let uu____10142 =
                                      new_uvar t1.FStar_Syntax_Syntax.pos
                                        pattern_vars1 t1 in
                                    fst uu____10142 in
                              let uu____10145 =
                                new_uvar t.FStar_Syntax_Syntax.pos
                                  pattern_vars1 kk in
                              (match uu____10145 with
                               | (t',tm_u1) ->
                                   let uu____10152 = destruct_flex_t t' in
                                   (match uu____10152 with
                                    | (uu____10174,u1,k11,uu____10177) ->
                                        let sol =
                                          let uu____10209 =
                                            let uu____10214 =
                                              u_abs k1 all_formals t' in
                                            ((u, k1), uu____10214) in
                                          TERM uu____10209 in
=======
                                     (fun uu____10097  ->
                                        match uu____10097 with
                                        | (x,imp) ->
                                            let uu____10104 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                x in
                                            (uu____10104, imp))) in
                              let pattern_vars1 = FStar_List.rev pattern_vars in
                              let kk =
                                let uu____10112 = FStar_Syntax_Util.type_u () in
                                match uu____10112 with
                                | (t1,uu____10116) ->
                                    let uu____10117 =
                                      new_uvar t1.FStar_Syntax_Syntax.pos
                                        pattern_vars1 t1 in
                                    fst uu____10117 in
                              let uu____10120 =
                                new_uvar t.FStar_Syntax_Syntax.pos
                                  pattern_vars1 kk in
                              (match uu____10120 with
                               | (t',tm_u1) ->
                                   let uu____10127 = destruct_flex_t t' in
                                   (match uu____10127 with
                                    | (uu____10147,u1,k11,uu____10150) ->
                                        let sol =
                                          let uu____10178 =
                                            let uu____10183 =
                                              u_abs k1 all_formals t' in
                                            ((u, k1), uu____10183) in
                                          TERM uu____10178 in
>>>>>>> origin/guido_tactics
                                        let t_app =
                                          FStar_Syntax_Syntax.mk_Tm_app tm_u1
                                            pat_args1 None
                                            t.FStar_Syntax_Syntax.pos in
                                        (sol, (t_app, u1, k11, pat_args1))))
                          | (formal::formals1,hd1::tl1) ->
<<<<<<< HEAD
                              let uu____10276 = pat_var_opt env pat_args hd1 in
                              (match uu____10276 with
=======
                              let uu____10243 = pat_var_opt env pat_args hd1 in
                              (match uu____10243 with
>>>>>>> origin/guido_tactics
                               | None  ->
                                   aux pat_args pattern_vars pattern_var_set
                                     formals1 tl1
                               | Some y ->
                                   let maybe_pat =
                                     match xs_opt with
                                     | None  -> true
                                     | Some xs ->
                                         FStar_All.pipe_right xs
                                           (FStar_Util.for_some
<<<<<<< HEAD
                                              (fun uu____10308  ->
                                                 match uu____10308 with
                                                 | (x,uu____10312) ->
=======
                                              (fun uu____10272  ->
                                                 match uu____10272 with
                                                 | (x,uu____10276) ->
>>>>>>> origin/guido_tactics
                                                     FStar_Syntax_Syntax.bv_eq
                                                       x (fst y))) in
                                   if Prims.op_Negation maybe_pat
                                   then
                                     aux pat_args pattern_vars
                                       pattern_var_set formals1 tl1
                                   else
                                     (let fvs =
                                        FStar_Syntax_Free.names
                                          (fst y).FStar_Syntax_Syntax.sort in
<<<<<<< HEAD
                                      let uu____10318 =
                                        let uu____10319 =
                                          FStar_Util.set_is_subset_of fvs
                                            pattern_var_set in
                                        Prims.op_Negation uu____10319 in
                                      if uu____10318
=======
                                      let uu____10282 =
                                        let uu____10283 =
                                          FStar_Util.set_is_subset_of fvs
                                            pattern_var_set in
                                        Prims.op_Negation uu____10283 in
                                      if uu____10282
>>>>>>> origin/guido_tactics
                                      then
                                        aux pat_args pattern_vars
                                          pattern_var_set formals1 tl1
                                      else
<<<<<<< HEAD
                                        (let uu____10323 =
                                           FStar_Util.set_add (fst formal)
                                             pattern_var_set in
                                         aux (y :: pat_args) (formal ::
                                           pattern_vars) uu____10323 formals1
                                           tl1)))
                          | uu____10329 -> failwith "Impossible" in
                        let uu____10340 = FStar_Syntax_Syntax.new_bv_set () in
                        aux [] [] uu____10340 all_formals args) in
             let solve_both_pats wl1 uu____10380 uu____10381 r =
               match (uu____10380, uu____10381) with
               | ((u1,k1,xs,args1),(u2,k2,ys,args2)) ->
                   let uu____10495 =
                     (FStar_Syntax_Unionfind.equiv u1 u2) &&
                       (binders_eq xs ys) in
                   if uu____10495
                   then
                     let uu____10496 = solve_prob orig None [] wl1 in
                     solve env uu____10496
=======
                                        (let uu____10287 =
                                           FStar_Util.set_add (fst formal)
                                             pattern_var_set in
                                         aux (y :: pat_args) (formal ::
                                           pattern_vars) uu____10287 formals1
                                           tl1)))
                          | uu____10293 -> failwith "Impossible" in
                        let uu____10304 = FStar_Syntax_Syntax.new_bv_set () in
                        aux [] [] uu____10304 all_formals args) in
             let solve_both_pats wl1 uu____10344 uu____10345 r =
               match (uu____10344, uu____10345) with
               | ((u1,k1,xs,args1),(u2,k2,ys,args2)) ->
                   let uu____10459 =
                     (FStar_Syntax_Unionfind.equiv u1 u2) &&
                       (binders_eq xs ys) in
                   if uu____10459
                   then
                     let uu____10460 = solve_prob orig None [] wl1 in
                     solve env uu____10460
>>>>>>> origin/guido_tactics
                   else
                     (let xs1 = sn_binders env xs in
                      let ys1 = sn_binders env ys in
                      let zs = intersect_vars xs1 ys1 in
<<<<<<< HEAD
                      (let uu____10511 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env)
                           (FStar_Options.Other "Rel") in
                       if uu____10511
                       then
                         let uu____10512 =
                           FStar_Syntax_Print.binders_to_string ", " xs1 in
                         let uu____10513 =
                           FStar_Syntax_Print.binders_to_string ", " ys1 in
                         let uu____10514 =
                           FStar_Syntax_Print.binders_to_string ", " zs in
                         let uu____10515 =
                           FStar_Syntax_Print.term_to_string k1 in
                         let uu____10516 =
                           FStar_Syntax_Print.term_to_string k2 in
                         FStar_Util.print5
                           "Flex-flex patterns: intersected %s and %s; got %s\n\tk1=%s\n\tk2=%s\n"
                           uu____10512 uu____10513 uu____10514 uu____10515
                           uu____10516
=======
                      (let uu____10475 =
                         FStar_All.pipe_left
                           (FStar_TypeChecker_Env.debug env)
                           (FStar_Options.Other "Rel") in
                       if uu____10475
                       then
                         let uu____10476 =
                           FStar_Syntax_Print.binders_to_string ", " xs1 in
                         let uu____10477 =
                           FStar_Syntax_Print.binders_to_string ", " ys1 in
                         let uu____10478 =
                           FStar_Syntax_Print.binders_to_string ", " zs in
                         let uu____10479 =
                           FStar_Syntax_Print.term_to_string k1 in
                         let uu____10480 =
                           FStar_Syntax_Print.term_to_string k2 in
                         FStar_Util.print5
                           "Flex-flex patterns: intersected %s and %s; got %s\n\tk1=%s\n\tk2=%s\n"
                           uu____10476 uu____10477 uu____10478 uu____10479
                           uu____10480
>>>>>>> origin/guido_tactics
                       else ());
                      (let subst_k k xs2 args =
                         let xs_len = FStar_List.length xs2 in
                         let args_len = FStar_List.length args in
                         if xs_len = args_len
                         then
<<<<<<< HEAD
                           let uu____10558 =
                             FStar_Syntax_Util.subst_of_list xs2 args in
                           FStar_Syntax_Subst.subst uu____10558 k
                         else
                           if args_len < xs_len
                           then
                             (let uu____10566 =
                                FStar_Util.first_N args_len xs2 in
                              match uu____10566 with
                              | (xs3,xs_rest) ->
                                  let k3 =
                                    let uu____10596 =
                                      FStar_Syntax_Syntax.mk_GTotal k in
                                    FStar_Syntax_Util.arrow xs_rest
                                      uu____10596 in
                                  let uu____10599 =
                                    FStar_Syntax_Util.subst_of_list xs3 args in
                                  FStar_Syntax_Subst.subst uu____10599 k3)
                           else
                             (let uu____10602 =
                                let uu____10603 =
                                  FStar_Syntax_Print.term_to_string k in
                                let uu____10604 =
                                  FStar_Syntax_Print.binders_to_string ", "
                                    xs2 in
                                let uu____10605 =
                                  FStar_Syntax_Print.args_to_string args in
                                FStar_Util.format3
                                  "k=%s\nxs=%s\nargs=%s\nIll-formed substitutution"
                                  uu____10603 uu____10604 uu____10605 in
                              failwith uu____10602) in
                       let uu____10606 =
                         let uu____10612 =
                           let uu____10620 =
                             FStar_TypeChecker_Normalize.normalize
                               [FStar_TypeChecker_Normalize.Beta] env k1 in
                           FStar_Syntax_Util.arrow_formals uu____10620 in
                         match uu____10612 with
                         | (bs,k1') ->
                             let uu____10638 =
                               let uu____10646 =
                                 FStar_TypeChecker_Normalize.normalize
                                   [FStar_TypeChecker_Normalize.Beta] env k2 in
                               FStar_Syntax_Util.arrow_formals uu____10646 in
                             (match uu____10638 with
=======
                           let uu____10528 =
                             FStar_Syntax_Util.subst_of_list xs2 args in
                           FStar_Syntax_Subst.subst uu____10528 k
                         else
                           if args_len < xs_len
                           then
                             (let uu____10541 =
                                FStar_Util.first_N args_len xs2 in
                              match uu____10541 with
                              | (xs3,xs_rest) ->
                                  let k3 =
                                    let uu____10573 =
                                      FStar_Syntax_Syntax.mk_GTotal k in
                                    FStar_Syntax_Util.arrow xs_rest
                                      uu____10573 in
                                  let uu____10576 =
                                    FStar_Syntax_Util.subst_of_list xs3 args in
                                  FStar_Syntax_Subst.subst uu____10576 k3)
                           else
                             (let uu____10579 =
                                let uu____10580 =
                                  FStar_Syntax_Print.term_to_string k in
                                let uu____10581 =
                                  FStar_Syntax_Print.binders_to_string ", "
                                    xs2 in
                                let uu____10582 =
                                  FStar_Syntax_Print.args_to_string args in
                                FStar_Util.format3
                                  "k=%s\nxs=%s\nargs=%s\nIll-formed substitutution"
                                  uu____10580 uu____10581 uu____10582 in
                              failwith uu____10579) in
                       let uu____10583 =
                         let uu____10589 =
                           let uu____10597 =
                             FStar_TypeChecker_Normalize.normalize
                               [FStar_TypeChecker_Normalize.Beta] env k1 in
                           FStar_Syntax_Util.arrow_formals uu____10597 in
                         match uu____10589 with
                         | (bs,k1') ->
                             let uu____10615 =
                               let uu____10623 =
                                 FStar_TypeChecker_Normalize.normalize
                                   [FStar_TypeChecker_Normalize.Beta] env k2 in
                               FStar_Syntax_Util.arrow_formals uu____10623 in
                             (match uu____10615 with
>>>>>>> origin/guido_tactics
                              | (cs,k2') ->
                                  let k1'_xs = subst_k k1' bs args1 in
                                  let k2'_ys = subst_k k2' cs args2 in
                                  let sub_prob =
<<<<<<< HEAD
                                    let uu____10667 =
=======
                                    let uu____10644 =
>>>>>>> origin/guido_tactics
                                      mk_problem (p_scope orig) orig k1'_xs
                                        FStar_TypeChecker_Common.EQ k2'_ys
                                        None "flex-flex kinding" in
                                    FStar_All.pipe_left
<<<<<<< HEAD
                                      (fun _0_58  ->
                                         FStar_TypeChecker_Common.TProb _0_58)
                                      uu____10667 in
                                  let uu____10672 =
                                    let uu____10675 =
                                      let uu____10676 =
                                        FStar_Syntax_Subst.compress k1' in
                                      uu____10676.FStar_Syntax_Syntax.n in
                                    let uu____10679 =
                                      let uu____10680 =
                                        FStar_Syntax_Subst.compress k2' in
                                      uu____10680.FStar_Syntax_Syntax.n in
                                    (uu____10675, uu____10679) in
                                  (match uu____10672 with
                                   | (FStar_Syntax_Syntax.Tm_type
                                      uu____10688,uu____10689) ->
                                       (k1', [sub_prob])
                                   | (uu____10693,FStar_Syntax_Syntax.Tm_type
                                      uu____10694) -> (k2', [sub_prob])
                                   | uu____10698 ->
                                       let uu____10701 =
                                         FStar_Syntax_Util.type_u () in
                                       (match uu____10701 with
                                        | (t,uu____10710) ->
                                            let uu____10711 = new_uvar r zs t in
                                            (match uu____10711 with
                                             | (k_zs,uu____10720) ->
                                                 let kprob =
                                                   let uu____10722 =
=======
                                      (fun _0_63  ->
                                         FStar_TypeChecker_Common.TProb _0_63)
                                      uu____10644 in
                                  let uu____10649 =
                                    let uu____10652 =
                                      let uu____10653 =
                                        FStar_Syntax_Subst.compress k1' in
                                      uu____10653.FStar_Syntax_Syntax.n in
                                    let uu____10656 =
                                      let uu____10657 =
                                        FStar_Syntax_Subst.compress k2' in
                                      uu____10657.FStar_Syntax_Syntax.n in
                                    (uu____10652, uu____10656) in
                                  (match uu____10649 with
                                   | (FStar_Syntax_Syntax.Tm_type
                                      uu____10665,uu____10666) ->
                                       (k1', [sub_prob])
                                   | (uu____10670,FStar_Syntax_Syntax.Tm_type
                                      uu____10671) -> (k2', [sub_prob])
                                   | uu____10675 ->
                                       let uu____10678 =
                                         FStar_Syntax_Util.type_u () in
                                       (match uu____10678 with
                                        | (t,uu____10687) ->
                                            let uu____10688 = new_uvar r zs t in
                                            (match uu____10688 with
                                             | (k_zs,uu____10697) ->
                                                 let kprob =
                                                   let uu____10699 =
>>>>>>> origin/guido_tactics
                                                     mk_problem
                                                       (p_scope orig) orig
                                                       k1'_xs
                                                       FStar_TypeChecker_Common.EQ
                                                       k_zs None
                                                       "flex-flex kinding" in
                                                   FStar_All.pipe_left
                                                     (fun _0_64  ->
                                                        FStar_TypeChecker_Common.TProb
<<<<<<< HEAD
                                                          _0_59) uu____10722 in
                                                 (k_zs, [sub_prob; kprob]))))) in
                       match uu____10606 with
                       | (k_u',sub_probs) ->
                           let uu____10736 =
                             let uu____10744 =
                               let uu____10745 = new_uvar r zs k_u' in
                               FStar_All.pipe_left FStar_Pervasives.fst
                                 uu____10745 in
                             let uu____10750 =
                               let uu____10753 =
                                 FStar_Syntax_Syntax.mk_Total k_u' in
                               FStar_Syntax_Util.arrow xs1 uu____10753 in
                             let uu____10756 =
                               let uu____10759 =
                                 FStar_Syntax_Syntax.mk_Total k_u' in
                               FStar_Syntax_Util.arrow ys1 uu____10759 in
                             (uu____10744, uu____10750, uu____10756) in
                           (match uu____10736 with
                            | (u_zs,knew1,knew2) ->
                                let sub1 = u_abs knew1 xs1 u_zs in
                                let uu____10778 =
                                  occurs_check env wl1 (u1, k1) sub1 in
                                (match uu____10778 with
=======
                                                          _0_64) uu____10699 in
                                                 (k_zs, [sub_prob; kprob]))))) in
                       match uu____10583 with
                       | (k_u',sub_probs) ->
                           let uu____10713 =
                             let uu____10721 =
                               let uu____10722 = new_uvar r zs k_u' in
                               FStar_All.pipe_left FStar_Pervasives.fst
                                 uu____10722 in
                             let uu____10727 =
                               let uu____10730 =
                                 FStar_Syntax_Syntax.mk_Total k_u' in
                               FStar_Syntax_Util.arrow xs1 uu____10730 in
                             let uu____10733 =
                               let uu____10736 =
                                 FStar_Syntax_Syntax.mk_Total k_u' in
                               FStar_Syntax_Util.arrow ys1 uu____10736 in
                             (uu____10721, uu____10727, uu____10733) in
                           (match uu____10713 with
                            | (u_zs,knew1,knew2) ->
                                let sub1 = u_abs knew1 xs1 u_zs in
                                let uu____10755 =
                                  occurs_check env wl1 (u1, k1) sub1 in
                                (match uu____10755 with
>>>>>>> origin/guido_tactics
                                 | (occurs_ok,msg) ->
                                     if Prims.op_Negation occurs_ok
                                     then
                                       giveup_or_defer1 orig
                                         "flex-flex: failed occcurs check"
                                     else
                                       (let sol1 = TERM ((u1, k1), sub1) in
<<<<<<< HEAD
                                        let uu____10790 =
                                          FStar_Syntax_Unionfind.equiv u1 u2 in
                                        if uu____10790
=======
                                        let uu____10767 =
                                          FStar_Syntax_Unionfind.equiv u1 u2 in
                                        if uu____10767
>>>>>>> origin/guido_tactics
                                        then
                                          let wl2 =
                                            solve_prob orig None [sol1] wl1 in
                                          solve env wl2
                                        else
                                          (let sub2 = u_abs knew2 ys1 u_zs in
<<<<<<< HEAD
                                           let uu____10794 =
                                             occurs_check env wl1 (u2, k2)
                                               sub2 in
                                           match uu____10794 with
=======
                                           let uu____10771 =
                                             occurs_check env wl1 (u2, k2)
                                               sub2 in
                                           match uu____10771 with
>>>>>>> origin/guido_tactics
                                           | (occurs_ok1,msg1) ->
                                               if
                                                 Prims.op_Negation occurs_ok1
                                               then
                                                 giveup_or_defer1 orig
                                                   "flex-flex: failed occurs check"
                                               else
                                                 (let sol2 =
                                                    TERM ((u2, k2), sub2) in
                                                  let wl2 =
                                                    solve_prob orig None
                                                      [sol1; sol2] wl1 in
                                                  solve env
                                                    (attempt sub_probs wl2)))))))) in
<<<<<<< HEAD
             let solve_one_pat uu____10826 uu____10827 =
               match (uu____10826, uu____10827) with
               | ((t1,u1,k1,xs),(t2,u2,k2,args2)) ->
                   ((let uu____10891 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Rel") in
                     if uu____10891
                     then
                       let uu____10892 = FStar_Syntax_Print.term_to_string t1 in
                       let uu____10893 = FStar_Syntax_Print.term_to_string t2 in
                       FStar_Util.print2
                         "Trying flex-flex one pattern (%s) with %s\n"
                         uu____10892 uu____10893
                     else ());
                    (let uu____10895 = FStar_Syntax_Unionfind.equiv u1 u2 in
                     if uu____10895
                     then
                       let sub_probs =
                         FStar_List.map2
                           (fun uu____10909  ->
                              fun uu____10910  ->
                                match (uu____10909, uu____10910) with
                                | ((a,uu____10920),(t21,uu____10922)) ->
                                    let uu____10927 =
                                      let uu____10930 =
                                        FStar_Syntax_Syntax.bv_to_name a in
                                      mk_problem (p_scope orig) orig
                                        uu____10930
                                        FStar_TypeChecker_Common.EQ t21 None
                                        "flex-flex index" in
                                    FStar_All.pipe_right uu____10927
                                      (fun _0_60  ->
                                         FStar_TypeChecker_Common.TProb _0_60))
                           xs args2 in
                       let guard =
                         let uu____10934 =
=======
             let solve_one_pat uu____10803 uu____10804 =
               match (uu____10803, uu____10804) with
               | ((t1,u1,k1,xs),(t2,u2,k2,args2)) ->
                   ((let uu____10868 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Rel") in
                     if uu____10868
                     then
                       let uu____10869 = FStar_Syntax_Print.term_to_string t1 in
                       let uu____10870 = FStar_Syntax_Print.term_to_string t2 in
                       FStar_Util.print2
                         "Trying flex-flex one pattern (%s) with %s\n"
                         uu____10869 uu____10870
                     else ());
                    (let uu____10872 = FStar_Syntax_Unionfind.equiv u1 u2 in
                     if uu____10872
                     then
                       let sub_probs =
                         FStar_List.map2
                           (fun uu____10879  ->
                              fun uu____10880  ->
                                match (uu____10879, uu____10880) with
                                | ((a,uu____10890),(t21,uu____10892)) ->
                                    let uu____10897 =
                                      let uu____10900 =
                                        FStar_Syntax_Syntax.bv_to_name a in
                                      mk_problem (p_scope orig) orig
                                        uu____10900
                                        FStar_TypeChecker_Common.EQ t21 None
                                        "flex-flex index" in
                                    FStar_All.pipe_right uu____10897
                                      (fun _0_65  ->
                                         FStar_TypeChecker_Common.TProb _0_65))
                           xs args2 in
                       let guard =
                         let uu____10904 =
>>>>>>> origin/guido_tactics
                           FStar_List.map
                             (fun p  ->
                                FStar_All.pipe_right (p_guard p)
                                  FStar_Pervasives.fst) sub_probs in
<<<<<<< HEAD
                         FStar_Syntax_Util.mk_conj_l uu____10934 in
=======
                         FStar_Syntax_Util.mk_conj_l uu____10904 in
>>>>>>> origin/guido_tactics
                       let wl1 = solve_prob orig (Some guard) [] wl in
                       solve env (attempt sub_probs wl1)
                     else
                       (let t21 = sn env t2 in
                        let rhs_vars = FStar_Syntax_Free.names t21 in
<<<<<<< HEAD
                        let uu____10945 = occurs_check env wl (u1, k1) t21 in
                        match uu____10945 with
                        | (occurs_ok,uu____10950) ->
                            let lhs_vars =
                              FStar_Syntax_Free.names_of_binders xs in
                            let uu____10955 =
                              occurs_ok &&
                                (FStar_Util.set_is_subset_of rhs_vars
                                   lhs_vars) in
                            if uu____10955
                            then
                              let sol =
                                let uu____10957 =
                                  let uu____10962 = u_abs k1 xs t21 in
                                  ((u1, k1), uu____10962) in
                                TERM uu____10957 in
                              let wl1 = solve_prob orig None [sol] wl in
                              solve env wl1
                            else
                              (let uu____10967 =
                                 occurs_ok &&
                                   (FStar_All.pipe_left Prims.op_Negation
                                      wl.defer_ok) in
                               if uu____10967
                               then
                                 let uu____10968 =
                                   force_quasi_pattern (Some xs)
                                     (t21, u2, k2, args2) in
                                 match uu____10968 with
                                 | (sol,(uu____10978,u21,k21,ys)) ->
                                     let wl1 =
                                       extend_solution (p_pid orig) [sol] wl in
                                     ((let uu____10988 =
=======
                        let uu____10914 = occurs_check env wl (u1, k1) t21 in
                        match uu____10914 with
                        | (occurs_ok,uu____10919) ->
                            let lhs_vars =
                              FStar_Syntax_Free.names_of_binders xs in
                            let uu____10924 =
                              occurs_ok &&
                                (FStar_Util.set_is_subset_of rhs_vars
                                   lhs_vars) in
                            if uu____10924
                            then
                              let sol =
                                let uu____10926 =
                                  let uu____10931 = u_abs k1 xs t21 in
                                  ((u1, k1), uu____10931) in
                                TERM uu____10926 in
                              let wl1 = solve_prob orig None [sol] wl in
                              solve env wl1
                            else
                              (let uu____10936 =
                                 occurs_ok &&
                                   (FStar_All.pipe_left Prims.op_Negation
                                      wl.defer_ok) in
                               if uu____10936
                               then
                                 let uu____10937 =
                                   force_quasi_pattern (Some xs)
                                     (t21, u2, k2, args2) in
                                 match uu____10937 with
                                 | (sol,(uu____10947,u21,k21,ys)) ->
                                     let wl1 =
                                       extend_solution (p_pid orig) [sol] wl in
                                     ((let uu____10957 =
>>>>>>> origin/guido_tactics
                                         FStar_All.pipe_left
                                           (FStar_TypeChecker_Env.debug env)
                                           (FStar_Options.Other
                                              "QuasiPattern") in
<<<<<<< HEAD
                                       if uu____10988
                                       then
                                         let uu____10989 =
                                           uvi_to_string env sol in
                                         FStar_Util.print1
                                           "flex-flex quasi pattern (2): %s\n"
                                           uu____10989
=======
                                       if uu____10957
                                       then
                                         let uu____10958 =
                                           uvi_to_string env sol in
                                         FStar_Util.print1
                                           "flex-flex quasi pattern (2): %s\n"
                                           uu____10958
>>>>>>> origin/guido_tactics
                                       else ());
                                      (match orig with
                                       | FStar_TypeChecker_Common.TProb p ->
                                           solve_t env p wl1
<<<<<<< HEAD
                                       | uu____10994 ->
                                           giveup env "impossible" orig))
                               else
                                 giveup_or_defer1 orig "flex-flex constraint")))) in
             let uu____10996 = lhs in
             match uu____10996 with
             | (t1,u1,k1,args1) ->
                 let uu____11001 = rhs in
                 (match uu____11001 with
=======
                                       | uu____10963 ->
                                           giveup env "impossible" orig))
                               else
                                 giveup_or_defer1 orig "flex-flex constraint")))) in
             let uu____10965 = lhs in
             match uu____10965 with
             | (t1,u1,k1,args1) ->
                 let uu____10970 = rhs in
                 (match uu____10970 with
>>>>>>> origin/guido_tactics
                  | (t2,u2,k2,args2) ->
                      let maybe_pat_vars1 = pat_vars env [] args1 in
                      let maybe_pat_vars2 = pat_vars env [] args2 in
                      let r = t2.FStar_Syntax_Syntax.pos in
                      (match (maybe_pat_vars1, maybe_pat_vars2) with
                       | (Some xs,Some ys) ->
                           solve_both_pats wl (u1, k1, xs, args1)
                             (u2, k2, ys, args2) t2.FStar_Syntax_Syntax.pos
                       | (Some xs,None ) ->
                           solve_one_pat (t1, u1, k1, xs) rhs
                       | (None ,Some ys) ->
                           solve_one_pat (t2, u2, k2, ys) lhs
<<<<<<< HEAD
                       | uu____11027 ->
=======
                       | uu____10996 ->
>>>>>>> origin/guido_tactics
                           if wl.defer_ok
                           then
                             giveup_or_defer1 orig
                               "flex-flex: neither side is a pattern"
                           else
<<<<<<< HEAD
                             (let uu____11033 =
                                force_quasi_pattern None (t1, u1, k1, args1) in
                              match uu____11033 with
                              | (sol,uu____11040) ->
                                  let wl1 =
                                    extend_solution (p_pid orig) [sol] wl in
                                  ((let uu____11043 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        (FStar_Options.Other "QuasiPattern") in
                                    if uu____11043
                                    then
                                      let uu____11044 = uvi_to_string env sol in
                                      FStar_Util.print1
                                        "flex-flex quasi pattern (1): %s\n"
                                        uu____11044
=======
                             (let uu____11002 =
                                force_quasi_pattern None (t1, u1, k1, args1) in
                              match uu____11002 with
                              | (sol,uu____11009) ->
                                  let wl1 =
                                    extend_solution (p_pid orig) [sol] wl in
                                  ((let uu____11012 =
                                      FStar_All.pipe_left
                                        (FStar_TypeChecker_Env.debug env)
                                        (FStar_Options.Other "QuasiPattern") in
                                    if uu____11012
                                    then
                                      let uu____11013 = uvi_to_string env sol in
                                      FStar_Util.print1
                                        "flex-flex quasi pattern (1): %s\n"
                                        uu____11013
>>>>>>> origin/guido_tactics
                                    else ());
                                   (match orig with
                                    | FStar_TypeChecker_Common.TProb p ->
                                        solve_t env p wl1
<<<<<<< HEAD
                                    | uu____11049 ->
                                        giveup env "impossible" orig)))))) in
        let orig = FStar_TypeChecker_Common.TProb problem in
        let uu____11051 =
          FStar_Util.physical_equality problem.FStar_TypeChecker_Common.lhs
            problem.FStar_TypeChecker_Common.rhs in
        if uu____11051
        then
          let uu____11052 = solve_prob orig None [] wl in
          solve env uu____11052
        else
          (let t1 = problem.FStar_TypeChecker_Common.lhs in
           let t2 = problem.FStar_TypeChecker_Common.rhs in
           let uu____11056 = FStar_Util.physical_equality t1 t2 in
           if uu____11056
           then
             let uu____11057 = solve_prob orig None [] wl in
             solve env uu____11057
           else
             ((let uu____11060 =
                 FStar_TypeChecker_Env.debug env
                   (FStar_Options.Other "RelCheck") in
               if uu____11060
               then
                 let uu____11061 =
                   FStar_Util.string_of_int
                     problem.FStar_TypeChecker_Common.pid in
                 FStar_Util.print1 "Attempting %s\n" uu____11061
=======
                                    | uu____11018 ->
                                        giveup env "impossible" orig)))))) in
        let orig = FStar_TypeChecker_Common.TProb problem in
        let uu____11020 =
          FStar_Util.physical_equality problem.FStar_TypeChecker_Common.lhs
            problem.FStar_TypeChecker_Common.rhs in
        if uu____11020
        then
          let uu____11021 = solve_prob orig None [] wl in
          solve env uu____11021
        else
          (let t1 = problem.FStar_TypeChecker_Common.lhs in
           let t2 = problem.FStar_TypeChecker_Common.rhs in
           let uu____11025 = FStar_Util.physical_equality t1 t2 in
           if uu____11025
           then
             let uu____11026 = solve_prob orig None [] wl in
             solve env uu____11026
           else
             ((let uu____11029 =
                 FStar_TypeChecker_Env.debug env
                   (FStar_Options.Other "RelCheck") in
               if uu____11029
               then
                 let uu____11030 =
                   FStar_Util.string_of_int
                     problem.FStar_TypeChecker_Common.pid in
                 FStar_Util.print1 "Attempting %s\n" uu____11030
>>>>>>> origin/guido_tactics
               else ());
              (let r = FStar_TypeChecker_Env.get_range env in
               match ((t1.FStar_Syntax_Syntax.n), (t2.FStar_Syntax_Syntax.n))
               with
<<<<<<< HEAD
               | (FStar_Syntax_Syntax.Tm_bvar uu____11064,uu____11065) ->
                   failwith
                     "Only locally nameless! We should never see a de Bruijn variable"
               | (uu____11066,FStar_Syntax_Syntax.Tm_bvar uu____11067) ->
=======
               | (FStar_Syntax_Syntax.Tm_bvar uu____11033,uu____11034) ->
                   failwith
                     "Only locally nameless! We should never see a de Bruijn variable"
               | (uu____11035,FStar_Syntax_Syntax.Tm_bvar uu____11036) ->
>>>>>>> origin/guido_tactics
                   failwith
                     "Only locally nameless! We should never see a de Bruijn variable"
               | (FStar_Syntax_Syntax.Tm_type u1,FStar_Syntax_Syntax.Tm_type
                  u2) -> solve_one_universe_eq env orig u1 u2 wl
               | (FStar_Syntax_Syntax.Tm_arrow
                  (bs1,c1),FStar_Syntax_Syntax.Tm_arrow (bs2,c2)) ->
<<<<<<< HEAD
                   let mk_c c uu___130_11107 =
                     match uu___130_11107 with
                     | [] -> c
                     | bs ->
                         let uu____11121 =
                           FStar_Syntax_Syntax.mk
                             (FStar_Syntax_Syntax.Tm_arrow (bs, c)) None
                             c.FStar_Syntax_Syntax.pos in
                         FStar_Syntax_Syntax.mk_Total uu____11121 in
                   let uu____11131 =
                     match_num_binders (bs1, (mk_c c1)) (bs2, (mk_c c2)) in
                   (match uu____11131 with
=======
                   let mk_c c uu___132_11076 =
                     match uu___132_11076 with
                     | [] -> c
                     | bs ->
                         let uu____11090 =
                           FStar_Syntax_Syntax.mk
                             (FStar_Syntax_Syntax.Tm_arrow (bs, c)) None
                             c.FStar_Syntax_Syntax.pos in
                         FStar_Syntax_Syntax.mk_Total uu____11090 in
                   let uu____11100 =
                     match_num_binders (bs1, (mk_c c1)) (bs2, (mk_c c2)) in
                   (match uu____11100 with
>>>>>>> origin/guido_tactics
                    | ((bs11,c11),(bs21,c21)) ->
                        solve_binders env bs11 bs21 orig wl
                          (fun scope  ->
                             fun env1  ->
                               fun subst1  ->
                                 let c12 =
                                   FStar_Syntax_Subst.subst_comp subst1 c11 in
                                 let c22 =
                                   FStar_Syntax_Subst.subst_comp subst1 c21 in
                                 let rel =
<<<<<<< HEAD
                                   let uu____11224 =
                                     FStar_Options.use_eq_at_higher_order () in
                                   if uu____11224
                                   then FStar_TypeChecker_Common.EQ
                                   else
                                     problem.FStar_TypeChecker_Common.relation in
                                 let uu____11226 =
                                   mk_problem scope orig c12 rel c22 None
                                     "function co-domain" in
                                 FStar_All.pipe_left
                                   (fun _0_61  ->
                                      FStar_TypeChecker_Common.CProb _0_61)
                                   uu____11226))
               | (FStar_Syntax_Syntax.Tm_abs
                  (bs1,tbody1,lopt1),FStar_Syntax_Syntax.Tm_abs
                  (bs2,tbody2,lopt2)) ->
                   let mk_t t l uu___131_11303 =
                     match uu___131_11303 with
=======
                                   let uu____11186 =
                                     FStar_Options.use_eq_at_higher_order () in
                                   if uu____11186
                                   then FStar_TypeChecker_Common.EQ
                                   else
                                     problem.FStar_TypeChecker_Common.relation in
                                 let uu____11188 =
                                   mk_problem scope orig c12 rel c22 None
                                     "function co-domain" in
                                 FStar_All.pipe_left
                                   (fun _0_66  ->
                                      FStar_TypeChecker_Common.CProb _0_66)
                                   uu____11188))
               | (FStar_Syntax_Syntax.Tm_abs
                  (bs1,tbody1,lopt1),FStar_Syntax_Syntax.Tm_abs
                  (bs2,tbody2,lopt2)) ->
                   let mk_t t l uu___133_11240 =
                     match uu___133_11240 with
>>>>>>> origin/guido_tactics
                     | [] -> t
                     | bs ->
                         FStar_Syntax_Syntax.mk
                           (FStar_Syntax_Syntax.Tm_abs (bs, t, l)) None
                           t.FStar_Syntax_Syntax.pos in
<<<<<<< HEAD
                   let uu____11338 =
                     match_num_binders (bs1, (mk_t tbody1 lopt1))
                       (bs2, (mk_t tbody2 lopt2)) in
                   (match uu____11338 with
=======
                   let uu____11265 =
                     match_num_binders (bs1, (mk_t tbody1 lopt1))
                       (bs2, (mk_t tbody2 lopt2)) in
                   (match uu____11265 with
>>>>>>> origin/guido_tactics
                    | ((bs11,tbody11),(bs21,tbody21)) ->
                        solve_binders env bs11 bs21 orig wl
                          (fun scope  ->
                             fun env1  ->
                               fun subst1  ->
<<<<<<< HEAD
                                 let uu____11425 =
                                   let uu____11428 =
                                     FStar_Syntax_Subst.subst subst1 tbody11 in
                                   let uu____11429 =
                                     FStar_Syntax_Subst.subst subst1 tbody21 in
                                   mk_problem scope orig uu____11428
                                     problem.FStar_TypeChecker_Common.relation
                                     uu____11429 None "lambda co-domain" in
                                 FStar_All.pipe_left
                                   (fun _0_62  ->
                                      FStar_TypeChecker_Common.TProb _0_62)
                                   uu____11425))
               | (FStar_Syntax_Syntax.Tm_abs uu____11432,uu____11433) ->
                   let is_abs t =
                     match t.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_abs uu____11456 -> true
                     | uu____11471 -> false in
=======
                                 let uu____11348 =
                                   let uu____11351 =
                                     FStar_Syntax_Subst.subst subst1 tbody11 in
                                   let uu____11352 =
                                     FStar_Syntax_Subst.subst subst1 tbody21 in
                                   mk_problem scope orig uu____11351
                                     problem.FStar_TypeChecker_Common.relation
                                     uu____11352 None "lambda co-domain" in
                                 FStar_All.pipe_left
                                   (fun _0_67  ->
                                      FStar_TypeChecker_Common.TProb _0_67)
                                   uu____11348))
               | (FStar_Syntax_Syntax.Tm_abs uu____11355,uu____11356) ->
                   let is_abs t =
                     match t.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_abs uu____11374 -> true
                     | uu____11384 -> false in
>>>>>>> origin/guido_tactics
                   let maybe_eta t =
                     if is_abs t
                     then FStar_Util.Inl t
                     else
                       (let t3 =
                          FStar_TypeChecker_Normalize.eta_expand wl.tcenv t in
                        if is_abs t3
                        then FStar_Util.Inl t3
                        else FStar_Util.Inr t3) in
<<<<<<< HEAD
                   let uu____11499 =
                     let uu____11510 = maybe_eta t1 in
                     let uu____11515 = maybe_eta t2 in
                     (uu____11510, uu____11515) in
                   (match uu____11499 with
                    | (FStar_Util.Inl t11,FStar_Util.Inl t21) ->
                        solve_t env
                          (let uu___164_11547 = problem in
                           {
                             FStar_TypeChecker_Common.pid =
                               (uu___164_11547.FStar_TypeChecker_Common.pid);
                             FStar_TypeChecker_Common.lhs = t11;
                             FStar_TypeChecker_Common.relation =
                               (uu___164_11547.FStar_TypeChecker_Common.relation);
                             FStar_TypeChecker_Common.rhs = t21;
                             FStar_TypeChecker_Common.element =
                               (uu___164_11547.FStar_TypeChecker_Common.element);
                             FStar_TypeChecker_Common.logical_guard =
                               (uu___164_11547.FStar_TypeChecker_Common.logical_guard);
                             FStar_TypeChecker_Common.scope =
                               (uu___164_11547.FStar_TypeChecker_Common.scope);
                             FStar_TypeChecker_Common.reason =
                               (uu___164_11547.FStar_TypeChecker_Common.reason);
                             FStar_TypeChecker_Common.loc =
                               (uu___164_11547.FStar_TypeChecker_Common.loc);
                             FStar_TypeChecker_Common.rank =
                               (uu___164_11547.FStar_TypeChecker_Common.rank)
                           }) wl
                    | (FStar_Util.Inl t_abs,FStar_Util.Inr not_abs) ->
                        let uu____11566 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11566
                        then
                          let uu____11567 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11567 t_abs wl
=======
                   let uu____11412 =
                     let uu____11423 = maybe_eta t1 in
                     let uu____11428 = maybe_eta t2 in
                     (uu____11423, uu____11428) in
                   (match uu____11412 with
                    | (FStar_Util.Inl t11,FStar_Util.Inl t21) ->
                        solve_t env
                          (let uu___166_11459 = problem in
                           {
                             FStar_TypeChecker_Common.pid =
                               (uu___166_11459.FStar_TypeChecker_Common.pid);
                             FStar_TypeChecker_Common.lhs = t11;
                             FStar_TypeChecker_Common.relation =
                               (uu___166_11459.FStar_TypeChecker_Common.relation);
                             FStar_TypeChecker_Common.rhs = t21;
                             FStar_TypeChecker_Common.element =
                               (uu___166_11459.FStar_TypeChecker_Common.element);
                             FStar_TypeChecker_Common.logical_guard =
                               (uu___166_11459.FStar_TypeChecker_Common.logical_guard);
                             FStar_TypeChecker_Common.scope =
                               (uu___166_11459.FStar_TypeChecker_Common.scope);
                             FStar_TypeChecker_Common.reason =
                               (uu___166_11459.FStar_TypeChecker_Common.reason);
                             FStar_TypeChecker_Common.loc =
                               (uu___166_11459.FStar_TypeChecker_Common.loc);
                             FStar_TypeChecker_Common.rank =
                               (uu___166_11459.FStar_TypeChecker_Common.rank)
                           }) wl
                    | (FStar_Util.Inl t_abs,FStar_Util.Inr not_abs) ->
                        let uu____11478 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11478
                        then
                          let uu____11479 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11479 t_abs wl
>>>>>>> origin/guido_tactics
                        else
                          giveup env
                            "head tag mismatch: RHS is an abstraction" orig
                    | (FStar_Util.Inr not_abs,FStar_Util.Inl t_abs) ->
<<<<<<< HEAD
                        let uu____11588 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11588
                        then
                          let uu____11589 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11589 t_abs wl
                        else
                          giveup env
                            "head tag mismatch: RHS is an abstraction" orig
                    | uu____11594 ->
                        failwith
                          "Impossible: at least one side is an abstraction")
               | (uu____11605,FStar_Syntax_Syntax.Tm_abs uu____11606) ->
                   let is_abs t =
                     match t.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_abs uu____11629 -> true
                     | uu____11644 -> false in
=======
                        let uu____11500 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11500
                        then
                          let uu____11501 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11501 t_abs wl
                        else
                          giveup env
                            "head tag mismatch: RHS is an abstraction" orig
                    | uu____11506 ->
                        failwith
                          "Impossible: at least one side is an abstraction")
               | (uu____11517,FStar_Syntax_Syntax.Tm_abs uu____11518) ->
                   let is_abs t =
                     match t.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_abs uu____11536 -> true
                     | uu____11546 -> false in
>>>>>>> origin/guido_tactics
                   let maybe_eta t =
                     if is_abs t
                     then FStar_Util.Inl t
                     else
                       (let t3 =
                          FStar_TypeChecker_Normalize.eta_expand wl.tcenv t in
                        if is_abs t3
                        then FStar_Util.Inl t3
                        else FStar_Util.Inr t3) in
<<<<<<< HEAD
                   let uu____11672 =
                     let uu____11683 = maybe_eta t1 in
                     let uu____11688 = maybe_eta t2 in
                     (uu____11683, uu____11688) in
                   (match uu____11672 with
                    | (FStar_Util.Inl t11,FStar_Util.Inl t21) ->
                        solve_t env
                          (let uu___164_11720 = problem in
                           {
                             FStar_TypeChecker_Common.pid =
                               (uu___164_11720.FStar_TypeChecker_Common.pid);
                             FStar_TypeChecker_Common.lhs = t11;
                             FStar_TypeChecker_Common.relation =
                               (uu___164_11720.FStar_TypeChecker_Common.relation);
                             FStar_TypeChecker_Common.rhs = t21;
                             FStar_TypeChecker_Common.element =
                               (uu___164_11720.FStar_TypeChecker_Common.element);
                             FStar_TypeChecker_Common.logical_guard =
                               (uu___164_11720.FStar_TypeChecker_Common.logical_guard);
                             FStar_TypeChecker_Common.scope =
                               (uu___164_11720.FStar_TypeChecker_Common.scope);
                             FStar_TypeChecker_Common.reason =
                               (uu___164_11720.FStar_TypeChecker_Common.reason);
                             FStar_TypeChecker_Common.loc =
                               (uu___164_11720.FStar_TypeChecker_Common.loc);
                             FStar_TypeChecker_Common.rank =
                               (uu___164_11720.FStar_TypeChecker_Common.rank)
                           }) wl
                    | (FStar_Util.Inl t_abs,FStar_Util.Inr not_abs) ->
                        let uu____11739 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11739
                        then
                          let uu____11740 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11740 t_abs wl
=======
                   let uu____11574 =
                     let uu____11585 = maybe_eta t1 in
                     let uu____11590 = maybe_eta t2 in
                     (uu____11585, uu____11590) in
                   (match uu____11574 with
                    | (FStar_Util.Inl t11,FStar_Util.Inl t21) ->
                        solve_t env
                          (let uu___166_11621 = problem in
                           {
                             FStar_TypeChecker_Common.pid =
                               (uu___166_11621.FStar_TypeChecker_Common.pid);
                             FStar_TypeChecker_Common.lhs = t11;
                             FStar_TypeChecker_Common.relation =
                               (uu___166_11621.FStar_TypeChecker_Common.relation);
                             FStar_TypeChecker_Common.rhs = t21;
                             FStar_TypeChecker_Common.element =
                               (uu___166_11621.FStar_TypeChecker_Common.element);
                             FStar_TypeChecker_Common.logical_guard =
                               (uu___166_11621.FStar_TypeChecker_Common.logical_guard);
                             FStar_TypeChecker_Common.scope =
                               (uu___166_11621.FStar_TypeChecker_Common.scope);
                             FStar_TypeChecker_Common.reason =
                               (uu___166_11621.FStar_TypeChecker_Common.reason);
                             FStar_TypeChecker_Common.loc =
                               (uu___166_11621.FStar_TypeChecker_Common.loc);
                             FStar_TypeChecker_Common.rank =
                               (uu___166_11621.FStar_TypeChecker_Common.rank)
                           }) wl
                    | (FStar_Util.Inl t_abs,FStar_Util.Inr not_abs) ->
                        let uu____11640 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11640
                        then
                          let uu____11641 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11641 t_abs wl
>>>>>>> origin/guido_tactics
                        else
                          giveup env
                            "head tag mismatch: RHS is an abstraction" orig
                    | (FStar_Util.Inr not_abs,FStar_Util.Inl t_abs) ->
<<<<<<< HEAD
                        let uu____11761 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11761
                        then
                          let uu____11762 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11762 t_abs wl
                        else
                          giveup env
                            "head tag mismatch: RHS is an abstraction" orig
                    | uu____11767 ->
                        failwith
                          "Impossible: at least one side is an abstraction")
               | (FStar_Syntax_Syntax.Tm_refine
                  uu____11778,FStar_Syntax_Syntax.Tm_refine uu____11779) ->
                   let uu____11788 = as_refinement env wl t1 in
                   (match uu____11788 with
                    | (x1,phi1) ->
                        let uu____11793 = as_refinement env wl t2 in
                        (match uu____11793 with
                         | (x2,phi2) ->
                             let base_prob =
                               let uu____11799 =
=======
                        let uu____11662 =
                          (is_flex not_abs) &&
                            ((p_rel orig) = FStar_TypeChecker_Common.EQ) in
                        if uu____11662
                        then
                          let uu____11663 = destruct_flex_pattern env not_abs in
                          solve_t_flex_rigid true orig uu____11663 t_abs wl
                        else
                          giveup env
                            "head tag mismatch: RHS is an abstraction" orig
                    | uu____11668 ->
                        failwith
                          "Impossible: at least one side is an abstraction")
               | (FStar_Syntax_Syntax.Tm_refine
                  uu____11679,FStar_Syntax_Syntax.Tm_refine uu____11680) ->
                   let uu____11689 = as_refinement env wl t1 in
                   (match uu____11689 with
                    | (x1,phi1) ->
                        let uu____11694 = as_refinement env wl t2 in
                        (match uu____11694 with
                         | (x2,phi2) ->
                             let base_prob =
                               let uu____11700 =
>>>>>>> origin/guido_tactics
                                 mk_problem (p_scope orig) orig
                                   x1.FStar_Syntax_Syntax.sort
                                   problem.FStar_TypeChecker_Common.relation
                                   x2.FStar_Syntax_Syntax.sort
                                   problem.FStar_TypeChecker_Common.element
                                   "refinement base type" in
                               FStar_All.pipe_left
<<<<<<< HEAD
                                 (fun _0_63  ->
                                    FStar_TypeChecker_Common.TProb _0_63)
                                 uu____11799 in
=======
                                 (fun _0_68  ->
                                    FStar_TypeChecker_Common.TProb _0_68)
                                 uu____11700 in
>>>>>>> origin/guido_tactics
                             let x11 = FStar_Syntax_Syntax.freshen_bv x1 in
                             let subst1 =
                               [FStar_Syntax_Syntax.DB
                                  ((Prims.parse_int "0"), x11)] in
                             let phi11 = FStar_Syntax_Subst.subst subst1 phi1 in
                             let phi21 = FStar_Syntax_Subst.subst subst1 phi2 in
                             let env1 = FStar_TypeChecker_Env.push_bv env x11 in
                             let mk_imp1 imp phi12 phi22 =
<<<<<<< HEAD
                               let uu____11832 = imp phi12 phi22 in
                               FStar_All.pipe_right uu____11832
                                 (guard_on_element wl problem x11) in
                             let fallback uu____11836 =
=======
                               let uu____11733 = imp phi12 phi22 in
                               FStar_All.pipe_right uu____11733
                                 (guard_on_element wl problem x11) in
                             let fallback uu____11737 =
>>>>>>> origin/guido_tactics
                               let impl =
                                 if
                                   problem.FStar_TypeChecker_Common.relation
                                     = FStar_TypeChecker_Common.EQ
                                 then
                                   mk_imp1 FStar_Syntax_Util.mk_iff phi11
                                     phi21
                                 else
                                   mk_imp1 FStar_Syntax_Util.mk_imp phi11
                                     phi21 in
                               let guard =
<<<<<<< HEAD
                                 let uu____11842 =
                                   FStar_All.pipe_right (p_guard base_prob)
                                     FStar_Pervasives.fst in
                                 FStar_Syntax_Util.mk_conj uu____11842 impl in
=======
                                 let uu____11743 =
                                   FStar_All.pipe_right (p_guard base_prob)
                                     FStar_Pervasives.fst in
                                 FStar_Syntax_Util.mk_conj uu____11743 impl in
>>>>>>> origin/guido_tactics
                               let wl1 = solve_prob orig (Some guard) [] wl in
                               solve env1 (attempt [base_prob] wl1) in
                             if
                               problem.FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ
                             then
                               let ref_prob =
<<<<<<< HEAD
                                 let uu____11849 =
                                   let uu____11852 =
                                     let uu____11853 =
                                       FStar_Syntax_Syntax.mk_binder x11 in
                                     uu____11853 :: (p_scope orig) in
                                   mk_problem uu____11852 orig phi11
                                     FStar_TypeChecker_Common.EQ phi21 None
                                     "refinement formula" in
                                 FStar_All.pipe_left
                                   (fun _0_64  ->
                                      FStar_TypeChecker_Common.TProb _0_64)
                                   uu____11849 in
                               let uu____11856 =
                                 solve env1
                                   (let uu___165_11858 = wl in
                                    {
                                      attempting = [ref_prob];
                                      wl_deferred = [];
                                      ctr = (uu___165_11858.ctr);
                                      defer_ok = false;
                                      smt_ok = (uu___165_11858.smt_ok);
                                      tcenv = (uu___165_11858.tcenv)
                                    }) in
                               (match uu____11856 with
                                | Failed uu____11862 -> fallback ()
                                | Success uu____11865 ->
                                    let guard =
                                      let uu____11869 =
                                        FStar_All.pipe_right
                                          (p_guard base_prob)
                                          FStar_Pervasives.fst in
                                      let uu____11872 =
                                        let uu____11873 =
                                          FStar_All.pipe_right
                                            (p_guard ref_prob)
                                            FStar_Pervasives.fst in
                                        FStar_All.pipe_right uu____11873
                                          (guard_on_element wl problem x11) in
                                      FStar_Syntax_Util.mk_conj uu____11869
                                        uu____11872 in
                                    let wl1 =
                                      solve_prob orig (Some guard) [] wl in
                                    let wl2 =
                                      let uu___166_11880 = wl1 in
                                      {
                                        attempting =
                                          (uu___166_11880.attempting);
                                        wl_deferred =
                                          (uu___166_11880.wl_deferred);
                                        ctr =
                                          (wl1.ctr + (Prims.parse_int "1"));
                                        defer_ok = (uu___166_11880.defer_ok);
                                        smt_ok = (uu___166_11880.smt_ok);
                                        tcenv = (uu___166_11880.tcenv)
=======
                                 let uu____11750 =
                                   let uu____11753 =
                                     let uu____11754 =
                                       FStar_Syntax_Syntax.mk_binder x11 in
                                     uu____11754 :: (p_scope orig) in
                                   mk_problem uu____11753 orig phi11
                                     FStar_TypeChecker_Common.EQ phi21 None
                                     "refinement formula" in
                                 FStar_All.pipe_left
                                   (fun _0_69  ->
                                      FStar_TypeChecker_Common.TProb _0_69)
                                   uu____11750 in
                               let uu____11757 =
                                 solve env1
                                   (let uu___167_11758 = wl in
                                    {
                                      attempting = [ref_prob];
                                      wl_deferred = [];
                                      ctr = (uu___167_11758.ctr);
                                      defer_ok = false;
                                      smt_ok = (uu___167_11758.smt_ok);
                                      tcenv = (uu___167_11758.tcenv)
                                    }) in
                               (match uu____11757 with
                                | Failed uu____11762 -> fallback ()
                                | Success uu____11765 ->
                                    let guard =
                                      let uu____11769 =
                                        FStar_All.pipe_right
                                          (p_guard base_prob)
                                          FStar_Pervasives.fst in
                                      let uu____11772 =
                                        let uu____11773 =
                                          FStar_All.pipe_right
                                            (p_guard ref_prob)
                                            FStar_Pervasives.fst in
                                        FStar_All.pipe_right uu____11773
                                          (guard_on_element wl problem x11) in
                                      FStar_Syntax_Util.mk_conj uu____11769
                                        uu____11772 in
                                    let wl1 =
                                      solve_prob orig (Some guard) [] wl in
                                    let wl2 =
                                      let uu___168_11780 = wl1 in
                                      {
                                        attempting =
                                          (uu___168_11780.attempting);
                                        wl_deferred =
                                          (uu___168_11780.wl_deferred);
                                        ctr =
                                          (wl1.ctr + (Prims.parse_int "1"));
                                        defer_ok = (uu___168_11780.defer_ok);
                                        smt_ok = (uu___168_11780.smt_ok);
                                        tcenv = (uu___168_11780.tcenv)
>>>>>>> origin/guido_tactics
                                      } in
                                    solve env1 (attempt [base_prob] wl2))
                             else fallback ()))
               | (FStar_Syntax_Syntax.Tm_uvar
<<<<<<< HEAD
                  uu____11882,FStar_Syntax_Syntax.Tm_uvar uu____11883) ->
                   let uu____11904 = destruct_flex_t t1 in
                   let uu____11905 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11904 uu____11905
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11906;
                     FStar_Syntax_Syntax.tk = uu____11907;
                     FStar_Syntax_Syntax.pos = uu____11908;
                     FStar_Syntax_Syntax.vars = uu____11909;_},uu____11910),FStar_Syntax_Syntax.Tm_uvar
                  uu____11911) ->
                   let uu____11946 = destruct_flex_t t1 in
                   let uu____11947 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11946 uu____11947
               | (FStar_Syntax_Syntax.Tm_uvar
                  uu____11948,FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11949;
                     FStar_Syntax_Syntax.tk = uu____11950;
                     FStar_Syntax_Syntax.pos = uu____11951;
                     FStar_Syntax_Syntax.vars = uu____11952;_},uu____11953))
                   ->
                   let uu____11988 = destruct_flex_t t1 in
                   let uu____11989 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11988 uu____11989
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11990;
                     FStar_Syntax_Syntax.tk = uu____11991;
                     FStar_Syntax_Syntax.pos = uu____11992;
                     FStar_Syntax_Syntax.vars = uu____11993;_},uu____11994),FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11995;
                     FStar_Syntax_Syntax.tk = uu____11996;
                     FStar_Syntax_Syntax.pos = uu____11997;
                     FStar_Syntax_Syntax.vars = uu____11998;_},uu____11999))
                   ->
                   let uu____12048 = destruct_flex_t t1 in
                   let uu____12049 = destruct_flex_t t2 in
                   flex_flex1 orig uu____12048 uu____12049
               | (FStar_Syntax_Syntax.Tm_uvar uu____12050,uu____12051) when
                   problem.FStar_TypeChecker_Common.relation =
                     FStar_TypeChecker_Common.EQ
                   ->
                   let uu____12062 = destruct_flex_pattern env t1 in
                   solve_t_flex_rigid false orig uu____12062 t2 wl
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____12066;
                     FStar_Syntax_Syntax.tk = uu____12067;
                     FStar_Syntax_Syntax.pos = uu____12068;
                     FStar_Syntax_Syntax.vars = uu____12069;_},uu____12070),uu____12071)
=======
                  uu____11782,FStar_Syntax_Syntax.Tm_uvar uu____11783) ->
                   let uu____11800 = destruct_flex_t t1 in
                   let uu____11801 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11800 uu____11801
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11802;
                     FStar_Syntax_Syntax.tk = uu____11803;
                     FStar_Syntax_Syntax.pos = uu____11804;
                     FStar_Syntax_Syntax.vars = uu____11805;_},uu____11806),FStar_Syntax_Syntax.Tm_uvar
                  uu____11807) ->
                   let uu____11838 = destruct_flex_t t1 in
                   let uu____11839 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11838 uu____11839
               | (FStar_Syntax_Syntax.Tm_uvar
                  uu____11840,FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11841;
                     FStar_Syntax_Syntax.tk = uu____11842;
                     FStar_Syntax_Syntax.pos = uu____11843;
                     FStar_Syntax_Syntax.vars = uu____11844;_},uu____11845))
                   ->
                   let uu____11876 = destruct_flex_t t1 in
                   let uu____11877 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11876 uu____11877
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11878;
                     FStar_Syntax_Syntax.tk = uu____11879;
                     FStar_Syntax_Syntax.pos = uu____11880;
                     FStar_Syntax_Syntax.vars = uu____11881;_},uu____11882),FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11883;
                     FStar_Syntax_Syntax.tk = uu____11884;
                     FStar_Syntax_Syntax.pos = uu____11885;
                     FStar_Syntax_Syntax.vars = uu____11886;_},uu____11887))
                   ->
                   let uu____11932 = destruct_flex_t t1 in
                   let uu____11933 = destruct_flex_t t2 in
                   flex_flex1 orig uu____11932 uu____11933
               | (FStar_Syntax_Syntax.Tm_uvar uu____11934,uu____11935) when
                   problem.FStar_TypeChecker_Common.relation =
                     FStar_TypeChecker_Common.EQ
                   ->
                   let uu____11944 = destruct_flex_pattern env t1 in
                   solve_t_flex_rigid false orig uu____11944 t2 wl
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11948;
                     FStar_Syntax_Syntax.tk = uu____11949;
                     FStar_Syntax_Syntax.pos = uu____11950;
                     FStar_Syntax_Syntax.vars = uu____11951;_},uu____11952),uu____11953)
>>>>>>> origin/guido_tactics
                   when
                   problem.FStar_TypeChecker_Common.relation =
                     FStar_TypeChecker_Common.EQ
                   ->
<<<<<<< HEAD
                   let uu____12096 = destruct_flex_pattern env t1 in
                   solve_t_flex_rigid false orig uu____12096 t2 wl
               | (uu____12100,FStar_Syntax_Syntax.Tm_uvar uu____12101) when
                   problem.FStar_TypeChecker_Common.relation =
                     FStar_TypeChecker_Common.EQ
                   -> solve_t env (invert problem) wl
               | (uu____12112,FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____12113;
                     FStar_Syntax_Syntax.tk = uu____12114;
                     FStar_Syntax_Syntax.pos = uu____12115;
                     FStar_Syntax_Syntax.vars = uu____12116;_},uu____12117))
=======
                   let uu____11976 = destruct_flex_pattern env t1 in
                   solve_t_flex_rigid false orig uu____11976 t2 wl
               | (uu____11980,FStar_Syntax_Syntax.Tm_uvar uu____11981) when
                   problem.FStar_TypeChecker_Common.relation =
                     FStar_TypeChecker_Common.EQ
                   -> solve_t env (invert problem) wl
               | (uu____11990,FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____11991;
                     FStar_Syntax_Syntax.tk = uu____11992;
                     FStar_Syntax_Syntax.pos = uu____11993;
                     FStar_Syntax_Syntax.vars = uu____11994;_},uu____11995))
>>>>>>> origin/guido_tactics
                   when
                   problem.FStar_TypeChecker_Common.relation =
                     FStar_TypeChecker_Common.EQ
                   -> solve_t env (invert problem) wl
               | (FStar_Syntax_Syntax.Tm_uvar
<<<<<<< HEAD
                  uu____12142,FStar_Syntax_Syntax.Tm_type uu____12143) ->
                   solve_t' env
                     (let uu___167_12155 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___167_12155.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___167_12155.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___167_12155.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___167_12155.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___167_12155.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___167_12155.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___167_12155.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___167_12155.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___167_12155.FStar_TypeChecker_Common.rank)
=======
                  uu____12018,FStar_Syntax_Syntax.Tm_type uu____12019) ->
                   solve_t' env
                     (let uu___169_12028 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___169_12028.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___169_12028.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___169_12028.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___169_12028.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___169_12028.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___169_12028.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___169_12028.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___169_12028.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___169_12028.FStar_TypeChecker_Common.rank)
>>>>>>> origin/guido_tactics
                      }) wl
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
<<<<<<< HEAD
                       uu____12156;
                     FStar_Syntax_Syntax.tk = uu____12157;
                     FStar_Syntax_Syntax.pos = uu____12158;
                     FStar_Syntax_Syntax.vars = uu____12159;_},uu____12160),FStar_Syntax_Syntax.Tm_type
                  uu____12161) ->
                   solve_t' env
                     (let uu___167_12187 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___167_12187.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___167_12187.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___167_12187.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___167_12187.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___167_12187.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___167_12187.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___167_12187.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___167_12187.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___167_12187.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_uvar
                  uu____12188,FStar_Syntax_Syntax.Tm_arrow uu____12189) ->
                   solve_t' env
                     (let uu___167_12208 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___167_12208.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___167_12208.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___167_12208.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___167_12208.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___167_12208.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___167_12208.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___167_12208.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___167_12208.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___167_12208.FStar_TypeChecker_Common.rank)
=======
                       uu____12029;
                     FStar_Syntax_Syntax.tk = uu____12030;
                     FStar_Syntax_Syntax.pos = uu____12031;
                     FStar_Syntax_Syntax.vars = uu____12032;_},uu____12033),FStar_Syntax_Syntax.Tm_type
                  uu____12034) ->
                   solve_t' env
                     (let uu___169_12057 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___169_12057.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___169_12057.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___169_12057.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___169_12057.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___169_12057.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___169_12057.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___169_12057.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___169_12057.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___169_12057.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_uvar
                  uu____12058,FStar_Syntax_Syntax.Tm_arrow uu____12059) ->
                   solve_t' env
                     (let uu___169_12075 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___169_12075.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___169_12075.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___169_12075.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___169_12075.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___169_12075.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___169_12075.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___169_12075.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___169_12075.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___169_12075.FStar_TypeChecker_Common.rank)
>>>>>>> origin/guido_tactics
                      }) wl
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
<<<<<<< HEAD
                       uu____12209;
                     FStar_Syntax_Syntax.tk = uu____12210;
                     FStar_Syntax_Syntax.pos = uu____12211;
                     FStar_Syntax_Syntax.vars = uu____12212;_},uu____12213),FStar_Syntax_Syntax.Tm_arrow
                  uu____12214) ->
                   solve_t' env
                     (let uu___167_12247 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___167_12247.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___167_12247.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___167_12247.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___167_12247.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___167_12247.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___167_12247.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___167_12247.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___167_12247.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___167_12247.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_uvar uu____12248,uu____12249) ->
=======
                       uu____12076;
                     FStar_Syntax_Syntax.tk = uu____12077;
                     FStar_Syntax_Syntax.pos = uu____12078;
                     FStar_Syntax_Syntax.vars = uu____12079;_},uu____12080),FStar_Syntax_Syntax.Tm_arrow
                  uu____12081) ->
                   solve_t' env
                     (let uu___169_12111 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___169_12111.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___169_12111.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ;
                        FStar_TypeChecker_Common.rhs =
                          (uu___169_12111.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___169_12111.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___169_12111.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___169_12111.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___169_12111.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___169_12111.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___169_12111.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_uvar uu____12112,uu____12113) ->
>>>>>>> origin/guido_tactics
                   if wl.defer_ok
                   then
                     solve env
                       (defer "flex-rigid subtyping deferred" orig wl)
                   else
                     (let new_rel = problem.FStar_TypeChecker_Common.relation in
<<<<<<< HEAD
                      let uu____12262 =
                        let uu____12263 = is_top_level_prob orig in
                        FStar_All.pipe_left Prims.op_Negation uu____12263 in
                      if uu____12262
                      then
                        let uu____12264 =
                          FStar_All.pipe_left
                            (fun _0_65  ->
                               FStar_TypeChecker_Common.TProb _0_65)
                            (let uu___168_12268 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___168_12268.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___168_12268.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation = new_rel;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___168_12268.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___168_12268.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___168_12268.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___168_12268.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___168_12268.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___168_12268.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___168_12268.FStar_TypeChecker_Common.rank)
                             }) in
                        let uu____12269 = destruct_flex_pattern env t1 in
                        solve_t_flex_rigid false uu____12264 uu____12269 t2
                          wl
                      else
                        (let uu____12274 = base_and_refinement env wl t2 in
                         match uu____12274 with
                         | (t_base,ref_opt) ->
                             (match ref_opt with
                              | None  ->
                                  let uu____12304 =
                                    FStar_All.pipe_left
                                      (fun _0_66  ->
                                         FStar_TypeChecker_Common.TProb _0_66)
                                      (let uu___169_12308 = problem in
                                       {
                                         FStar_TypeChecker_Common.pid =
                                           (uu___169_12308.FStar_TypeChecker_Common.pid);
                                         FStar_TypeChecker_Common.lhs =
                                           (uu___169_12308.FStar_TypeChecker_Common.lhs);
                                         FStar_TypeChecker_Common.relation =
                                           new_rel;
                                         FStar_TypeChecker_Common.rhs =
                                           (uu___169_12308.FStar_TypeChecker_Common.rhs);
                                         FStar_TypeChecker_Common.element =
                                           (uu___169_12308.FStar_TypeChecker_Common.element);
                                         FStar_TypeChecker_Common.logical_guard
                                           =
                                           (uu___169_12308.FStar_TypeChecker_Common.logical_guard);
                                         FStar_TypeChecker_Common.scope =
                                           (uu___169_12308.FStar_TypeChecker_Common.scope);
                                         FStar_TypeChecker_Common.reason =
                                           (uu___169_12308.FStar_TypeChecker_Common.reason);
                                         FStar_TypeChecker_Common.loc =
                                           (uu___169_12308.FStar_TypeChecker_Common.loc);
                                         FStar_TypeChecker_Common.rank =
                                           (uu___169_12308.FStar_TypeChecker_Common.rank)
                                       }) in
                                  let uu____12309 =
                                    destruct_flex_pattern env t1 in
                                  solve_t_flex_rigid false uu____12304
                                    uu____12309 t_base wl
                              | Some (y,phi) ->
                                  let y' =
                                    let uu___170_12324 = y in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___170_12324.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___170_12324.FStar_Syntax_Syntax.index);
=======
                      let uu____12124 =
                        let uu____12125 = is_top_level_prob orig in
                        FStar_All.pipe_left Prims.op_Negation uu____12125 in
                      if uu____12124
                      then
                        let uu____12126 =
                          FStar_All.pipe_left
                            (fun _0_70  ->
                               FStar_TypeChecker_Common.TProb _0_70)
                            (let uu___170_12129 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___170_12129.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___170_12129.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation = new_rel;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___170_12129.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___170_12129.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___170_12129.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___170_12129.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___170_12129.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___170_12129.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___170_12129.FStar_TypeChecker_Common.rank)
                             }) in
                        let uu____12130 = destruct_flex_pattern env t1 in
                        solve_t_flex_rigid false uu____12126 uu____12130 t2
                          wl
                      else
                        (let uu____12135 = base_and_refinement env wl t2 in
                         match uu____12135 with
                         | (t_base,ref_opt) ->
                             (match ref_opt with
                              | None  ->
                                  let uu____12165 =
                                    FStar_All.pipe_left
                                      (fun _0_71  ->
                                         FStar_TypeChecker_Common.TProb _0_71)
                                      (let uu___171_12168 = problem in
                                       {
                                         FStar_TypeChecker_Common.pid =
                                           (uu___171_12168.FStar_TypeChecker_Common.pid);
                                         FStar_TypeChecker_Common.lhs =
                                           (uu___171_12168.FStar_TypeChecker_Common.lhs);
                                         FStar_TypeChecker_Common.relation =
                                           new_rel;
                                         FStar_TypeChecker_Common.rhs =
                                           (uu___171_12168.FStar_TypeChecker_Common.rhs);
                                         FStar_TypeChecker_Common.element =
                                           (uu___171_12168.FStar_TypeChecker_Common.element);
                                         FStar_TypeChecker_Common.logical_guard
                                           =
                                           (uu___171_12168.FStar_TypeChecker_Common.logical_guard);
                                         FStar_TypeChecker_Common.scope =
                                           (uu___171_12168.FStar_TypeChecker_Common.scope);
                                         FStar_TypeChecker_Common.reason =
                                           (uu___171_12168.FStar_TypeChecker_Common.reason);
                                         FStar_TypeChecker_Common.loc =
                                           (uu___171_12168.FStar_TypeChecker_Common.loc);
                                         FStar_TypeChecker_Common.rank =
                                           (uu___171_12168.FStar_TypeChecker_Common.rank)
                                       }) in
                                  let uu____12169 =
                                    destruct_flex_pattern env t1 in
                                  solve_t_flex_rigid false uu____12165
                                    uu____12169 t_base wl
                              | Some (y,phi) ->
                                  let y' =
                                    let uu___172_12184 = y in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___172_12184.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___172_12184.FStar_Syntax_Syntax.index);
>>>>>>> origin/guido_tactics
                                      FStar_Syntax_Syntax.sort = t1
                                    } in
                                  let impl =
                                    guard_on_element wl problem y' phi in
                                  let base_prob =
<<<<<<< HEAD
                                    let uu____12327 =
=======
                                    let uu____12187 =
>>>>>>> origin/guido_tactics
                                      mk_problem
                                        problem.FStar_TypeChecker_Common.scope
                                        orig t1 new_rel
                                        y.FStar_Syntax_Syntax.sort
                                        problem.FStar_TypeChecker_Common.element
                                        "flex-rigid: base type" in
                                    FStar_All.pipe_left
<<<<<<< HEAD
                                      (fun _0_67  ->
                                         FStar_TypeChecker_Common.TProb _0_67)
                                      uu____12327 in
                                  let guard =
                                    let uu____12335 =
                                      FStar_All.pipe_right
                                        (p_guard base_prob)
                                        FStar_Pervasives.fst in
                                    FStar_Syntax_Util.mk_conj uu____12335
=======
                                      (fun _0_72  ->
                                         FStar_TypeChecker_Common.TProb _0_72)
                                      uu____12187 in
                                  let guard =
                                    let uu____12195 =
                                      FStar_All.pipe_right
                                        (p_guard base_prob)
                                        FStar_Pervasives.fst in
                                    FStar_Syntax_Util.mk_conj uu____12195
>>>>>>> origin/guido_tactics
                                      impl in
                                  let wl1 =
                                    solve_prob orig (Some guard) [] wl in
                                  solve env (attempt [base_prob] wl1))))
               | (FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
<<<<<<< HEAD
                       uu____12341;
                     FStar_Syntax_Syntax.tk = uu____12342;
                     FStar_Syntax_Syntax.pos = uu____12343;
                     FStar_Syntax_Syntax.vars = uu____12344;_},uu____12345),uu____12346)
=======
                       uu____12201;
                     FStar_Syntax_Syntax.tk = uu____12202;
                     FStar_Syntax_Syntax.pos = uu____12203;
                     FStar_Syntax_Syntax.vars = uu____12204;_},uu____12205),uu____12206)
>>>>>>> origin/guido_tactics
                   ->
                   if wl.defer_ok
                   then
                     solve env
                       (defer "flex-rigid subtyping deferred" orig wl)
                   else
                     (let new_rel = problem.FStar_TypeChecker_Common.relation in
<<<<<<< HEAD
                      let uu____12373 =
                        let uu____12374 = is_top_level_prob orig in
                        FStar_All.pipe_left Prims.op_Negation uu____12374 in
                      if uu____12373
                      then
                        let uu____12375 =
                          FStar_All.pipe_left
                            (fun _0_68  ->
                               FStar_TypeChecker_Common.TProb _0_68)
                            (let uu___168_12379 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___168_12379.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___168_12379.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation = new_rel;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___168_12379.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___168_12379.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___168_12379.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___168_12379.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___168_12379.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___168_12379.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___168_12379.FStar_TypeChecker_Common.rank)
                             }) in
                        let uu____12380 = destruct_flex_pattern env t1 in
                        solve_t_flex_rigid false uu____12375 uu____12380 t2
                          wl
                      else
                        (let uu____12385 = base_and_refinement env wl t2 in
                         match uu____12385 with
                         | (t_base,ref_opt) ->
                             (match ref_opt with
                              | None  ->
                                  let uu____12415 =
                                    FStar_All.pipe_left
                                      (fun _0_69  ->
                                         FStar_TypeChecker_Common.TProb _0_69)
                                      (let uu___169_12419 = problem in
                                       {
                                         FStar_TypeChecker_Common.pid =
                                           (uu___169_12419.FStar_TypeChecker_Common.pid);
                                         FStar_TypeChecker_Common.lhs =
                                           (uu___169_12419.FStar_TypeChecker_Common.lhs);
                                         FStar_TypeChecker_Common.relation =
                                           new_rel;
                                         FStar_TypeChecker_Common.rhs =
                                           (uu___169_12419.FStar_TypeChecker_Common.rhs);
                                         FStar_TypeChecker_Common.element =
                                           (uu___169_12419.FStar_TypeChecker_Common.element);
                                         FStar_TypeChecker_Common.logical_guard
                                           =
                                           (uu___169_12419.FStar_TypeChecker_Common.logical_guard);
                                         FStar_TypeChecker_Common.scope =
                                           (uu___169_12419.FStar_TypeChecker_Common.scope);
                                         FStar_TypeChecker_Common.reason =
                                           (uu___169_12419.FStar_TypeChecker_Common.reason);
                                         FStar_TypeChecker_Common.loc =
                                           (uu___169_12419.FStar_TypeChecker_Common.loc);
                                         FStar_TypeChecker_Common.rank =
                                           (uu___169_12419.FStar_TypeChecker_Common.rank)
                                       }) in
                                  let uu____12420 =
                                    destruct_flex_pattern env t1 in
                                  solve_t_flex_rigid false uu____12415
                                    uu____12420 t_base wl
                              | Some (y,phi) ->
                                  let y' =
                                    let uu___170_12435 = y in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___170_12435.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___170_12435.FStar_Syntax_Syntax.index);
=======
                      let uu____12231 =
                        let uu____12232 = is_top_level_prob orig in
                        FStar_All.pipe_left Prims.op_Negation uu____12232 in
                      if uu____12231
                      then
                        let uu____12233 =
                          FStar_All.pipe_left
                            (fun _0_73  ->
                               FStar_TypeChecker_Common.TProb _0_73)
                            (let uu___170_12236 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___170_12236.FStar_TypeChecker_Common.pid);
                               FStar_TypeChecker_Common.lhs =
                                 (uu___170_12236.FStar_TypeChecker_Common.lhs);
                               FStar_TypeChecker_Common.relation = new_rel;
                               FStar_TypeChecker_Common.rhs =
                                 (uu___170_12236.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___170_12236.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___170_12236.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___170_12236.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___170_12236.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___170_12236.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___170_12236.FStar_TypeChecker_Common.rank)
                             }) in
                        let uu____12237 = destruct_flex_pattern env t1 in
                        solve_t_flex_rigid false uu____12233 uu____12237 t2
                          wl
                      else
                        (let uu____12242 = base_and_refinement env wl t2 in
                         match uu____12242 with
                         | (t_base,ref_opt) ->
                             (match ref_opt with
                              | None  ->
                                  let uu____12272 =
                                    FStar_All.pipe_left
                                      (fun _0_74  ->
                                         FStar_TypeChecker_Common.TProb _0_74)
                                      (let uu___171_12275 = problem in
                                       {
                                         FStar_TypeChecker_Common.pid =
                                           (uu___171_12275.FStar_TypeChecker_Common.pid);
                                         FStar_TypeChecker_Common.lhs =
                                           (uu___171_12275.FStar_TypeChecker_Common.lhs);
                                         FStar_TypeChecker_Common.relation =
                                           new_rel;
                                         FStar_TypeChecker_Common.rhs =
                                           (uu___171_12275.FStar_TypeChecker_Common.rhs);
                                         FStar_TypeChecker_Common.element =
                                           (uu___171_12275.FStar_TypeChecker_Common.element);
                                         FStar_TypeChecker_Common.logical_guard
                                           =
                                           (uu___171_12275.FStar_TypeChecker_Common.logical_guard);
                                         FStar_TypeChecker_Common.scope =
                                           (uu___171_12275.FStar_TypeChecker_Common.scope);
                                         FStar_TypeChecker_Common.reason =
                                           (uu___171_12275.FStar_TypeChecker_Common.reason);
                                         FStar_TypeChecker_Common.loc =
                                           (uu___171_12275.FStar_TypeChecker_Common.loc);
                                         FStar_TypeChecker_Common.rank =
                                           (uu___171_12275.FStar_TypeChecker_Common.rank)
                                       }) in
                                  let uu____12276 =
                                    destruct_flex_pattern env t1 in
                                  solve_t_flex_rigid false uu____12272
                                    uu____12276 t_base wl
                              | Some (y,phi) ->
                                  let y' =
                                    let uu___172_12291 = y in
                                    {
                                      FStar_Syntax_Syntax.ppname =
                                        (uu___172_12291.FStar_Syntax_Syntax.ppname);
                                      FStar_Syntax_Syntax.index =
                                        (uu___172_12291.FStar_Syntax_Syntax.index);
>>>>>>> origin/guido_tactics
                                      FStar_Syntax_Syntax.sort = t1
                                    } in
                                  let impl =
                                    guard_on_element wl problem y' phi in
                                  let base_prob =
<<<<<<< HEAD
                                    let uu____12438 =
=======
                                    let uu____12294 =
>>>>>>> origin/guido_tactics
                                      mk_problem
                                        problem.FStar_TypeChecker_Common.scope
                                        orig t1 new_rel
                                        y.FStar_Syntax_Syntax.sort
                                        problem.FStar_TypeChecker_Common.element
                                        "flex-rigid: base type" in
                                    FStar_All.pipe_left
<<<<<<< HEAD
                                      (fun _0_70  ->
                                         FStar_TypeChecker_Common.TProb _0_70)
                                      uu____12438 in
                                  let guard =
                                    let uu____12446 =
                                      FStar_All.pipe_right
                                        (p_guard base_prob)
                                        FStar_Pervasives.fst in
                                    FStar_Syntax_Util.mk_conj uu____12446
=======
                                      (fun _0_75  ->
                                         FStar_TypeChecker_Common.TProb _0_75)
                                      uu____12294 in
                                  let guard =
                                    let uu____12302 =
                                      FStar_All.pipe_right
                                        (p_guard base_prob)
                                        FStar_Pervasives.fst in
                                    FStar_Syntax_Util.mk_conj uu____12302
>>>>>>> origin/guido_tactics
                                      impl in
                                  let wl1 =
                                    solve_prob orig (Some guard) [] wl in
                                  solve env (attempt [base_prob] wl1))))
<<<<<<< HEAD
               | (uu____12452,FStar_Syntax_Syntax.Tm_uvar uu____12453) ->
=======
               | (uu____12308,FStar_Syntax_Syntax.Tm_uvar uu____12309) ->
>>>>>>> origin/guido_tactics
                   if wl.defer_ok
                   then
                     solve env
                       (defer "rigid-flex subtyping deferred" orig wl)
                   else
<<<<<<< HEAD
                     (let uu____12465 = base_and_refinement env wl t1 in
                      match uu____12465 with
                      | (t_base,uu____12476) ->
                          solve_t env
                            (let uu___171_12492 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___171_12492.FStar_TypeChecker_Common.pid);
=======
                     (let uu____12319 = base_and_refinement env wl t1 in
                      match uu____12319 with
                      | (t_base,uu____12330) ->
                          solve_t env
                            (let uu___173_12345 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___173_12345.FStar_TypeChecker_Common.pid);
>>>>>>> origin/guido_tactics
                               FStar_TypeChecker_Common.lhs = t_base;
                               FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ;
                               FStar_TypeChecker_Common.rhs =
<<<<<<< HEAD
                                 (uu___171_12492.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___171_12492.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___171_12492.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___171_12492.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___171_12492.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___171_12492.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___171_12492.FStar_TypeChecker_Common.rank)
                             }) wl)
               | (uu____12495,FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____12496;
                     FStar_Syntax_Syntax.tk = uu____12497;
                     FStar_Syntax_Syntax.pos = uu____12498;
                     FStar_Syntax_Syntax.vars = uu____12499;_},uu____12500))
=======
                                 (uu___173_12345.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___173_12345.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___173_12345.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___173_12345.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___173_12345.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___173_12345.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___173_12345.FStar_TypeChecker_Common.rank)
                             }) wl)
               | (uu____12348,FStar_Syntax_Syntax.Tm_app
                  ({
                     FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar
                       uu____12349;
                     FStar_Syntax_Syntax.tk = uu____12350;
                     FStar_Syntax_Syntax.pos = uu____12351;
                     FStar_Syntax_Syntax.vars = uu____12352;_},uu____12353))
>>>>>>> origin/guido_tactics
                   ->
                   if wl.defer_ok
                   then
                     solve env
                       (defer "rigid-flex subtyping deferred" orig wl)
                   else
<<<<<<< HEAD
                     (let uu____12526 = base_and_refinement env wl t1 in
                      match uu____12526 with
                      | (t_base,uu____12537) ->
                          solve_t env
                            (let uu___171_12553 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___171_12553.FStar_TypeChecker_Common.pid);
=======
                     (let uu____12377 = base_and_refinement env wl t1 in
                      match uu____12377 with
                      | (t_base,uu____12388) ->
                          solve_t env
                            (let uu___173_12403 = problem in
                             {
                               FStar_TypeChecker_Common.pid =
                                 (uu___173_12403.FStar_TypeChecker_Common.pid);
>>>>>>> origin/guido_tactics
                               FStar_TypeChecker_Common.lhs = t_base;
                               FStar_TypeChecker_Common.relation =
                                 FStar_TypeChecker_Common.EQ;
                               FStar_TypeChecker_Common.rhs =
<<<<<<< HEAD
                                 (uu___171_12553.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___171_12553.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___171_12553.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___171_12553.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___171_12553.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___171_12553.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___171_12553.FStar_TypeChecker_Common.rank)
                             }) wl)
               | (FStar_Syntax_Syntax.Tm_refine uu____12556,uu____12557) ->
                   let t21 =
                     let uu____12565 = base_and_refinement env wl t2 in
                     FStar_All.pipe_left force_refinement uu____12565 in
                   solve_t env
                     (let uu___172_12579 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___172_12579.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___172_12579.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          (uu___172_12579.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs = t21;
                        FStar_TypeChecker_Common.element =
                          (uu___172_12579.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___172_12579.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___172_12579.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___172_12579.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___172_12579.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___172_12579.FStar_TypeChecker_Common.rank)
                      }) wl
               | (uu____12580,FStar_Syntax_Syntax.Tm_refine uu____12581) ->
                   let t11 =
                     let uu____12589 = base_and_refinement env wl t1 in
                     FStar_All.pipe_left force_refinement uu____12589 in
                   solve_t env
                     (let uu___173_12603 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___173_12603.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs = t11;
                        FStar_TypeChecker_Common.relation =
                          (uu___173_12603.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs =
                          (uu___173_12603.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___173_12603.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___173_12603.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___173_12603.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___173_12603.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___173_12603.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___173_12603.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_match uu____12606,uu____12607) ->
                   let head1 =
                     let uu____12625 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12625 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12656 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12656 FStar_Pervasives.fst in
                   let uu____12684 =
=======
                                 (uu___173_12403.FStar_TypeChecker_Common.rhs);
                               FStar_TypeChecker_Common.element =
                                 (uu___173_12403.FStar_TypeChecker_Common.element);
                               FStar_TypeChecker_Common.logical_guard =
                                 (uu___173_12403.FStar_TypeChecker_Common.logical_guard);
                               FStar_TypeChecker_Common.scope =
                                 (uu___173_12403.FStar_TypeChecker_Common.scope);
                               FStar_TypeChecker_Common.reason =
                                 (uu___173_12403.FStar_TypeChecker_Common.reason);
                               FStar_TypeChecker_Common.loc =
                                 (uu___173_12403.FStar_TypeChecker_Common.loc);
                               FStar_TypeChecker_Common.rank =
                                 (uu___173_12403.FStar_TypeChecker_Common.rank)
                             }) wl)
               | (FStar_Syntax_Syntax.Tm_refine uu____12406,uu____12407) ->
                   let t21 =
                     let uu____12415 = base_and_refinement env wl t2 in
                     FStar_All.pipe_left force_refinement uu____12415 in
                   solve_t env
                     (let uu___174_12428 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___174_12428.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___174_12428.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          (uu___174_12428.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs = t21;
                        FStar_TypeChecker_Common.element =
                          (uu___174_12428.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___174_12428.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___174_12428.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___174_12428.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___174_12428.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___174_12428.FStar_TypeChecker_Common.rank)
                      }) wl
               | (uu____12429,FStar_Syntax_Syntax.Tm_refine uu____12430) ->
                   let t11 =
                     let uu____12438 = base_and_refinement env wl t1 in
                     FStar_All.pipe_left force_refinement uu____12438 in
                   solve_t env
                     (let uu___175_12451 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___175_12451.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs = t11;
                        FStar_TypeChecker_Common.relation =
                          (uu___175_12451.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs =
                          (uu___175_12451.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___175_12451.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___175_12451.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___175_12451.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___175_12451.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___175_12451.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___175_12451.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_match uu____12454,uu____12455) ->
                   let head1 =
                     let uu____12474 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12474 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12505 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12505 FStar_Pervasives.fst in
                   let uu____12533 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____12684
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12693 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12693
                      then
                        let guard =
                          let uu____12700 =
                            let uu____12701 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12701 = FStar_Syntax_Util.Equal in
                          if uu____12700
                          then None
                          else
                            (let uu____12704 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_71  -> Some _0_71)
                               uu____12704) in
                        let uu____12706 = solve_prob orig guard [] wl in
                        solve env uu____12706
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_uinst uu____12709,uu____12710) ->
=======
                   if uu____12533
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12542 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12542
                      then
                        let guard =
                          let uu____12549 =
                            let uu____12550 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12550 = FStar_Syntax_Util.Equal in
                          if uu____12549
                          then None
                          else
                            (let uu____12553 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_76  -> Some _0_76)
                               uu____12553) in
                        let uu____12555 = solve_prob orig guard [] wl in
                        solve env uu____12555
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_uinst uu____12558,uu____12559) ->
                   let head1 =
                     let uu____12567 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12567 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12598 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12598 FStar_Pervasives.fst in
                   let uu____12626 =
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
                   if uu____12626
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12635 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12635
                      then
                        let guard =
                          let uu____12642 =
                            let uu____12643 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12643 = FStar_Syntax_Util.Equal in
                          if uu____12642
                          then None
                          else
                            (let uu____12646 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_77  -> Some _0_77)
                               uu____12646) in
                        let uu____12648 = solve_prob orig guard [] wl in
                        solve env uu____12648
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_name uu____12651,uu____12652) ->
>>>>>>> origin/guido_tactics
                   let head1 =
                     let uu____12718 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12718 FStar_Pervasives.fst in
                   let head2 =
<<<<<<< HEAD
                     let uu____12749 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12749 FStar_Pervasives.fst in
                   let uu____12777 =
=======
                     let uu____12687 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12687 FStar_Pervasives.fst in
                   let uu____12715 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____12777
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12786 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12786
                      then
                        let guard =
                          let uu____12793 =
                            let uu____12794 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12794 = FStar_Syntax_Util.Equal in
                          if uu____12793
                          then None
                          else
                            (let uu____12797 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_72  -> Some _0_72)
                               uu____12797) in
                        let uu____12799 = solve_prob orig guard [] wl in
                        solve env uu____12799
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_name uu____12802,uu____12803) ->
                   let head1 =
                     let uu____12807 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12807 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12838 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12838 FStar_Pervasives.fst in
                   let uu____12866 =
=======
                   if uu____12715
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12724 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12724
                      then
                        let guard =
                          let uu____12731 =
                            let uu____12732 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12732 = FStar_Syntax_Util.Equal in
                          if uu____12731
                          then None
                          else
                            (let uu____12735 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_78  -> Some _0_78)
                               uu____12735) in
                        let uu____12737 = solve_prob orig guard [] wl in
                        solve env uu____12737
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_constant uu____12740,uu____12741) ->
                   let head1 =
                     let uu____12745 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12745 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12776 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12776 FStar_Pervasives.fst in
                   let uu____12804 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____12866
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12875 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12875
                      then
                        let guard =
                          let uu____12882 =
                            let uu____12883 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12883 = FStar_Syntax_Util.Equal in
                          if uu____12882
                          then None
                          else
                            (let uu____12886 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_73  -> Some _0_73)
                               uu____12886) in
                        let uu____12888 = solve_prob orig guard [] wl in
                        solve env uu____12888
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_constant uu____12891,uu____12892) ->
                   let head1 =
                     let uu____12896 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12896 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12927 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12927 FStar_Pervasives.fst in
                   let uu____12955 =
=======
                   if uu____12804
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12813 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12813
                      then
                        let guard =
                          let uu____12820 =
                            let uu____12821 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12821 = FStar_Syntax_Util.Equal in
                          if uu____12820
                          then None
                          else
                            (let uu____12824 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_79  -> Some _0_79)
                               uu____12824) in
                        let uu____12826 = solve_prob orig guard [] wl in
                        solve env uu____12826
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_fvar uu____12829,uu____12830) ->
                   let head1 =
                     let uu____12834 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12834 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12865 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12865 FStar_Pervasives.fst in
                   let uu____12893 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____12955
=======
                   if uu____12893
>>>>>>> origin/guido_tactics
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____12964 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____12964
                      then
                        let guard =
                          let uu____12971 =
                            let uu____12972 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____12972 = FStar_Syntax_Util.Equal in
                          if uu____12971
                          then None
                          else
<<<<<<< HEAD
                            (let uu____12975 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_74  -> Some _0_74)
                               uu____12975) in
                        let uu____12977 = solve_prob orig guard [] wl in
                        solve env uu____12977
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_fvar uu____12980,uu____12981) ->
                   let head1 =
                     let uu____12985 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12985 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13016 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13016 FStar_Pervasives.fst in
                   let uu____13044 =
=======
                            (let uu____12913 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_80  -> Some _0_80)
                               uu____12913) in
                        let uu____12915 = solve_prob orig guard [] wl in
                        solve env uu____12915
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_app uu____12918,uu____12919) ->
                   let head1 =
                     let uu____12932 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____12932 FStar_Pervasives.fst in
                   let head2 =
                     let uu____12963 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____12963 FStar_Pervasives.fst in
                   let uu____12991 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13044
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13053 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13053
                      then
                        let guard =
                          let uu____13060 =
                            let uu____13061 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13061 = FStar_Syntax_Util.Equal in
                          if uu____13060
                          then None
                          else
                            (let uu____13064 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_75  -> Some _0_75)
                               uu____13064) in
                        let uu____13066 = solve_prob orig guard [] wl in
                        solve env uu____13066
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_app uu____13069,uu____13070) ->
                   let head1 =
                     let uu____13083 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13083 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13114 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13114 FStar_Pervasives.fst in
                   let uu____13142 =
=======
                   if uu____12991
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13000 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13000
                      then
                        let guard =
                          let uu____13007 =
                            let uu____13008 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13008 = FStar_Syntax_Util.Equal in
                          if uu____13007
                          then None
                          else
                            (let uu____13011 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_81  -> Some _0_81)
                               uu____13011) in
                        let uu____13013 = solve_prob orig guard [] wl in
                        solve env uu____13013
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13016,FStar_Syntax_Syntax.Tm_match uu____13017) ->
                   let head1 =
                     let uu____13036 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13036 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13067 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13067 FStar_Pervasives.fst in
                   let uu____13095 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13142
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13151 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13151
                      then
                        let guard =
                          let uu____13158 =
                            let uu____13159 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13159 = FStar_Syntax_Util.Equal in
                          if uu____13158
                          then None
                          else
                            (let uu____13162 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_76  -> Some _0_76)
                               uu____13162) in
                        let uu____13164 = solve_prob orig guard [] wl in
                        solve env uu____13164
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13167,FStar_Syntax_Syntax.Tm_match uu____13168) ->
                   let head1 =
                     let uu____13186 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13186 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13217 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13217 FStar_Pervasives.fst in
                   let uu____13245 =
=======
                   if uu____13095
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13104 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13104
                      then
                        let guard =
                          let uu____13111 =
                            let uu____13112 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13112 = FStar_Syntax_Util.Equal in
                          if uu____13111
                          then None
                          else
                            (let uu____13115 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_82  -> Some _0_82)
                               uu____13115) in
                        let uu____13117 = solve_prob orig guard [] wl in
                        solve env uu____13117
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13120,FStar_Syntax_Syntax.Tm_uinst uu____13121) ->
                   let head1 =
                     let uu____13129 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13129 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13160 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13160 FStar_Pervasives.fst in
                   let uu____13188 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13245
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13254 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13254
                      then
                        let guard =
                          let uu____13261 =
                            let uu____13262 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13262 = FStar_Syntax_Util.Equal in
                          if uu____13261
                          then None
                          else
                            (let uu____13265 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_77  -> Some _0_77)
                               uu____13265) in
                        let uu____13267 = solve_prob orig guard [] wl in
                        solve env uu____13267
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13270,FStar_Syntax_Syntax.Tm_uinst uu____13271) ->
=======
                   if uu____13188
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13197 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13197
                      then
                        let guard =
                          let uu____13204 =
                            let uu____13205 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13205 = FStar_Syntax_Util.Equal in
                          if uu____13204
                          then None
                          else
                            (let uu____13208 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_83  -> Some _0_83)
                               uu____13208) in
                        let uu____13210 = solve_prob orig guard [] wl in
                        solve env uu____13210
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13213,FStar_Syntax_Syntax.Tm_name uu____13214) ->
>>>>>>> origin/guido_tactics
                   let head1 =
                     let uu____13279 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13279 FStar_Pervasives.fst in
                   let head2 =
<<<<<<< HEAD
                     let uu____13310 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13310 FStar_Pervasives.fst in
                   let uu____13338 =
=======
                     let uu____13249 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13249 FStar_Pervasives.fst in
                   let uu____13277 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13338
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13347 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13347
                      then
                        let guard =
                          let uu____13354 =
                            let uu____13355 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13355 = FStar_Syntax_Util.Equal in
                          if uu____13354
                          then None
                          else
                            (let uu____13358 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_78  -> Some _0_78)
                               uu____13358) in
                        let uu____13360 = solve_prob orig guard [] wl in
                        solve env uu____13360
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13363,FStar_Syntax_Syntax.Tm_name uu____13364) ->
                   let head1 =
                     let uu____13368 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13368 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13399 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13399 FStar_Pervasives.fst in
                   let uu____13427 =
=======
                   if uu____13277
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13286 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13286
                      then
                        let guard =
                          let uu____13293 =
                            let uu____13294 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13294 = FStar_Syntax_Util.Equal in
                          if uu____13293
                          then None
                          else
                            (let uu____13297 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_84  -> Some _0_84)
                               uu____13297) in
                        let uu____13299 = solve_prob orig guard [] wl in
                        solve env uu____13299
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13302,FStar_Syntax_Syntax.Tm_constant uu____13303) ->
                   let head1 =
                     let uu____13307 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13307 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13338 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13338 FStar_Pervasives.fst in
                   let uu____13366 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13427
=======
                   if uu____13366
>>>>>>> origin/guido_tactics
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13436 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13436
                      then
                        let guard =
                          let uu____13443 =
                            let uu____13444 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13444 = FStar_Syntax_Util.Equal in
                          if uu____13443
                          then None
                          else
<<<<<<< HEAD
                            (let uu____13447 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_79  -> Some _0_79)
                               uu____13447) in
                        let uu____13449 = solve_prob orig guard [] wl in
                        solve env uu____13449
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13452,FStar_Syntax_Syntax.Tm_constant uu____13453) ->
=======
                            (let uu____13386 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_85  -> Some _0_85)
                               uu____13386) in
                        let uu____13388 = solve_prob orig guard [] wl in
                        solve env uu____13388
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13391,FStar_Syntax_Syntax.Tm_fvar uu____13392) ->
>>>>>>> origin/guido_tactics
                   let head1 =
                     let uu____13457 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13457 FStar_Pervasives.fst in
                   let head2 =
<<<<<<< HEAD
                     let uu____13488 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13488 FStar_Pervasives.fst in
                   let uu____13516 =
=======
                     let uu____13427 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13427 FStar_Pervasives.fst in
                   let uu____13455 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13516
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13525 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13525
                      then
                        let guard =
                          let uu____13532 =
                            let uu____13533 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13533 = FStar_Syntax_Util.Equal in
                          if uu____13532
                          then None
                          else
                            (let uu____13536 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_80  -> Some _0_80)
                               uu____13536) in
                        let uu____13538 = solve_prob orig guard [] wl in
                        solve env uu____13538
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13541,FStar_Syntax_Syntax.Tm_fvar uu____13542) ->
                   let head1 =
                     let uu____13546 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13546 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13577 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13577 FStar_Pervasives.fst in
                   let uu____13605 =
=======
                   if uu____13455
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13464 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13464
                      then
                        let guard =
                          let uu____13471 =
                            let uu____13472 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13472 = FStar_Syntax_Util.Equal in
                          if uu____13471
                          then None
                          else
                            (let uu____13475 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_86  -> Some _0_86)
                               uu____13475) in
                        let uu____13477 = solve_prob orig guard [] wl in
                        solve env uu____13477
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13480,FStar_Syntax_Syntax.Tm_app uu____13481) ->
                   let head1 =
                     let uu____13494 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13494 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13525 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13525 FStar_Pervasives.fst in
                   let uu____13553 =
>>>>>>> origin/guido_tactics
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
<<<<<<< HEAD
                   if uu____13605
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13614 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13614
                      then
                        let guard =
                          let uu____13621 =
                            let uu____13622 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13622 = FStar_Syntax_Util.Equal in
                          if uu____13621
                          then None
                          else
                            (let uu____13625 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_81  -> Some _0_81)
                               uu____13625) in
                        let uu____13627 = solve_prob orig guard [] wl in
                        solve env uu____13627
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (uu____13630,FStar_Syntax_Syntax.Tm_app uu____13631) ->
                   let head1 =
                     let uu____13644 = FStar_Syntax_Util.head_and_args t1 in
                     FStar_All.pipe_right uu____13644 FStar_Pervasives.fst in
                   let head2 =
                     let uu____13675 = FStar_Syntax_Util.head_and_args t2 in
                     FStar_All.pipe_right uu____13675 FStar_Pervasives.fst in
                   let uu____13703 =
                     (((FStar_TypeChecker_Env.is_interpreted env head1) ||
                         (FStar_TypeChecker_Env.is_interpreted env head2))
                        && wl.smt_ok)
                       &&
                       (problem.FStar_TypeChecker_Common.relation =
                          FStar_TypeChecker_Common.EQ) in
                   if uu____13703
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13712 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13712
                      then
                        let guard =
                          let uu____13719 =
                            let uu____13720 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13720 = FStar_Syntax_Util.Equal in
                          if uu____13719
                          then None
                          else
                            (let uu____13723 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_82  -> Some _0_82)
                               uu____13723) in
                        let uu____13725 = solve_prob orig guard [] wl in
                        solve env uu____13725
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_ascribed
                  (t11,uu____13729,uu____13730),uu____13731) ->
                   solve_t' env
                     (let uu___174_13761 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___174_13761.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs = t11;
                        FStar_TypeChecker_Common.relation =
                          (uu___174_13761.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs =
                          (uu___174_13761.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___174_13761.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___174_13761.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___174_13761.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___174_13761.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___174_13761.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___174_13761.FStar_TypeChecker_Common.rank)
                      }) wl
               | (uu____13764,FStar_Syntax_Syntax.Tm_ascribed
                  (t21,uu____13766,uu____13767)) ->
                   solve_t' env
                     (let uu___175_13797 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___175_13797.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___175_13797.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          (uu___175_13797.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs = t21;
                        FStar_TypeChecker_Common.element =
                          (uu___175_13797.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___175_13797.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___175_13797.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___175_13797.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___175_13797.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___175_13797.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_let uu____13798,uu____13799) ->
                   let uu____13807 =
                     let uu____13808 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13809 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13808
                       uu____13809 in
                   failwith uu____13807
               | (FStar_Syntax_Syntax.Tm_meta uu____13810,uu____13811) ->
                   let uu____13816 =
                     let uu____13817 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13818 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13817
                       uu____13818 in
                   failwith uu____13816
               | (FStar_Syntax_Syntax.Tm_delayed uu____13819,uu____13820) ->
                   let uu____13841 =
                     let uu____13842 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13843 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13842
                       uu____13843 in
                   failwith uu____13841
               | (uu____13844,FStar_Syntax_Syntax.Tm_meta uu____13845) ->
                   let uu____13850 =
                     let uu____13851 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13852 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13851
                       uu____13852 in
                   failwith uu____13850
               | (uu____13853,FStar_Syntax_Syntax.Tm_delayed uu____13854) ->
                   let uu____13875 =
                     let uu____13876 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13877 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13876
                       uu____13877 in
                   failwith uu____13875
               | (uu____13878,FStar_Syntax_Syntax.Tm_let uu____13879) ->
                   let uu____13887 =
                     let uu____13888 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13889 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13888
                       uu____13889 in
                   failwith uu____13887
               | uu____13890 -> giveup env "head tag mismatch" orig)))
=======
                   if uu____13553
                   then
                     let uv1 = FStar_Syntax_Free.uvars t1 in
                     let uv2 = FStar_Syntax_Free.uvars t2 in
                     let uu____13562 =
                       (FStar_Util.set_is_empty uv1) &&
                         (FStar_Util.set_is_empty uv2) in
                     (if uu____13562
                      then
                        let guard =
                          let uu____13569 =
                            let uu____13570 = FStar_Syntax_Util.eq_tm t1 t2 in
                            uu____13570 = FStar_Syntax_Util.Equal in
                          if uu____13569
                          then None
                          else
                            (let uu____13573 = mk_eq2 env t1 t2 in
                             FStar_All.pipe_left (fun _0_87  -> Some _0_87)
                               uu____13573) in
                        let uu____13575 = solve_prob orig guard [] wl in
                        solve env uu____13575
                      else rigid_rigid_delta env orig wl head1 head2 t1 t2)
                   else rigid_rigid_delta env orig wl head1 head2 t1 t2
               | (FStar_Syntax_Syntax.Tm_ascribed
                  (t11,uu____13579,uu____13580),uu____13581) ->
                   solve_t' env
                     (let uu___176_13610 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___176_13610.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs = t11;
                        FStar_TypeChecker_Common.relation =
                          (uu___176_13610.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs =
                          (uu___176_13610.FStar_TypeChecker_Common.rhs);
                        FStar_TypeChecker_Common.element =
                          (uu___176_13610.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___176_13610.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___176_13610.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___176_13610.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___176_13610.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___176_13610.FStar_TypeChecker_Common.rank)
                      }) wl
               | (uu____13613,FStar_Syntax_Syntax.Tm_ascribed
                  (t21,uu____13615,uu____13616)) ->
                   solve_t' env
                     (let uu___177_13645 = problem in
                      {
                        FStar_TypeChecker_Common.pid =
                          (uu___177_13645.FStar_TypeChecker_Common.pid);
                        FStar_TypeChecker_Common.lhs =
                          (uu___177_13645.FStar_TypeChecker_Common.lhs);
                        FStar_TypeChecker_Common.relation =
                          (uu___177_13645.FStar_TypeChecker_Common.relation);
                        FStar_TypeChecker_Common.rhs = t21;
                        FStar_TypeChecker_Common.element =
                          (uu___177_13645.FStar_TypeChecker_Common.element);
                        FStar_TypeChecker_Common.logical_guard =
                          (uu___177_13645.FStar_TypeChecker_Common.logical_guard);
                        FStar_TypeChecker_Common.scope =
                          (uu___177_13645.FStar_TypeChecker_Common.scope);
                        FStar_TypeChecker_Common.reason =
                          (uu___177_13645.FStar_TypeChecker_Common.reason);
                        FStar_TypeChecker_Common.loc =
                          (uu___177_13645.FStar_TypeChecker_Common.loc);
                        FStar_TypeChecker_Common.rank =
                          (uu___177_13645.FStar_TypeChecker_Common.rank)
                      }) wl
               | (FStar_Syntax_Syntax.Tm_let uu____13646,uu____13647) ->
                   let uu____13655 =
                     let uu____13656 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13657 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13656
                       uu____13657 in
                   failwith uu____13655
               | (FStar_Syntax_Syntax.Tm_meta uu____13658,uu____13659) ->
                   let uu____13664 =
                     let uu____13665 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13666 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13665
                       uu____13666 in
                   failwith uu____13664
               | (FStar_Syntax_Syntax.Tm_delayed uu____13667,uu____13668) ->
                   let uu____13683 =
                     let uu____13684 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13685 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13684
                       uu____13685 in
                   failwith uu____13683
               | (uu____13686,FStar_Syntax_Syntax.Tm_meta uu____13687) ->
                   let uu____13692 =
                     let uu____13693 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13694 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13693
                       uu____13694 in
                   failwith uu____13692
               | (uu____13695,FStar_Syntax_Syntax.Tm_delayed uu____13696) ->
                   let uu____13711 =
                     let uu____13712 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13713 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13712
                       uu____13713 in
                   failwith uu____13711
               | (uu____13714,FStar_Syntax_Syntax.Tm_let uu____13715) ->
                   let uu____13723 =
                     let uu____13724 = FStar_Syntax_Print.tag_of_term t1 in
                     let uu____13725 = FStar_Syntax_Print.tag_of_term t2 in
                     FStar_Util.format2 "Impossible: %s and %s" uu____13724
                       uu____13725 in
                   failwith uu____13723
               | uu____13726 -> giveup env "head tag mismatch" orig)))
>>>>>>> origin/guido_tactics
and solve_c:
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.comp,Prims.unit) FStar_TypeChecker_Common.problem ->
      worklist -> solution
  =
  fun env  ->
    fun problem  ->
      fun wl  ->
        let c1 = problem.FStar_TypeChecker_Common.lhs in
        let c2 = problem.FStar_TypeChecker_Common.rhs in
        let orig = FStar_TypeChecker_Common.CProb problem in
        let sub_prob t1 rel t2 reason =
          mk_problem (p_scope orig) orig t1 rel t2 None reason in
        let solve_eq c1_comp c2_comp =
<<<<<<< HEAD
          (let uu____13922 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "EQ") in
           if uu____13922
=======
          (let uu____13758 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "EQ") in
           if uu____13758
>>>>>>> origin/guido_tactics
           then
             FStar_Util.print_string
               "solve_c is using an equality constraint\n"
           else ());
          (let sub_probs =
             FStar_List.map2
<<<<<<< HEAD
               (fun uu____13937  ->
                  fun uu____13938  ->
                    match (uu____13937, uu____13938) with
                    | ((a1,uu____13948),(a2,uu____13950)) ->
                        let uu____13955 =
                          sub_prob a1 FStar_TypeChecker_Common.EQ a2
                            "effect arg" in
                        FStar_All.pipe_left
                          (fun _0_83  -> FStar_TypeChecker_Common.TProb _0_83)
                          uu____13955)
               c1_comp.FStar_Syntax_Syntax.effect_args
               c2_comp.FStar_Syntax_Syntax.effect_args in
           let guard =
             let uu____13961 =
=======
               (fun uu____13766  ->
                  fun uu____13767  ->
                    match (uu____13766, uu____13767) with
                    | ((a1,uu____13777),(a2,uu____13779)) ->
                        let uu____13784 =
                          sub_prob a1 FStar_TypeChecker_Common.EQ a2
                            "effect arg" in
                        FStar_All.pipe_left
                          (fun _0_88  -> FStar_TypeChecker_Common.TProb _0_88)
                          uu____13784)
               c1_comp.FStar_Syntax_Syntax.effect_args
               c2_comp.FStar_Syntax_Syntax.effect_args in
           let guard =
             let uu____13790 =
>>>>>>> origin/guido_tactics
               FStar_List.map
                 (fun p  ->
                    FStar_All.pipe_right (p_guard p) FStar_Pervasives.fst)
                 sub_probs in
<<<<<<< HEAD
             FStar_Syntax_Util.mk_conj_l uu____13961 in
=======
             FStar_Syntax_Util.mk_conj_l uu____13790 in
>>>>>>> origin/guido_tactics
           let wl1 = solve_prob orig (Some guard) [] wl in
           solve env (attempt sub_probs wl1)) in
        let solve_sub c11 edge c21 =
          let r = FStar_TypeChecker_Env.get_range env in
<<<<<<< HEAD
          let lift_c1 uu____13982 =
            let wp =
              match c11.FStar_Syntax_Syntax.effect_args with
              | (wp1,uu____13989)::[] -> wp1
              | uu____14002 ->
                  let uu____14008 =
                    let uu____14009 =
=======
          let lift_c1 uu____13810 =
            let wp =
              match c11.FStar_Syntax_Syntax.effect_args with
              | (wp1,uu____13817)::[] -> wp1
              | uu____13830 ->
                  let uu____13836 =
                    let uu____13837 =
>>>>>>> origin/guido_tactics
                      FStar_Range.string_of_range
                        (FStar_Ident.range_of_lid
                           c11.FStar_Syntax_Syntax.effect_name) in
                    FStar_Util.format1
                      "Unexpected number of indices on a normalized effect (%s)"
<<<<<<< HEAD
                      uu____14009 in
                  failwith uu____14008 in
            let uu____14012 =
              let uu____14018 =
                let uu____14019 =
                  (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                    c11.FStar_Syntax_Syntax.result_typ wp in
                FStar_Syntax_Syntax.as_arg uu____14019 in
              [uu____14018] in
=======
                      uu____13837 in
                  failwith uu____13836 in
            let uu____13840 =
              let uu____13846 =
                let uu____13847 =
                  (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                    c11.FStar_Syntax_Syntax.result_typ wp in
                FStar_Syntax_Syntax.as_arg uu____13847 in
              [uu____13846] in
>>>>>>> origin/guido_tactics
            {
              FStar_Syntax_Syntax.comp_univs =
                (c11.FStar_Syntax_Syntax.comp_univs);
              FStar_Syntax_Syntax.effect_name =
                (c21.FStar_Syntax_Syntax.effect_name);
              FStar_Syntax_Syntax.result_typ =
                (c11.FStar_Syntax_Syntax.result_typ);
<<<<<<< HEAD
              FStar_Syntax_Syntax.effect_args = uu____14012;
=======
              FStar_Syntax_Syntax.effect_args = uu____13840;
>>>>>>> origin/guido_tactics
              FStar_Syntax_Syntax.flags = (c11.FStar_Syntax_Syntax.flags)
            } in
          if
            problem.FStar_TypeChecker_Common.relation =
              FStar_TypeChecker_Common.EQ
<<<<<<< HEAD
          then let uu____14020 = lift_c1 () in solve_eq uu____14020 c21
=======
          then let uu____13848 = lift_c1 () in solve_eq uu____13848 c21
>>>>>>> origin/guido_tactics
          else
            (let is_null_wp_2 =
               FStar_All.pipe_right c21.FStar_Syntax_Syntax.flags
                 (FStar_Util.for_some
<<<<<<< HEAD
                    (fun uu___132_14025  ->
                       match uu___132_14025 with
                       | FStar_Syntax_Syntax.TOTAL  -> true
                       | FStar_Syntax_Syntax.MLEFFECT  -> true
                       | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
                       | uu____14026 -> false)) in
             let uu____14027 =
               match ((c11.FStar_Syntax_Syntax.effect_args),
                       (c21.FStar_Syntax_Syntax.effect_args))
               with
               | ((wp1,uu____14051)::uu____14052,(wp2,uu____14054)::uu____14055)
                   -> (wp1, wp2)
               | uu____14096 ->
                   let uu____14109 =
                     let uu____14110 =
                       let uu____14113 =
                         let uu____14114 =
                           FStar_Syntax_Print.lid_to_string
                             c11.FStar_Syntax_Syntax.effect_name in
                         let uu____14115 =
=======
                    (fun uu___134_13852  ->
                       match uu___134_13852 with
                       | FStar_Syntax_Syntax.TOTAL  -> true
                       | FStar_Syntax_Syntax.MLEFFECT  -> true
                       | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
                       | uu____13853 -> false)) in
             let uu____13854 =
               match ((c11.FStar_Syntax_Syntax.effect_args),
                       (c21.FStar_Syntax_Syntax.effect_args))
               with
               | ((wp1,uu____13878)::uu____13879,(wp2,uu____13881)::uu____13882)
                   -> (wp1, wp2)
               | uu____13923 ->
                   let uu____13936 =
                     let uu____13937 =
                       let uu____13940 =
                         let uu____13941 =
                           FStar_Syntax_Print.lid_to_string
                             c11.FStar_Syntax_Syntax.effect_name in
                         let uu____13942 =
>>>>>>> origin/guido_tactics
                           FStar_Syntax_Print.lid_to_string
                             c21.FStar_Syntax_Syntax.effect_name in
                         FStar_Util.format2
                           "Got effects %s and %s, expected normalized effects"
<<<<<<< HEAD
                           uu____14114 uu____14115 in
                       (uu____14113, (env.FStar_TypeChecker_Env.range)) in
                     FStar_Errors.Error uu____14110 in
                   raise uu____14109 in
             match uu____14027 with
             | (wpc1,wpc2) ->
                 let uu____14132 = FStar_Util.physical_equality wpc1 wpc2 in
                 if uu____14132
                 then
                   let uu____14135 =
=======
                           uu____13941 uu____13942 in
                       (uu____13940, (env.FStar_TypeChecker_Env.range)) in
                     FStar_Errors.Error uu____13937 in
                   raise uu____13936 in
             match uu____13854 with
             | (wpc1,wpc2) ->
                 let uu____13959 = FStar_Util.physical_equality wpc1 wpc2 in
                 if uu____13959
                 then
                   let uu____13962 =
>>>>>>> origin/guido_tactics
                     problem_using_guard orig
                       c11.FStar_Syntax_Syntax.result_typ
                       problem.FStar_TypeChecker_Common.relation
                       c21.FStar_Syntax_Syntax.result_typ None "result type" in
<<<<<<< HEAD
                   solve_t env uu____14135 wl
                 else
                   (let uu____14139 =
                      let uu____14143 =
                        FStar_TypeChecker_Env.effect_decl_opt env
                          c21.FStar_Syntax_Syntax.effect_name in
                      FStar_Util.must uu____14143 in
                    match uu____14139 with
                    | (c2_decl,qualifiers) ->
                        let uu____14155 =
                          FStar_All.pipe_right qualifiers
                            (FStar_List.contains
                               FStar_Syntax_Syntax.Reifiable) in
                        if uu____14155
                        then
                          let c1_repr =
                            let uu____14158 =
                              let uu____14159 =
                                let uu____14160 = lift_c1 () in
                                FStar_Syntax_Syntax.mk_Comp uu____14160 in
                              let uu____14161 =
                                env.FStar_TypeChecker_Env.universe_of env
                                  c11.FStar_Syntax_Syntax.result_typ in
                              FStar_TypeChecker_Env.reify_comp env
                                uu____14159 uu____14161 in
=======
                   solve_t env uu____13962 wl
                 else
                   (let uu____13966 =
                      let uu____13970 =
                        FStar_TypeChecker_Env.effect_decl_opt env
                          c21.FStar_Syntax_Syntax.effect_name in
                      FStar_Util.must uu____13970 in
                    match uu____13966 with
                    | (c2_decl,qualifiers) ->
                        let uu____13982 =
                          FStar_All.pipe_right qualifiers
                            (FStar_List.contains
                               FStar_Syntax_Syntax.Reifiable) in
                        if uu____13982
                        then
                          let c1_repr =
                            let uu____13985 =
                              let uu____13986 =
                                let uu____13987 = lift_c1 () in
                                FStar_Syntax_Syntax.mk_Comp uu____13987 in
                              let uu____13988 =
                                env.FStar_TypeChecker_Env.universe_of env
                                  c11.FStar_Syntax_Syntax.result_typ in
                              FStar_TypeChecker_Env.reify_comp env
                                uu____13986 uu____13988 in
>>>>>>> origin/guido_tactics
                            FStar_TypeChecker_Normalize.normalize
                              [FStar_TypeChecker_Normalize.UnfoldUntil
                                 FStar_Syntax_Syntax.Delta_constant;
                              FStar_TypeChecker_Normalize.WHNF] env
<<<<<<< HEAD
                              uu____14158 in
                          let c2_repr =
                            let uu____14163 =
                              let uu____14164 =
                                FStar_Syntax_Syntax.mk_Comp c21 in
                              let uu____14165 =
                                env.FStar_TypeChecker_Env.universe_of env
                                  c21.FStar_Syntax_Syntax.result_typ in
                              FStar_TypeChecker_Env.reify_comp env
                                uu____14164 uu____14165 in
=======
                              uu____13985 in
                          let c2_repr =
                            let uu____13990 =
                              let uu____13991 =
                                FStar_Syntax_Syntax.mk_Comp c21 in
                              let uu____13992 =
                                env.FStar_TypeChecker_Env.universe_of env
                                  c21.FStar_Syntax_Syntax.result_typ in
                              FStar_TypeChecker_Env.reify_comp env
                                uu____13991 uu____13992 in
>>>>>>> origin/guido_tactics
                            FStar_TypeChecker_Normalize.normalize
                              [FStar_TypeChecker_Normalize.UnfoldUntil
                                 FStar_Syntax_Syntax.Delta_constant;
                              FStar_TypeChecker_Normalize.WHNF] env
<<<<<<< HEAD
                              uu____14163 in
                          let prob =
                            let uu____14167 =
                              let uu____14170 =
                                let uu____14171 =
                                  FStar_Syntax_Print.term_to_string c1_repr in
                                let uu____14172 =
                                  FStar_Syntax_Print.term_to_string c2_repr in
                                FStar_Util.format2
                                  "sub effect repr: %s <: %s" uu____14171
                                  uu____14172 in
                              sub_prob c1_repr
                                problem.FStar_TypeChecker_Common.relation
                                c2_repr uu____14170 in
                            FStar_TypeChecker_Common.TProb uu____14167 in
                          let wl1 =
                            let uu____14174 =
                              let uu____14176 =
                                FStar_All.pipe_right (p_guard prob)
                                  FStar_Pervasives.fst in
                              Some uu____14176 in
                            solve_prob orig uu____14174 [] wl in
=======
                              uu____13990 in
                          let prob =
                            let uu____13994 =
                              let uu____13997 =
                                let uu____13998 =
                                  FStar_Syntax_Print.term_to_string c1_repr in
                                let uu____13999 =
                                  FStar_Syntax_Print.term_to_string c2_repr in
                                FStar_Util.format2
                                  "sub effect repr: %s <: %s" uu____13998
                                  uu____13999 in
                              sub_prob c1_repr
                                problem.FStar_TypeChecker_Common.relation
                                c2_repr uu____13997 in
                            FStar_TypeChecker_Common.TProb uu____13994 in
                          let wl1 =
                            let uu____14001 =
                              let uu____14003 =
                                FStar_All.pipe_right (p_guard prob)
                                  FStar_Pervasives.fst in
                              Some uu____14003 in
                            solve_prob orig uu____14001 [] wl in
>>>>>>> origin/guido_tactics
                          solve env (attempt [prob] wl1)
                        else
                          (let g =
                             if env.FStar_TypeChecker_Env.lax
                             then FStar_Syntax_Util.t_true
                             else
                               if is_null_wp_2
                               then
<<<<<<< HEAD
                                 ((let uu____14183 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "Rel") in
                                   if uu____14183
=======
                                 ((let uu____14010 =
                                     FStar_All.pipe_left
                                       (FStar_TypeChecker_Env.debug env)
                                       (FStar_Options.Other "Rel") in
                                   if uu____14010
>>>>>>> origin/guido_tactics
                                   then
                                     FStar_Util.print_string
                                       "Using trivial wp ... \n"
                                   else ());
<<<<<<< HEAD
                                  (let uu____14185 =
                                     let uu____14188 =
                                       let uu____14189 =
                                         let uu____14199 =
                                           let uu____14200 =
                                             let uu____14201 =
                                               env.FStar_TypeChecker_Env.universe_of
                                                 env
                                                 c11.FStar_Syntax_Syntax.result_typ in
                                             [uu____14201] in
                                           FStar_TypeChecker_Env.inst_effect_fun_with
                                             uu____14200 env c2_decl
                                             c2_decl.FStar_Syntax_Syntax.trivial in
                                         let uu____14202 =
                                           let uu____14204 =
                                             FStar_Syntax_Syntax.as_arg
                                               c11.FStar_Syntax_Syntax.result_typ in
                                           let uu____14205 =
                                             let uu____14207 =
                                               let uu____14208 =
=======
                                  (let uu____14012 =
                                     let uu____14015 =
                                       let uu____14016 =
                                         let uu____14026 =
                                           let uu____14027 =
                                             let uu____14028 =
                                               env.FStar_TypeChecker_Env.universe_of
                                                 env
                                                 c11.FStar_Syntax_Syntax.result_typ in
                                             [uu____14028] in
                                           FStar_TypeChecker_Env.inst_effect_fun_with
                                             uu____14027 env c2_decl
                                             c2_decl.FStar_Syntax_Syntax.trivial in
                                         let uu____14029 =
                                           let uu____14031 =
                                             FStar_Syntax_Syntax.as_arg
                                               c11.FStar_Syntax_Syntax.result_typ in
                                           let uu____14032 =
                                             let uu____14034 =
                                               let uu____14035 =
>>>>>>> origin/guido_tactics
                                                 (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                                                   c11.FStar_Syntax_Syntax.result_typ
                                                   wpc1 in
                                               FStar_All.pipe_left
                                                 FStar_Syntax_Syntax.as_arg
<<<<<<< HEAD
                                                 uu____14208 in
                                             [uu____14207] in
                                           uu____14204 :: uu____14205 in
                                         (uu____14199, uu____14202) in
                                       FStar_Syntax_Syntax.Tm_app uu____14189 in
                                     FStar_Syntax_Syntax.mk uu____14188 in
                                   uu____14185
=======
                                                 uu____14035 in
                                             [uu____14034] in
                                           uu____14031 :: uu____14032 in
                                         (uu____14026, uu____14029) in
                                       FStar_Syntax_Syntax.Tm_app uu____14016 in
                                     FStar_Syntax_Syntax.mk uu____14015 in
                                   uu____14012
>>>>>>> origin/guido_tactics
                                     (Some
                                        (FStar_Syntax_Util.ktype0.FStar_Syntax_Syntax.n))
                                     r))
                               else
<<<<<<< HEAD
                                 (let uu____14219 =
                                    let uu____14222 =
                                      let uu____14223 =
                                        let uu____14233 =
                                          let uu____14234 =
                                            let uu____14235 =
                                              env.FStar_TypeChecker_Env.universe_of
                                                env
                                                c21.FStar_Syntax_Syntax.result_typ in
                                            [uu____14235] in
                                          FStar_TypeChecker_Env.inst_effect_fun_with
                                            uu____14234 env c2_decl
                                            c2_decl.FStar_Syntax_Syntax.stronger in
                                        let uu____14236 =
                                          let uu____14238 =
                                            FStar_Syntax_Syntax.as_arg
                                              c21.FStar_Syntax_Syntax.result_typ in
                                          let uu____14239 =
                                            let uu____14241 =
                                              FStar_Syntax_Syntax.as_arg wpc2 in
                                            let uu____14242 =
                                              let uu____14244 =
                                                let uu____14245 =
=======
                                 (let uu____14046 =
                                    let uu____14049 =
                                      let uu____14050 =
                                        let uu____14060 =
                                          let uu____14061 =
                                            let uu____14062 =
                                              env.FStar_TypeChecker_Env.universe_of
                                                env
                                                c21.FStar_Syntax_Syntax.result_typ in
                                            [uu____14062] in
                                          FStar_TypeChecker_Env.inst_effect_fun_with
                                            uu____14061 env c2_decl
                                            c2_decl.FStar_Syntax_Syntax.stronger in
                                        let uu____14063 =
                                          let uu____14065 =
                                            FStar_Syntax_Syntax.as_arg
                                              c21.FStar_Syntax_Syntax.result_typ in
                                          let uu____14066 =
                                            let uu____14068 =
                                              FStar_Syntax_Syntax.as_arg wpc2 in
                                            let uu____14069 =
                                              let uu____14071 =
                                                let uu____14072 =
>>>>>>> origin/guido_tactics
                                                  (edge.FStar_TypeChecker_Env.mlift).FStar_TypeChecker_Env.mlift_wp
                                                    c11.FStar_Syntax_Syntax.result_typ
                                                    wpc1 in
                                                FStar_All.pipe_left
                                                  FStar_Syntax_Syntax.as_arg
<<<<<<< HEAD
                                                  uu____14245 in
                                              [uu____14244] in
                                            uu____14241 :: uu____14242 in
                                          uu____14238 :: uu____14239 in
                                        (uu____14233, uu____14236) in
                                      FStar_Syntax_Syntax.Tm_app uu____14223 in
                                    FStar_Syntax_Syntax.mk uu____14222 in
                                  uu____14219
=======
                                                  uu____14072 in
                                              [uu____14071] in
                                            uu____14068 :: uu____14069 in
                                          uu____14065 :: uu____14066 in
                                        (uu____14060, uu____14063) in
                                      FStar_Syntax_Syntax.Tm_app uu____14050 in
                                    FStar_Syntax_Syntax.mk uu____14049 in
                                  uu____14046
>>>>>>> origin/guido_tactics
                                    (Some
                                       (FStar_Syntax_Util.ktype0.FStar_Syntax_Syntax.n))
                                    r) in
                           let base_prob =
<<<<<<< HEAD
                             let uu____14256 =
=======
                             let uu____14083 =
>>>>>>> origin/guido_tactics
                               sub_prob c11.FStar_Syntax_Syntax.result_typ
                                 problem.FStar_TypeChecker_Common.relation
                                 c21.FStar_Syntax_Syntax.result_typ
                                 "result type" in
                             FStar_All.pipe_left
<<<<<<< HEAD
                               (fun _0_84  ->
                                  FStar_TypeChecker_Common.TProb _0_84)
                               uu____14256 in
                           let wl1 =
                             let uu____14262 =
                               let uu____14264 =
                                 let uu____14267 =
                                   FStar_All.pipe_right (p_guard base_prob)
                                     FStar_Pervasives.fst in
                                 FStar_Syntax_Util.mk_conj uu____14267 g in
                               FStar_All.pipe_left (fun _0_85  -> Some _0_85)
                                 uu____14264 in
                             solve_prob orig uu____14262 [] wl in
                           solve env (attempt [base_prob] wl1)))) in
        let uu____14277 = FStar_Util.physical_equality c1 c2 in
        if uu____14277
        then
          let uu____14278 = solve_prob orig None [] wl in
          solve env uu____14278
        else
          ((let uu____14281 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Rel") in
            if uu____14281
            then
              let uu____14282 = FStar_Syntax_Print.comp_to_string c1 in
              let uu____14283 = FStar_Syntax_Print.comp_to_string c2 in
              FStar_Util.print3 "solve_c %s %s %s\n" uu____14282
                (rel_to_string problem.FStar_TypeChecker_Common.relation)
                uu____14283
            else ());
           (let uu____14285 =
              let uu____14288 =
                FStar_TypeChecker_Normalize.ghost_to_pure env c1 in
              let uu____14289 =
                FStar_TypeChecker_Normalize.ghost_to_pure env c2 in
              (uu____14288, uu____14289) in
            match uu____14285 with
=======
                               (fun _0_89  ->
                                  FStar_TypeChecker_Common.TProb _0_89)
                               uu____14083 in
                           let wl1 =
                             let uu____14089 =
                               let uu____14091 =
                                 let uu____14094 =
                                   FStar_All.pipe_right (p_guard base_prob)
                                     FStar_Pervasives.fst in
                                 FStar_Syntax_Util.mk_conj uu____14094 g in
                               FStar_All.pipe_left (fun _0_90  -> Some _0_90)
                                 uu____14091 in
                             solve_prob orig uu____14089 [] wl in
                           solve env (attempt [base_prob] wl1)))) in
        let uu____14104 = FStar_Util.physical_equality c1 c2 in
        if uu____14104
        then
          let uu____14105 = solve_prob orig None [] wl in
          solve env uu____14105
        else
          ((let uu____14108 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Rel") in
            if uu____14108
            then
              let uu____14109 = FStar_Syntax_Print.comp_to_string c1 in
              let uu____14110 = FStar_Syntax_Print.comp_to_string c2 in
              FStar_Util.print3 "solve_c %s %s %s\n" uu____14109
                (rel_to_string problem.FStar_TypeChecker_Common.relation)
                uu____14110
            else ());
           (let uu____14112 =
              let uu____14115 =
                FStar_TypeChecker_Normalize.ghost_to_pure env c1 in
              let uu____14116 =
                FStar_TypeChecker_Normalize.ghost_to_pure env c2 in
              (uu____14115, uu____14116) in
            match uu____14112 with
>>>>>>> origin/guido_tactics
            | (c11,c21) ->
                (match ((c11.FStar_Syntax_Syntax.n),
                         (c21.FStar_Syntax_Syntax.n))
                 with
                 | (FStar_Syntax_Syntax.GTotal
<<<<<<< HEAD
                    (t1,uu____14293),FStar_Syntax_Syntax.Total
                    (t2,uu____14295)) when
                     FStar_Syntax_Util.non_informative t2 ->
                     let uu____14308 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14308 wl
                 | (FStar_Syntax_Syntax.GTotal
                    uu____14311,FStar_Syntax_Syntax.Total uu____14312) ->
                     giveup env "incompatible monad ordering: GTot </: Tot"
                       orig
                 | (FStar_Syntax_Syntax.Total
                    (t1,uu____14324),FStar_Syntax_Syntax.Total
                    (t2,uu____14326)) ->
                     let uu____14339 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14339 wl
                 | (FStar_Syntax_Syntax.GTotal
                    (t1,uu____14343),FStar_Syntax_Syntax.GTotal
                    (t2,uu____14345)) ->
                     let uu____14358 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14358 wl
                 | (FStar_Syntax_Syntax.Total
                    (t1,uu____14362),FStar_Syntax_Syntax.GTotal
                    (t2,uu____14364)) ->
                     let uu____14377 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14377 wl
                 | (FStar_Syntax_Syntax.GTotal
                    uu____14380,FStar_Syntax_Syntax.Comp uu____14381) ->
                     let uu____14387 =
                       let uu___176_14390 = problem in
                       let uu____14393 =
                         let uu____14394 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c11 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14394 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___176_14390.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs = uu____14393;
                         FStar_TypeChecker_Common.relation =
                           (uu___176_14390.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs =
                           (uu___176_14390.FStar_TypeChecker_Common.rhs);
                         FStar_TypeChecker_Common.element =
                           (uu___176_14390.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___176_14390.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___176_14390.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___176_14390.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___176_14390.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___176_14390.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14387 wl
                 | (FStar_Syntax_Syntax.Total
                    uu____14395,FStar_Syntax_Syntax.Comp uu____14396) ->
                     let uu____14402 =
                       let uu___176_14405 = problem in
                       let uu____14408 =
                         let uu____14409 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c11 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14409 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___176_14405.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs = uu____14408;
                         FStar_TypeChecker_Common.relation =
                           (uu___176_14405.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs =
                           (uu___176_14405.FStar_TypeChecker_Common.rhs);
                         FStar_TypeChecker_Common.element =
                           (uu___176_14405.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___176_14405.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___176_14405.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___176_14405.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___176_14405.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___176_14405.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14402 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____14410,FStar_Syntax_Syntax.GTotal uu____14411) ->
                     let uu____14417 =
                       let uu___177_14420 = problem in
                       let uu____14423 =
                         let uu____14424 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c21 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14424 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___177_14420.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs =
                           (uu___177_14420.FStar_TypeChecker_Common.lhs);
                         FStar_TypeChecker_Common.relation =
                           (uu___177_14420.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs = uu____14423;
                         FStar_TypeChecker_Common.element =
                           (uu___177_14420.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___177_14420.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___177_14420.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___177_14420.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___177_14420.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___177_14420.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14417 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____14425,FStar_Syntax_Syntax.Total uu____14426) ->
                     let uu____14432 =
                       let uu___177_14435 = problem in
                       let uu____14438 =
                         let uu____14439 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c21 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14439 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___177_14435.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs =
                           (uu___177_14435.FStar_TypeChecker_Common.lhs);
                         FStar_TypeChecker_Common.relation =
                           (uu___177_14435.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs = uu____14438;
                         FStar_TypeChecker_Common.element =
                           (uu___177_14435.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___177_14435.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___177_14435.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___177_14435.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___177_14435.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___177_14435.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14432 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____14440,FStar_Syntax_Syntax.Comp uu____14441) ->
                     let uu____14442 =
=======
                    (t1,uu____14120),FStar_Syntax_Syntax.Total
                    (t2,uu____14122)) when
                     FStar_Syntax_Util.non_informative t2 ->
                     let uu____14135 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14135 wl
                 | (FStar_Syntax_Syntax.GTotal
                    uu____14138,FStar_Syntax_Syntax.Total uu____14139) ->
                     giveup env "incompatible monad ordering: GTot </: Tot"
                       orig
                 | (FStar_Syntax_Syntax.Total
                    (t1,uu____14151),FStar_Syntax_Syntax.Total
                    (t2,uu____14153)) ->
                     let uu____14166 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14166 wl
                 | (FStar_Syntax_Syntax.GTotal
                    (t1,uu____14170),FStar_Syntax_Syntax.GTotal
                    (t2,uu____14172)) ->
                     let uu____14185 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14185 wl
                 | (FStar_Syntax_Syntax.Total
                    (t1,uu____14189),FStar_Syntax_Syntax.GTotal
                    (t2,uu____14191)) ->
                     let uu____14204 =
                       problem_using_guard orig t1
                         problem.FStar_TypeChecker_Common.relation t2 None
                         "result type" in
                     solve_t env uu____14204 wl
                 | (FStar_Syntax_Syntax.GTotal
                    uu____14207,FStar_Syntax_Syntax.Comp uu____14208) ->
                     let uu____14214 =
                       let uu___178_14217 = problem in
                       let uu____14220 =
                         let uu____14221 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c11 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14221 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___178_14217.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs = uu____14220;
                         FStar_TypeChecker_Common.relation =
                           (uu___178_14217.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs =
                           (uu___178_14217.FStar_TypeChecker_Common.rhs);
                         FStar_TypeChecker_Common.element =
                           (uu___178_14217.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___178_14217.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___178_14217.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___178_14217.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___178_14217.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___178_14217.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14214 wl
                 | (FStar_Syntax_Syntax.Total
                    uu____14222,FStar_Syntax_Syntax.Comp uu____14223) ->
                     let uu____14229 =
                       let uu___178_14232 = problem in
                       let uu____14235 =
                         let uu____14236 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c11 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14236 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___178_14232.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs = uu____14235;
                         FStar_TypeChecker_Common.relation =
                           (uu___178_14232.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs =
                           (uu___178_14232.FStar_TypeChecker_Common.rhs);
                         FStar_TypeChecker_Common.element =
                           (uu___178_14232.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___178_14232.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___178_14232.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___178_14232.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___178_14232.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___178_14232.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14229 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____14237,FStar_Syntax_Syntax.GTotal uu____14238) ->
                     let uu____14244 =
                       let uu___179_14247 = problem in
                       let uu____14250 =
                         let uu____14251 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c21 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14251 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___179_14247.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs =
                           (uu___179_14247.FStar_TypeChecker_Common.lhs);
                         FStar_TypeChecker_Common.relation =
                           (uu___179_14247.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs = uu____14250;
                         FStar_TypeChecker_Common.element =
                           (uu___179_14247.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___179_14247.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___179_14247.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___179_14247.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___179_14247.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___179_14247.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14244 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____14252,FStar_Syntax_Syntax.Total uu____14253) ->
                     let uu____14259 =
                       let uu___179_14262 = problem in
                       let uu____14265 =
                         let uu____14266 =
                           FStar_TypeChecker_Env.comp_to_comp_typ env c21 in
                         FStar_All.pipe_left FStar_Syntax_Syntax.mk_Comp
                           uu____14266 in
                       {
                         FStar_TypeChecker_Common.pid =
                           (uu___179_14262.FStar_TypeChecker_Common.pid);
                         FStar_TypeChecker_Common.lhs =
                           (uu___179_14262.FStar_TypeChecker_Common.lhs);
                         FStar_TypeChecker_Common.relation =
                           (uu___179_14262.FStar_TypeChecker_Common.relation);
                         FStar_TypeChecker_Common.rhs = uu____14265;
                         FStar_TypeChecker_Common.element =
                           (uu___179_14262.FStar_TypeChecker_Common.element);
                         FStar_TypeChecker_Common.logical_guard =
                           (uu___179_14262.FStar_TypeChecker_Common.logical_guard);
                         FStar_TypeChecker_Common.scope =
                           (uu___179_14262.FStar_TypeChecker_Common.scope);
                         FStar_TypeChecker_Common.reason =
                           (uu___179_14262.FStar_TypeChecker_Common.reason);
                         FStar_TypeChecker_Common.loc =
                           (uu___179_14262.FStar_TypeChecker_Common.loc);
                         FStar_TypeChecker_Common.rank =
                           (uu___179_14262.FStar_TypeChecker_Common.rank)
                       } in
                     solve_c env uu____14259 wl
                 | (FStar_Syntax_Syntax.Comp
                    uu____14267,FStar_Syntax_Syntax.Comp uu____14268) ->
                     let uu____14269 =
>>>>>>> origin/guido_tactics
                       ((FStar_Syntax_Util.is_ml_comp c11) &&
                          (FStar_Syntax_Util.is_ml_comp c21))
                         ||
                         ((FStar_Syntax_Util.is_total_comp c11) &&
                            ((FStar_Syntax_Util.is_total_comp c21) ||
                               (FStar_Syntax_Util.is_ml_comp c21))) in
<<<<<<< HEAD
                     if uu____14442
                     then
                       let uu____14443 =
=======
                     if uu____14269
                     then
                       let uu____14270 =
>>>>>>> origin/guido_tactics
                         problem_using_guard orig
                           (FStar_Syntax_Util.comp_result c11)
                           problem.FStar_TypeChecker_Common.relation
                           (FStar_Syntax_Util.comp_result c21) None
                           "result type" in
<<<<<<< HEAD
                       solve_t env uu____14443 wl
=======
                       solve_t env uu____14270 wl
>>>>>>> origin/guido_tactics
                     else
                       (let c1_comp =
                          FStar_TypeChecker_Env.comp_to_comp_typ env c11 in
                        let c2_comp =
                          FStar_TypeChecker_Env.comp_to_comp_typ env c21 in
                        if
                          (problem.FStar_TypeChecker_Common.relation =
                             FStar_TypeChecker_Common.EQ)
                            &&
                            (FStar_Ident.lid_equals
                               c1_comp.FStar_Syntax_Syntax.effect_name
                               c2_comp.FStar_Syntax_Syntax.effect_name)
                        then solve_eq c1_comp c2_comp
                        else
                          (let c12 =
                             FStar_TypeChecker_Env.unfold_effect_abbrev env
                               c11 in
                           let c22 =
                             FStar_TypeChecker_Env.unfold_effect_abbrev env
                               c21 in
<<<<<<< HEAD
                           (let uu____14453 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug env)
                                (FStar_Options.Other "Rel") in
                            if uu____14453
=======
                           (let uu____14280 =
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug env)
                                (FStar_Options.Other "Rel") in
                            if uu____14280
>>>>>>> origin/guido_tactics
                            then
                              FStar_Util.print2 "solve_c for %s and %s\n"
                                (c12.FStar_Syntax_Syntax.effect_name).FStar_Ident.str
                                (c22.FStar_Syntax_Syntax.effect_name).FStar_Ident.str
                            else ());
<<<<<<< HEAD
                           (let uu____14455 =
                              FStar_TypeChecker_Env.monad_leq env
                                c12.FStar_Syntax_Syntax.effect_name
                                c22.FStar_Syntax_Syntax.effect_name in
                            match uu____14455 with
                            | None  ->
                                let uu____14457 =
=======
                           (let uu____14282 =
                              FStar_TypeChecker_Env.monad_leq env
                                c12.FStar_Syntax_Syntax.effect_name
                                c22.FStar_Syntax_Syntax.effect_name in
                            match uu____14282 with
                            | None  ->
                                let uu____14284 =
>>>>>>> origin/guido_tactics
                                  ((FStar_Syntax_Util.is_ghost_effect
                                      c12.FStar_Syntax_Syntax.effect_name)
                                     &&
                                     (FStar_Syntax_Util.is_pure_effect
                                        c22.FStar_Syntax_Syntax.effect_name))
                                    &&
<<<<<<< HEAD
                                    (let uu____14459 =
=======
                                    (let uu____14285 =
>>>>>>> origin/guido_tactics
                                       FStar_TypeChecker_Normalize.normalize
                                         [FStar_TypeChecker_Normalize.Eager_unfolding;
                                         FStar_TypeChecker_Normalize.UnfoldUntil
                                           FStar_Syntax_Syntax.Delta_constant]
                                         env
                                         c22.FStar_Syntax_Syntax.result_typ in
                                     FStar_Syntax_Util.non_informative
<<<<<<< HEAD
                                       uu____14459) in
                                if uu____14457
=======
                                       uu____14285) in
                                if uu____14284
>>>>>>> origin/guido_tactics
                                then
                                  let edge =
                                    {
                                      FStar_TypeChecker_Env.msource =
                                        (c12.FStar_Syntax_Syntax.effect_name);
                                      FStar_TypeChecker_Env.mtarget =
                                        (c22.FStar_Syntax_Syntax.effect_name);
                                      FStar_TypeChecker_Env.mlift =
                                        FStar_TypeChecker_Env.identity_mlift
                                    } in
                                  solve_sub c12 edge c22
                                else
<<<<<<< HEAD
                                  (let uu____14462 =
                                     let uu____14463 =
                                       FStar_Syntax_Print.lid_to_string
                                         c12.FStar_Syntax_Syntax.effect_name in
                                     let uu____14464 =
=======
                                  (let uu____14288 =
                                     let uu____14289 =
                                       FStar_Syntax_Print.lid_to_string
                                         c12.FStar_Syntax_Syntax.effect_name in
                                     let uu____14290 =
>>>>>>> origin/guido_tactics
                                       FStar_Syntax_Print.lid_to_string
                                         c22.FStar_Syntax_Syntax.effect_name in
                                     FStar_Util.format2
                                       "incompatible monad ordering: %s </: %s"
<<<<<<< HEAD
                                       uu____14463 uu____14464 in
                                   giveup env uu____14462 orig)
                            | Some edge -> solve_sub c12 edge c22))))))
let print_pending_implicits: FStar_TypeChecker_Env.guard_t -> Prims.string =
  fun g  ->
    let uu____14469 =
      FStar_All.pipe_right g.FStar_TypeChecker_Env.implicits
        (FStar_List.map
           (fun uu____14492  ->
              match uu____14492 with
              | (uu____14499,uu____14500,u,uu____14502,uu____14503,uu____14504)
                  -> FStar_Syntax_Print.uvar_to_string u)) in
    FStar_All.pipe_right uu____14469 (FStar_String.concat ", ")
=======
                                       uu____14289 uu____14290 in
                                   giveup env uu____14288 orig)
                            | Some edge -> solve_sub c12 edge c22))))))
let print_pending_implicits: FStar_TypeChecker_Env.guard_t -> Prims.string =
  fun g  ->
    let uu____14296 =
      FStar_All.pipe_right g.FStar_TypeChecker_Env.implicits
        (FStar_List.map
           (fun uu____14312  ->
              match uu____14312 with
              | (uu____14319,uu____14320,u,uu____14322,uu____14323,uu____14324)
                  -> FStar_Syntax_Print.uvar_to_string u)) in
    FStar_All.pipe_right uu____14296 (FStar_String.concat ", ")
>>>>>>> origin/guido_tactics
let ineqs_to_string:
  (FStar_Syntax_Syntax.universe Prims.list* (FStar_Syntax_Syntax.universe*
    FStar_Syntax_Syntax.universe) Prims.list) -> Prims.string
  =
  fun ineqs  ->
    let vars =
<<<<<<< HEAD
      let uu____14522 =
        FStar_All.pipe_right (fst ineqs)
          (FStar_List.map FStar_Syntax_Print.univ_to_string) in
      FStar_All.pipe_right uu____14522 (FStar_String.concat ", ") in
    let ineqs1 =
      let uu____14532 =
        FStar_All.pipe_right (snd ineqs)
          (FStar_List.map
             (fun uu____14549  ->
                match uu____14549 with
                | (u1,u2) ->
                    let uu____14554 = FStar_Syntax_Print.univ_to_string u1 in
                    let uu____14555 = FStar_Syntax_Print.univ_to_string u2 in
                    FStar_Util.format2 "%s < %s" uu____14554 uu____14555)) in
      FStar_All.pipe_right uu____14532 (FStar_String.concat ", ") in
=======
      let uu____14343 =
        FStar_All.pipe_right (fst ineqs)
          (FStar_List.map FStar_Syntax_Print.univ_to_string) in
      FStar_All.pipe_right uu____14343 (FStar_String.concat ", ") in
    let ineqs1 =
      let uu____14353 =
        FStar_All.pipe_right (snd ineqs)
          (FStar_List.map
             (fun uu____14365  ->
                match uu____14365 with
                | (u1,u2) ->
                    let uu____14370 = FStar_Syntax_Print.univ_to_string u1 in
                    let uu____14371 = FStar_Syntax_Print.univ_to_string u2 in
                    FStar_Util.format2 "%s < %s" uu____14370 uu____14371)) in
      FStar_All.pipe_right uu____14353 (FStar_String.concat ", ") in
>>>>>>> origin/guido_tactics
    FStar_Util.format2 "Solving for {%s}; inequalities are {%s}" vars ineqs1
let guard_to_string:
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.guard_t -> Prims.string
  =
  fun env  ->
    fun g  ->
      match ((g.FStar_TypeChecker_Env.guard_f),
              (g.FStar_TypeChecker_Env.deferred),
              (g.FStar_TypeChecker_Env.univ_ineqs))
      with
<<<<<<< HEAD
      | (FStar_TypeChecker_Common.Trivial ,[],(uu____14567,[])) -> "{}"
      | uu____14580 ->
=======
      | (FStar_TypeChecker_Common.Trivial ,[],(uu____14385,[])) -> "{}"
      | uu____14398 ->
>>>>>>> origin/guido_tactics
          let form =
            match g.FStar_TypeChecker_Env.guard_f with
            | FStar_TypeChecker_Common.Trivial  -> "trivial"
            | FStar_TypeChecker_Common.NonTrivial f ->
<<<<<<< HEAD
                let uu____14590 =
=======
                let uu____14408 =
>>>>>>> origin/guido_tactics
                  ((FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel"))
                     ||
                     (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Implicits")))
                    ||
                    (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       FStar_Options.Extreme) in
<<<<<<< HEAD
                if uu____14590
                then FStar_TypeChecker_Normalize.term_to_string env f
                else "non-trivial" in
          let carry =
            let uu____14593 =
              FStar_List.map
                (fun uu____14600  ->
                   match uu____14600 with
                   | (uu____14603,x) -> prob_to_string env x)
                g.FStar_TypeChecker_Env.deferred in
            FStar_All.pipe_right uu____14593 (FStar_String.concat ",\n") in
          let imps = print_pending_implicits g in
          let uu____14607 =
            ineqs_to_string g.FStar_TypeChecker_Env.univ_ineqs in
          FStar_Util.format4
            "\n\t{guard_f=%s;\n\t deferred={\n%s};\n\t univ_ineqs={%s};\n\t implicits={%s}}\n"
            form carry uu____14607 imps
let new_t_problem env lhs rel rhs elt loc =
  let reason =
    let uu____14645 =
      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
        (FStar_Options.Other "ExplainRel") in
    if uu____14645
    then
      let uu____14646 = FStar_TypeChecker_Normalize.term_to_string env lhs in
      let uu____14647 = FStar_TypeChecker_Normalize.term_to_string env rhs in
      FStar_Util.format3 "Top-level:\n%s\n\t%s\n%s" uu____14646
        (rel_to_string rel) uu____14647
=======
                if uu____14408
                then FStar_TypeChecker_Normalize.term_to_string env f
                else "non-trivial" in
          let carry =
            let uu____14411 =
              FStar_List.map
                (fun uu____14415  ->
                   match uu____14415 with
                   | (uu____14418,x) -> prob_to_string env x)
                g.FStar_TypeChecker_Env.deferred in
            FStar_All.pipe_right uu____14411 (FStar_String.concat ",\n") in
          let imps = print_pending_implicits g in
          let uu____14422 =
            ineqs_to_string g.FStar_TypeChecker_Env.univ_ineqs in
          FStar_Util.format4
            "\n\t{guard_f=%s;\n\t deferred={\n%s};\n\t univ_ineqs={%s};\n\t implicits={%s}}\n"
            form carry uu____14422 imps
let new_t_problem env lhs rel rhs elt loc =
  let reason =
    let uu____14467 =
      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
        (FStar_Options.Other "ExplainRel") in
    if uu____14467
    then
      let uu____14468 = FStar_TypeChecker_Normalize.term_to_string env lhs in
      let uu____14469 = FStar_TypeChecker_Normalize.term_to_string env rhs in
      FStar_Util.format3 "Top-level:\n%s\n\t%s\n%s" uu____14468
        (rel_to_string rel) uu____14469
>>>>>>> origin/guido_tactics
    else "TOP" in
  let p = new_problem env lhs rel rhs elt loc reason in p
let new_t_prob:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_TypeChecker_Common.rel ->
        FStar_Syntax_Syntax.term ->
          (FStar_TypeChecker_Common.prob* FStar_Syntax_Syntax.bv)
  =
  fun env  ->
    fun t1  ->
      fun rel  ->
        fun t2  ->
          let x =
<<<<<<< HEAD
            let uu____14667 =
              let uu____14669 = FStar_TypeChecker_Env.get_range env in
              FStar_All.pipe_left (fun _0_86  -> Some _0_86) uu____14669 in
            FStar_Syntax_Syntax.new_bv uu____14667 t1 in
          let env1 = FStar_TypeChecker_Env.push_bv env x in
          let p =
            let uu____14675 =
              let uu____14677 = FStar_Syntax_Syntax.bv_to_name x in
              FStar_All.pipe_left (fun _0_87  -> Some _0_87) uu____14677 in
            let uu____14679 = FStar_TypeChecker_Env.get_range env1 in
            new_t_problem env1 t1 rel t2 uu____14675 uu____14679 in
=======
            let uu____14493 =
              let uu____14495 = FStar_TypeChecker_Env.get_range env in
              FStar_All.pipe_left (fun _0_91  -> Some _0_91) uu____14495 in
            FStar_Syntax_Syntax.new_bv uu____14493 t1 in
          let env1 = FStar_TypeChecker_Env.push_bv env x in
          let p =
            let uu____14501 =
              let uu____14503 = FStar_Syntax_Syntax.bv_to_name x in
              FStar_All.pipe_left (fun _0_92  -> Some _0_92) uu____14503 in
            let uu____14505 = FStar_TypeChecker_Env.get_range env1 in
            new_t_problem env1 t1 rel t2 uu____14501 uu____14505 in
>>>>>>> origin/guido_tactics
          ((FStar_TypeChecker_Common.TProb p), x)
let solve_and_commit:
  FStar_TypeChecker_Env.env ->
    worklist ->
      ((FStar_TypeChecker_Common.prob* Prims.string) ->
         FStar_TypeChecker_Common.deferred option)
        -> FStar_TypeChecker_Common.deferred option
  =
  fun env  ->
    fun probs  ->
      fun err1  ->
        let probs1 =
<<<<<<< HEAD
          let uu____14702 = FStar_Options.eager_inference () in
          if uu____14702
          then
            let uu___178_14703 = probs in
            {
              attempting = (uu___178_14703.attempting);
              wl_deferred = (uu___178_14703.wl_deferred);
              ctr = (uu___178_14703.ctr);
              defer_ok = false;
              smt_ok = (uu___178_14703.smt_ok);
              tcenv = (uu___178_14703.tcenv)
=======
          let uu____14531 = FStar_Options.eager_inference () in
          if uu____14531
          then
            let uu___180_14532 = probs in
            {
              attempting = (uu___180_14532.attempting);
              wl_deferred = (uu___180_14532.wl_deferred);
              ctr = (uu___180_14532.ctr);
              defer_ok = false;
              smt_ok = (uu___180_14532.smt_ok);
              tcenv = (uu___180_14532.tcenv)
>>>>>>> origin/guido_tactics
            }
          else probs in
        let tx = FStar_Syntax_Unionfind.new_transaction () in
        let sol = solve env probs1 in
        match sol with
        | Success deferred ->
            (FStar_Syntax_Unionfind.commit tx; Some deferred)
        | Failed (d,s) ->
            (FStar_Syntax_Unionfind.rollback tx;
<<<<<<< HEAD
             (let uu____14714 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "ExplainRel") in
              if uu____14714
              then
                let uu____14715 = explain env d s in
                FStar_All.pipe_left FStar_Util.print_string uu____14715
=======
             (let uu____14543 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "ExplainRel") in
              if uu____14543
              then
                let uu____14544 = explain env d s in
                FStar_All.pipe_left FStar_Util.print_string uu____14544
>>>>>>> origin/guido_tactics
              else ());
             err1 (d, s))
let simplify_guard:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun env  ->
    fun g  ->
      match g.FStar_TypeChecker_Env.guard_f with
      | FStar_TypeChecker_Common.Trivial  -> g
      | FStar_TypeChecker_Common.NonTrivial f ->
<<<<<<< HEAD
          ((let uu____14725 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Simplification") in
            if uu____14725
            then
              let uu____14726 = FStar_Syntax_Print.term_to_string f in
              FStar_Util.print1 "Simplifying guard %s\n" uu____14726
=======
          ((let uu____14556 =
              FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                (FStar_Options.Other "Simplification") in
            if uu____14556
            then
              let uu____14557 = FStar_Syntax_Print.term_to_string f in
              FStar_Util.print1 "Simplifying guard %s\n" uu____14557
>>>>>>> origin/guido_tactics
            else ());
           (let f1 =
              FStar_TypeChecker_Normalize.normalize
                [FStar_TypeChecker_Normalize.Beta;
                FStar_TypeChecker_Normalize.Eager_unfolding;
<<<<<<< HEAD
                FStar_TypeChecker_Normalize.Simplify] env f in
            (let uu____14730 =
               FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                 (FStar_Options.Other "Simplification") in
             if uu____14730
             then
               let uu____14731 = FStar_Syntax_Print.term_to_string f1 in
               FStar_Util.print1 "Simplified guard to %s\n" uu____14731
             else ());
            (let f2 =
               let uu____14734 =
                 let uu____14735 = FStar_Syntax_Util.unmeta f1 in
                 uu____14735.FStar_Syntax_Syntax.n in
               match uu____14734 with
=======
                FStar_TypeChecker_Normalize.Simplify;
                FStar_TypeChecker_Normalize.Primops] env f in
            (let uu____14561 =
               FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                 (FStar_Options.Other "Simplification") in
             if uu____14561
             then
               let uu____14562 = FStar_Syntax_Print.term_to_string f1 in
               FStar_Util.print1 "Simplified guard to %s\n" uu____14562
             else ());
            (let f2 =
               let uu____14565 =
                 let uu____14566 = FStar_Syntax_Util.unmeta f1 in
                 uu____14566.FStar_Syntax_Syntax.n in
               match uu____14565 with
>>>>>>> origin/guido_tactics
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Syntax_Const.true_lid
                   -> FStar_TypeChecker_Common.Trivial
<<<<<<< HEAD
               | uu____14739 -> FStar_TypeChecker_Common.NonTrivial f1 in
             let uu___179_14740 = g in
             {
               FStar_TypeChecker_Env.guard_f = f2;
               FStar_TypeChecker_Env.deferred =
                 (uu___179_14740.FStar_TypeChecker_Env.deferred);
               FStar_TypeChecker_Env.univ_ineqs =
                 (uu___179_14740.FStar_TypeChecker_Env.univ_ineqs);
               FStar_TypeChecker_Env.implicits =
                 (uu___179_14740.FStar_TypeChecker_Env.implicits)
=======
               | uu____14570 -> FStar_TypeChecker_Common.NonTrivial f1 in
             let uu___181_14571 = g in
             {
               FStar_TypeChecker_Env.guard_f = f2;
               FStar_TypeChecker_Env.deferred =
                 (uu___181_14571.FStar_TypeChecker_Env.deferred);
               FStar_TypeChecker_Env.univ_ineqs =
                 (uu___181_14571.FStar_TypeChecker_Env.univ_ineqs);
               FStar_TypeChecker_Env.implicits =
                 (uu___181_14571.FStar_TypeChecker_Env.implicits)
>>>>>>> origin/guido_tactics
             })))
let with_guard:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Common.prob ->
      FStar_TypeChecker_Common.deferred option ->
        FStar_TypeChecker_Env.guard_t option
  =
  fun env  ->
    fun prob  ->
      fun dopt  ->
        match dopt with
        | None  -> None
        | Some d ->
<<<<<<< HEAD
            let uu____14755 =
              let uu____14756 =
                let uu____14757 =
                  let uu____14758 =
                    FStar_All.pipe_right (p_guard prob) FStar_Pervasives.fst in
                  FStar_All.pipe_right uu____14758
                    (fun _0_88  -> FStar_TypeChecker_Common.NonTrivial _0_88) in
                {
                  FStar_TypeChecker_Env.guard_f = uu____14757;
=======
            let uu____14589 =
              let uu____14590 =
                let uu____14591 =
                  let uu____14592 =
                    FStar_All.pipe_right (p_guard prob) FStar_Pervasives.fst in
                  FStar_All.pipe_right uu____14592
                    (fun _0_93  -> FStar_TypeChecker_Common.NonTrivial _0_93) in
                {
                  FStar_TypeChecker_Env.guard_f = uu____14591;
>>>>>>> origin/guido_tactics
                  FStar_TypeChecker_Env.deferred = d;
                  FStar_TypeChecker_Env.univ_ineqs = ([], []);
                  FStar_TypeChecker_Env.implicits = []
                } in
<<<<<<< HEAD
              simplify_guard env uu____14756 in
            FStar_All.pipe_left (fun _0_89  -> Some _0_89) uu____14755
=======
              simplify_guard env uu____14590 in
            FStar_All.pipe_left (fun _0_94  -> Some _0_94) uu____14589
>>>>>>> origin/guido_tactics
let with_guard_no_simp env prob dopt =
  match dopt with
  | None  -> None
  | Some d ->
<<<<<<< HEAD
      let uu____14791 =
        let uu____14792 =
          let uu____14793 =
            FStar_All.pipe_right (p_guard prob) FStar_Pervasives.fst in
          FStar_All.pipe_right uu____14793
            (fun _0_90  -> FStar_TypeChecker_Common.NonTrivial _0_90) in
        {
          FStar_TypeChecker_Env.guard_f = uu____14792;
=======
      let uu____14629 =
        let uu____14630 =
          let uu____14631 =
            FStar_All.pipe_right (p_guard prob) FStar_Pervasives.fst in
          FStar_All.pipe_right uu____14631
            (fun _0_95  -> FStar_TypeChecker_Common.NonTrivial _0_95) in
        {
          FStar_TypeChecker_Env.guard_f = uu____14630;
>>>>>>> origin/guido_tactics
          FStar_TypeChecker_Env.deferred = d;
          FStar_TypeChecker_Env.univ_ineqs = ([], []);
          FStar_TypeChecker_Env.implicits = []
        } in
<<<<<<< HEAD
      Some uu____14791
=======
      Some uu____14629
>>>>>>> origin/guido_tactics
let try_teq:
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ -> FStar_TypeChecker_Env.guard_t option
  =
  fun smt_ok  ->
    fun env  ->
      fun t1  ->
        fun t2  ->
<<<<<<< HEAD
          (let uu____14819 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Rel") in
           if uu____14819
           then
             let uu____14820 = FStar_Syntax_Print.term_to_string t1 in
             let uu____14821 = FStar_Syntax_Print.term_to_string t2 in
             FStar_Util.print2 "try_teq of %s and %s\n" uu____14820
               uu____14821
           else ());
          (let prob =
             let uu____14824 =
               let uu____14827 = FStar_TypeChecker_Env.get_range env in
               new_t_problem env t1 FStar_TypeChecker_Common.EQ t2 None
                 uu____14827 in
             FStar_All.pipe_left
               (fun _0_91  -> FStar_TypeChecker_Common.TProb _0_91)
               uu____14824 in
           let g =
             let uu____14832 =
               let uu____14834 = singleton' env prob smt_ok in
               solve_and_commit env uu____14834 (fun uu____14836  -> None) in
             FStar_All.pipe_left (with_guard env prob) uu____14832 in
=======
          (let uu____14661 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Rel") in
           if uu____14661
           then
             let uu____14662 = FStar_Syntax_Print.term_to_string t1 in
             let uu____14663 = FStar_Syntax_Print.term_to_string t2 in
             FStar_Util.print2 "try_teq of %s and %s\n" uu____14662
               uu____14663
           else ());
          (let prob =
             let uu____14666 =
               let uu____14669 = FStar_TypeChecker_Env.get_range env in
               new_t_problem env t1 FStar_TypeChecker_Common.EQ t2 None
                 uu____14669 in
             FStar_All.pipe_left
               (fun _0_96  -> FStar_TypeChecker_Common.TProb _0_96)
               uu____14666 in
           let g =
             let uu____14674 =
               let uu____14676 = singleton' env prob smt_ok in
               solve_and_commit env uu____14676 (fun uu____14677  -> None) in
             FStar_All.pipe_left (with_guard env prob) uu____14674 in
>>>>>>> origin/guido_tactics
           g)
let teq:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.typ -> FStar_TypeChecker_Env.guard_t
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
<<<<<<< HEAD
        let uu____14850 = try_teq true env t1 t2 in
        match uu____14850 with
        | None  ->
            let uu____14852 =
              let uu____14853 =
                let uu____14856 =
                  FStar_TypeChecker_Err.basic_type_error env None t2 t1 in
                let uu____14857 = FStar_TypeChecker_Env.get_range env in
                (uu____14856, uu____14857) in
              FStar_Errors.Error uu____14853 in
            raise uu____14852
        | Some g ->
            ((let uu____14860 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "Rel") in
              if uu____14860
              then
                let uu____14861 = FStar_Syntax_Print.term_to_string t1 in
                let uu____14862 = FStar_Syntax_Print.term_to_string t2 in
                let uu____14863 = guard_to_string env g in
                FStar_Util.print3
                  "teq of %s and %s succeeded with guard %s\n" uu____14861
                  uu____14862 uu____14863
=======
        let uu____14694 = try_teq true env t1 t2 in
        match uu____14694 with
        | None  ->
            let uu____14696 =
              let uu____14697 =
                let uu____14700 =
                  FStar_TypeChecker_Err.basic_type_error env None t2 t1 in
                let uu____14701 = FStar_TypeChecker_Env.get_range env in
                (uu____14700, uu____14701) in
              FStar_Errors.Error uu____14697 in
            raise uu____14696
        | Some g ->
            ((let uu____14704 =
                FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                  (FStar_Options.Other "Rel") in
              if uu____14704
              then
                let uu____14705 = FStar_Syntax_Print.term_to_string t1 in
                let uu____14706 = FStar_Syntax_Print.term_to_string t2 in
                let uu____14707 = guard_to_string env g in
                FStar_Util.print3
                  "teq of %s and %s succeeded with guard %s\n" uu____14705
                  uu____14706 uu____14707
>>>>>>> origin/guido_tactics
              else ());
             g)
let try_subtype':
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.typ ->
        Prims.bool -> FStar_TypeChecker_Env.guard_t option
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
        fun smt_ok  ->
<<<<<<< HEAD
          (let uu____14879 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Rel") in
           if uu____14879
           then
             let uu____14880 =
               FStar_TypeChecker_Normalize.term_to_string env t1 in
             let uu____14881 =
               FStar_TypeChecker_Normalize.term_to_string env t2 in
             FStar_Util.print2 "try_subtype of %s and %s\n" uu____14880
               uu____14881
           else ());
          (let uu____14883 =
             new_t_prob env t1 FStar_TypeChecker_Common.SUB t2 in
           match uu____14883 with
           | (prob,x) ->
               let g =
                 let uu____14891 =
                   let uu____14893 = singleton' env prob smt_ok in
                   solve_and_commit env uu____14893
                     (fun uu____14895  -> None) in
                 FStar_All.pipe_left (with_guard env prob) uu____14891 in
               ((let uu____14901 =
                   (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel"))
                     && (FStar_Util.is_some g) in
                 if uu____14901
                 then
                   let uu____14902 =
                     FStar_TypeChecker_Normalize.term_to_string env t1 in
                   let uu____14903 =
                     FStar_TypeChecker_Normalize.term_to_string env t2 in
                   let uu____14904 =
                     let uu____14905 = FStar_Util.must g in
                     guard_to_string env uu____14905 in
                   FStar_Util.print3
                     "try_subtype succeeded: %s <: %s\n\tguard is %s\n"
                     uu____14902 uu____14903 uu____14904
=======
          (let uu____14727 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Rel") in
           if uu____14727
           then
             let uu____14728 =
               FStar_TypeChecker_Normalize.term_to_string env t1 in
             let uu____14729 =
               FStar_TypeChecker_Normalize.term_to_string env t2 in
             FStar_Util.print2 "try_subtype of %s and %s\n" uu____14728
               uu____14729
           else ());
          (let uu____14731 =
             new_t_prob env t1 FStar_TypeChecker_Common.SUB t2 in
           match uu____14731 with
           | (prob,x) ->
               let g =
                 let uu____14739 =
                   let uu____14741 = singleton' env prob smt_ok in
                   solve_and_commit env uu____14741
                     (fun uu____14742  -> None) in
                 FStar_All.pipe_left (with_guard env prob) uu____14739 in
               ((let uu____14748 =
                   (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Rel"))
                     && (FStar_Util.is_some g) in
                 if uu____14748
                 then
                   let uu____14749 =
                     FStar_TypeChecker_Normalize.term_to_string env t1 in
                   let uu____14750 =
                     FStar_TypeChecker_Normalize.term_to_string env t2 in
                   let uu____14751 =
                     let uu____14752 = FStar_Util.must g in
                     guard_to_string env uu____14752 in
                   FStar_Util.print3
                     "try_subtype succeeded: %s <: %s\n\tguard is %s\n"
                     uu____14749 uu____14750 uu____14751
>>>>>>> origin/guido_tactics
                 else ());
                abstract_guard x g))
let try_subtype:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      FStar_Syntax_Syntax.typ -> FStar_TypeChecker_Env.guard_t option
  = fun env  -> fun t1  -> fun t2  -> try_subtype' env t1 t2 true
let subtype_fail:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ -> Prims.unit
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
<<<<<<< HEAD
          let uu____14929 = FStar_TypeChecker_Env.get_range env in
          let uu____14930 =
            FStar_TypeChecker_Err.basic_type_error env (Some e) t2 t1 in
          FStar_Errors.err uu____14929 uu____14930
=======
          let uu____14783 = FStar_TypeChecker_Env.get_range env in
          let uu____14784 =
            FStar_TypeChecker_Err.basic_type_error env (Some e) t2 t1 in
          FStar_Errors.err uu____14783 uu____14784
>>>>>>> origin/guido_tactics
let sub_comp:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp -> FStar_TypeChecker_Env.guard_t option
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
<<<<<<< HEAD
        (let uu____14942 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel") in
         if uu____14942
         then
           let uu____14943 = FStar_Syntax_Print.comp_to_string c1 in
           let uu____14944 = FStar_Syntax_Print.comp_to_string c2 in
           FStar_Util.print2 "sub_comp of %s and %s\n" uu____14943
             uu____14944
=======
        (let uu____14799 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Rel") in
         if uu____14799
         then
           let uu____14800 = FStar_Syntax_Print.comp_to_string c1 in
           let uu____14801 = FStar_Syntax_Print.comp_to_string c2 in
           FStar_Util.print2 "sub_comp of %s and %s\n" uu____14800
             uu____14801
>>>>>>> origin/guido_tactics
         else ());
        (let rel =
           if env.FStar_TypeChecker_Env.use_eq
           then FStar_TypeChecker_Common.EQ
           else FStar_TypeChecker_Common.SUB in
         let prob =
<<<<<<< HEAD
           let uu____14949 =
             let uu____14952 = FStar_TypeChecker_Env.get_range env in
             new_problem env c1 rel c2 None uu____14952 "sub_comp" in
           FStar_All.pipe_left
             (fun _0_92  -> FStar_TypeChecker_Common.CProb _0_92) uu____14949 in
         let uu____14955 =
           let uu____14957 = singleton env prob in
           solve_and_commit env uu____14957 (fun uu____14959  -> None) in
         FStar_All.pipe_left (with_guard env prob) uu____14955)
=======
           let uu____14806 =
             let uu____14809 = FStar_TypeChecker_Env.get_range env in
             new_problem env c1 rel c2 None uu____14809 "sub_comp" in
           FStar_All.pipe_left
             (fun _0_97  -> FStar_TypeChecker_Common.CProb _0_97) uu____14806 in
         let uu____14812 =
           let uu____14814 = singleton env prob in
           solve_and_commit env uu____14814 (fun uu____14815  -> None) in
         FStar_All.pipe_left (with_guard env prob) uu____14812)
>>>>>>> origin/guido_tactics
let solve_universe_inequalities':
  FStar_Syntax_Unionfind.tx ->
    FStar_TypeChecker_Env.env ->
      (FStar_Syntax_Syntax.universe Prims.list*
        (FStar_Syntax_Syntax.universe* FStar_Syntax_Syntax.universe)
        Prims.list) -> Prims.unit
  =
  fun tx  ->
    fun env  ->
<<<<<<< HEAD
      fun uu____14978  ->
        match uu____14978 with
        | (variables,ineqs) ->
            let fail u1 u2 =
              FStar_Syntax_Unionfind.rollback tx;
              (let uu____15003 =
                 let uu____15004 =
                   let uu____15007 =
                     let uu____15008 = FStar_Syntax_Print.univ_to_string u1 in
                     let uu____15009 = FStar_Syntax_Print.univ_to_string u2 in
                     FStar_Util.format2 "Universe %s and %s are incompatible"
                       uu____15008 uu____15009 in
                   let uu____15010 = FStar_TypeChecker_Env.get_range env in
                   (uu____15007, uu____15010) in
                 FStar_Errors.Error uu____15004 in
               raise uu____15003) in
            let equiv1 v1 v' =
              let uu____15018 =
                let uu____15021 = FStar_Syntax_Subst.compress_univ v1 in
                let uu____15022 = FStar_Syntax_Subst.compress_univ v' in
                (uu____15021, uu____15022) in
              match uu____15018 with
              | (FStar_Syntax_Syntax.U_unif v0,FStar_Syntax_Syntax.U_unif
                 v0') -> FStar_Syntax_Unionfind.univ_equiv v0 v0'
              | uu____15033 -> false in
=======
      fun uu____14837  ->
        match uu____14837 with
        | (variables,ineqs) ->
            let fail u1 u2 =
              FStar_Syntax_Unionfind.rollback tx;
              (let uu____14862 =
                 let uu____14863 =
                   let uu____14866 =
                     let uu____14867 = FStar_Syntax_Print.univ_to_string u1 in
                     let uu____14868 = FStar_Syntax_Print.univ_to_string u2 in
                     FStar_Util.format2 "Universe %s and %s are incompatible"
                       uu____14867 uu____14868 in
                   let uu____14869 = FStar_TypeChecker_Env.get_range env in
                   (uu____14866, uu____14869) in
                 FStar_Errors.Error uu____14863 in
               raise uu____14862) in
            let equiv1 v1 v' =
              let uu____14877 =
                let uu____14880 = FStar_Syntax_Subst.compress_univ v1 in
                let uu____14881 = FStar_Syntax_Subst.compress_univ v' in
                (uu____14880, uu____14881) in
              match uu____14877 with
              | (FStar_Syntax_Syntax.U_unif v0,FStar_Syntax_Syntax.U_unif
                 v0') -> FStar_Syntax_Unionfind.univ_equiv v0 v0'
              | uu____14888 -> false in
>>>>>>> origin/guido_tactics
            let sols =
              FStar_All.pipe_right variables
                (FStar_List.collect
                   (fun v1  ->
<<<<<<< HEAD
                      let uu____15052 = FStar_Syntax_Subst.compress_univ v1 in
                      match uu____15052 with
                      | FStar_Syntax_Syntax.U_unif uu____15056 ->
                          let lower_bounds_of_v =
                            FStar_All.pipe_right ineqs
                              (FStar_List.collect
                                 (fun uu____15074  ->
                                    match uu____15074 with
                                    | (u,v') ->
                                        let uu____15080 = equiv1 v1 v' in
                                        if uu____15080
                                        then
                                          let uu____15082 =
                                            FStar_All.pipe_right variables
                                              (FStar_Util.for_some (equiv1 u)) in
                                          (if uu____15082 then [] else [u])
=======
                      let uu____14902 = FStar_Syntax_Subst.compress_univ v1 in
                      match uu____14902 with
                      | FStar_Syntax_Syntax.U_unif uu____14906 ->
                          let lower_bounds_of_v =
                            FStar_All.pipe_right ineqs
                              (FStar_List.collect
                                 (fun uu____14917  ->
                                    match uu____14917 with
                                    | (u,v') ->
                                        let uu____14923 = equiv1 v1 v' in
                                        if uu____14923
                                        then
                                          let uu____14925 =
                                            FStar_All.pipe_right variables
                                              (FStar_Util.for_some (equiv1 u)) in
                                          (if uu____14925 then [] else [u])
>>>>>>> origin/guido_tactics
                                        else [])) in
                          let lb =
                            FStar_TypeChecker_Normalize.normalize_universe
                              env
                              (FStar_Syntax_Syntax.U_max lower_bounds_of_v) in
                          [(lb, v1)]
<<<<<<< HEAD
                      | uu____15092 -> [])) in
            let uu____15095 =
              let wl =
                let uu___180_15098 = empty_worklist env in
                {
                  attempting = (uu___180_15098.attempting);
                  wl_deferred = (uu___180_15098.wl_deferred);
                  ctr = (uu___180_15098.ctr);
                  defer_ok = false;
                  smt_ok = (uu___180_15098.smt_ok);
                  tcenv = (uu___180_15098.tcenv)
                } in
              FStar_All.pipe_right sols
                (FStar_List.map
                   (fun uu____15110  ->
                      match uu____15110 with
                      | (lb,v1) ->
                          let uu____15115 =
                            solve_universe_eq (- (Prims.parse_int "1")) wl lb
                              v1 in
                          (match uu____15115 with
                           | USolved wl1 -> ()
                           | uu____15117 -> fail lb v1))) in
            let rec check_ineq uu____15123 =
              match uu____15123 with
=======
                      | uu____14935 -> [])) in
            let uu____14938 =
              let wl =
                let uu___182_14941 = empty_worklist env in
                {
                  attempting = (uu___182_14941.attempting);
                  wl_deferred = (uu___182_14941.wl_deferred);
                  ctr = (uu___182_14941.ctr);
                  defer_ok = false;
                  smt_ok = (uu___182_14941.smt_ok);
                  tcenv = (uu___182_14941.tcenv)
                } in
              FStar_All.pipe_right sols
                (FStar_List.map
                   (fun uu____14948  ->
                      match uu____14948 with
                      | (lb,v1) ->
                          let uu____14953 =
                            solve_universe_eq (- (Prims.parse_int "1")) wl lb
                              v1 in
                          (match uu____14953 with
                           | USolved wl1 -> ()
                           | uu____14955 -> fail lb v1))) in
            let rec check_ineq uu____14961 =
              match uu____14961 with
>>>>>>> origin/guido_tactics
              | (u,v1) ->
                  let u1 =
                    FStar_TypeChecker_Normalize.normalize_universe env u in
                  let v2 =
                    FStar_TypeChecker_Normalize.normalize_universe env v1 in
                  (match (u1, v2) with
<<<<<<< HEAD
                   | (FStar_Syntax_Syntax.U_zero ,uu____15130) -> true
=======
                   | (FStar_Syntax_Syntax.U_zero ,uu____14968) -> true
>>>>>>> origin/guido_tactics
                   | (FStar_Syntax_Syntax.U_succ
                      u0,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u0, v0)
                   | (FStar_Syntax_Syntax.U_name
                      u0,FStar_Syntax_Syntax.U_name v0) ->
                       FStar_Ident.ident_equals u0 v0
                   | (FStar_Syntax_Syntax.U_unif
                      u0,FStar_Syntax_Syntax.U_unif v0) ->
                       FStar_Syntax_Unionfind.univ_equiv u0 v0
                   | (FStar_Syntax_Syntax.U_name
<<<<<<< HEAD
                      uu____15145,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u1, v0)
                   | (FStar_Syntax_Syntax.U_unif
                      uu____15147,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u1, v0)
                   | (FStar_Syntax_Syntax.U_max us,uu____15154) ->
                       FStar_All.pipe_right us
                         (FStar_Util.for_all (fun u2  -> check_ineq (u2, v2)))
                   | (uu____15159,FStar_Syntax_Syntax.U_max vs) ->
                       FStar_All.pipe_right vs
                         (FStar_Util.for_some
                            (fun v3  -> check_ineq (u1, v3)))
                   | uu____15165 -> false) in
            let uu____15168 =
              FStar_All.pipe_right ineqs
                (FStar_Util.for_all
                   (fun uu____15178  ->
                      match uu____15178 with
                      | (u,v1) ->
                          let uu____15183 = check_ineq (u, v1) in
                          if uu____15183
                          then true
                          else
                            ((let uu____15186 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "GenUniverses") in
                              if uu____15186
                              then
                                let uu____15187 =
                                  FStar_Syntax_Print.univ_to_string u in
                                let uu____15188 =
                                  FStar_Syntax_Print.univ_to_string v1 in
                                FStar_Util.print2 "%s </= %s" uu____15187
                                  uu____15188
                              else ());
                             false))) in
            if uu____15168
            then ()
            else
              ((let uu____15192 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                    (FStar_Options.Other "GenUniverses") in
                if uu____15192
                then
                  ((let uu____15194 = ineqs_to_string (variables, ineqs) in
                    FStar_Util.print1
                      "Partially solved inequality constraints are: %s\n"
                      uu____15194);
                   FStar_Syntax_Unionfind.rollback tx;
                   (let uu____15200 = ineqs_to_string (variables, ineqs) in
                    FStar_Util.print1
                      "Original solved inequality constraints are: %s\n"
                      uu____15200))
                else ());
               (let uu____15206 =
                  let uu____15207 =
                    let uu____15210 = FStar_TypeChecker_Env.get_range env in
                    ("Failed to solve universe inequalities for inductives",
                      uu____15210) in
                  FStar_Errors.Error uu____15207 in
                raise uu____15206))
=======
                      uu____14979,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u1, v0)
                   | (FStar_Syntax_Syntax.U_unif
                      uu____14981,FStar_Syntax_Syntax.U_succ v0) ->
                       check_ineq (u1, v0)
                   | (FStar_Syntax_Syntax.U_max us,uu____14986) ->
                       FStar_All.pipe_right us
                         (FStar_Util.for_all (fun u2  -> check_ineq (u2, v2)))
                   | (uu____14990,FStar_Syntax_Syntax.U_max vs) ->
                       FStar_All.pipe_right vs
                         (FStar_Util.for_some
                            (fun v3  -> check_ineq (u1, v3)))
                   | uu____14995 -> false) in
            let uu____14998 =
              FStar_All.pipe_right ineqs
                (FStar_Util.for_all
                   (fun uu____15004  ->
                      match uu____15004 with
                      | (u,v1) ->
                          let uu____15009 = check_ineq (u, v1) in
                          if uu____15009
                          then true
                          else
                            ((let uu____15012 =
                                FStar_All.pipe_left
                                  (FStar_TypeChecker_Env.debug env)
                                  (FStar_Options.Other "GenUniverses") in
                              if uu____15012
                              then
                                let uu____15013 =
                                  FStar_Syntax_Print.univ_to_string u in
                                let uu____15014 =
                                  FStar_Syntax_Print.univ_to_string v1 in
                                FStar_Util.print2 "%s </= %s" uu____15013
                                  uu____15014
                              else ());
                             false))) in
            if uu____14998
            then ()
            else
              ((let uu____15018 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                    (FStar_Options.Other "GenUniverses") in
                if uu____15018
                then
                  ((let uu____15020 = ineqs_to_string (variables, ineqs) in
                    FStar_Util.print1
                      "Partially solved inequality constraints are: %s\n"
                      uu____15020);
                   FStar_Syntax_Unionfind.rollback tx;
                   (let uu____15026 = ineqs_to_string (variables, ineqs) in
                    FStar_Util.print1
                      "Original solved inequality constraints are: %s\n"
                      uu____15026))
                else ());
               (let uu____15032 =
                  let uu____15033 =
                    let uu____15036 = FStar_TypeChecker_Env.get_range env in
                    ("Failed to solve universe inequalities for inductives",
                      uu____15036) in
                  FStar_Errors.Error uu____15033 in
                raise uu____15032))
>>>>>>> origin/guido_tactics
let solve_universe_inequalities:
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.universe Prims.list* (FStar_Syntax_Syntax.universe*
      FStar_Syntax_Syntax.universe) Prims.list) -> Prims.unit
  =
  fun env  ->
    fun ineqs  ->
      let tx = FStar_Syntax_Unionfind.new_transaction () in
      solve_universe_inequalities' tx env ineqs;
      FStar_Syntax_Unionfind.commit tx
let rec solve_deferred_constraints:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun env  ->
    fun g  ->
<<<<<<< HEAD
      let fail uu____15243 =
        match uu____15243 with
=======
      let fail uu____15073 =
        match uu____15073 with
>>>>>>> origin/guido_tactics
        | (d,s) ->
            let msg = explain env d s in
            raise (FStar_Errors.Error (msg, (p_loc d))) in
      let wl = wl_of_guard env g.FStar_TypeChecker_Env.deferred in
<<<<<<< HEAD
      (let uu____15253 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "RelCheck") in
       if uu____15253
       then
         let uu____15254 = wl_to_string wl in
         let uu____15255 =
=======
      (let uu____15083 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "RelCheck") in
       if uu____15083
       then
         let uu____15084 = wl_to_string wl in
         let uu____15085 =
>>>>>>> origin/guido_tactics
           FStar_Util.string_of_int
             (FStar_List.length g.FStar_TypeChecker_Env.implicits) in
         FStar_Util.print2
           "Trying to solve carried problems: begin\n\t%s\nend\n and %s implicits\n"
<<<<<<< HEAD
           uu____15254 uu____15255
       else ());
      (let g1 =
         let uu____15267 = solve_and_commit env wl fail in
         match uu____15267 with
         | Some [] ->
             let uu___181_15274 = g in
             {
               FStar_TypeChecker_Env.guard_f =
                 (uu___181_15274.FStar_TypeChecker_Env.guard_f);
               FStar_TypeChecker_Env.deferred = [];
               FStar_TypeChecker_Env.univ_ineqs =
                 (uu___181_15274.FStar_TypeChecker_Env.univ_ineqs);
               FStar_TypeChecker_Env.implicits =
                 (uu___181_15274.FStar_TypeChecker_Env.implicits)
             }
         | uu____15277 ->
             failwith "impossible: Unexpected deferred constraints remain" in
       solve_universe_inequalities env g1.FStar_TypeChecker_Env.univ_ineqs;
       (let uu___182_15280 = g1 in
        {
          FStar_TypeChecker_Env.guard_f =
            (uu___182_15280.FStar_TypeChecker_Env.guard_f);
          FStar_TypeChecker_Env.deferred =
            (uu___182_15280.FStar_TypeChecker_Env.deferred);
          FStar_TypeChecker_Env.univ_ineqs = ([], []);
          FStar_TypeChecker_Env.implicits =
            (uu___182_15280.FStar_TypeChecker_Env.implicits)
=======
           uu____15084 uu____15085
       else ());
      (let g1 =
         let uu____15100 = solve_and_commit env wl fail in
         match uu____15100 with
         | Some [] ->
             let uu___183_15107 = g in
             {
               FStar_TypeChecker_Env.guard_f =
                 (uu___183_15107.FStar_TypeChecker_Env.guard_f);
               FStar_TypeChecker_Env.deferred = [];
               FStar_TypeChecker_Env.univ_ineqs =
                 (uu___183_15107.FStar_TypeChecker_Env.univ_ineqs);
               FStar_TypeChecker_Env.implicits =
                 (uu___183_15107.FStar_TypeChecker_Env.implicits)
             }
         | uu____15110 ->
             failwith "impossible: Unexpected deferred constraints remain" in
       solve_universe_inequalities env g1.FStar_TypeChecker_Env.univ_ineqs;
       (let uu___184_15113 = g1 in
        {
          FStar_TypeChecker_Env.guard_f =
            (uu___184_15113.FStar_TypeChecker_Env.guard_f);
          FStar_TypeChecker_Env.deferred =
            (uu___184_15113.FStar_TypeChecker_Env.deferred);
          FStar_TypeChecker_Env.univ_ineqs = ([], []);
          FStar_TypeChecker_Env.implicits =
            (uu___184_15113.FStar_TypeChecker_Env.implicits)
>>>>>>> origin/guido_tactics
        }))
let discharge_guard':
  (Prims.unit -> Prims.string) option ->
    FStar_TypeChecker_Env.env ->
      FStar_TypeChecker_Env.guard_t ->
        Prims.bool -> FStar_TypeChecker_Env.guard_t option
  =
  fun use_env_range_msg  ->
    fun env  ->
      fun g  ->
        fun use_smt  ->
          let g1 = solve_deferred_constraints env g in
          let ret_g =
<<<<<<< HEAD
            let uu___183_15306 = g1 in
=======
            let uu___185_15143 = g1 in
>>>>>>> origin/guido_tactics
            {
              FStar_TypeChecker_Env.guard_f =
                FStar_TypeChecker_Common.Trivial;
              FStar_TypeChecker_Env.deferred =
<<<<<<< HEAD
                (uu___183_15306.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___183_15306.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___183_15306.FStar_TypeChecker_Env.implicits)
            } in
          let uu____15307 =
            let uu____15308 = FStar_TypeChecker_Env.should_verify env in
            Prims.op_Negation uu____15308 in
          if uu____15307
=======
                (uu___185_15143.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___185_15143.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___185_15143.FStar_TypeChecker_Env.implicits)
            } in
          let uu____15144 =
            let uu____15145 = FStar_TypeChecker_Env.should_verify env in
            Prims.op_Negation uu____15145 in
          if uu____15144
>>>>>>> origin/guido_tactics
          then Some ret_g
          else
            (match g1.FStar_TypeChecker_Env.guard_f with
             | FStar_TypeChecker_Common.Trivial  -> Some ret_g
             | FStar_TypeChecker_Common.NonTrivial vc ->
<<<<<<< HEAD
                 ((let uu____15314 =
=======
                 ((let uu____15151 =
>>>>>>> origin/guido_tactics
                     (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Norm"))
                       ||
                       (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                          (FStar_Options.Other "SMTQuery")) in
<<<<<<< HEAD
                   if uu____15314
                   then
                     let uu____15315 = FStar_TypeChecker_Env.get_range env in
                     let uu____15316 =
                       let uu____15317 = FStar_Syntax_Print.term_to_string vc in
                       FStar_Util.format1 "Before normalization VC=\n%s\n"
                         uu____15317 in
                     FStar_Errors.diag uu____15315 uu____15316
=======
                   if uu____15151
                   then
                     let uu____15152 = FStar_TypeChecker_Env.get_range env in
                     let uu____15153 =
                       let uu____15154 = FStar_Syntax_Print.term_to_string vc in
                       FStar_Util.format1 "Before normalization VC=\n%s\n"
                         uu____15154 in
                     FStar_Errors.diag uu____15152 uu____15153
>>>>>>> origin/guido_tactics
                   else ());
                  (let vc1 =
                     FStar_TypeChecker_Normalize.normalize
                       [FStar_TypeChecker_Normalize.Eager_unfolding;
                       FStar_TypeChecker_Normalize.Simplify;
                       FStar_TypeChecker_Normalize.Primops] env vc in
                   let uu____15157 = check_trivial vc1 in
                   match uu____15157 with
                   | FStar_TypeChecker_Common.Trivial  -> Some ret_g
                   | FStar_TypeChecker_Common.NonTrivial vc2 ->
                       if Prims.op_Negation use_smt
<<<<<<< HEAD
                       then None
                       else
                         ((let uu____15326 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env)
                               (FStar_Options.Other "Rel") in
                           if uu____15326
                           then
                             let uu____15327 =
                               FStar_TypeChecker_Env.get_range env in
                             let uu____15328 =
                               let uu____15329 =
                                 FStar_Syntax_Print.term_to_string vc2 in
                               FStar_Util.format1 "Checking VC=\n%s\n"
                                 uu____15329 in
                             FStar_Errors.diag uu____15327 uu____15328
                           else ());
                          (let vcs =
                             let uu____15335 = FStar_Options.use_tactics () in
                             if uu____15335
=======
                       then
                         ((let uu____15162 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env)
                               (FStar_Options.Other "Rel") in
                           if uu____15162
                           then
                             let uu____15163 =
                               FStar_TypeChecker_Env.get_range env in
                             let uu____15164 =
                               let uu____15165 =
                                 FStar_Syntax_Print.term_to_string vc2 in
                               FStar_Util.format1
                                 "Cannot solve without SMT : %s\n"
                                 uu____15165 in
                             FStar_Errors.diag uu____15163 uu____15164
                           else ());
                          None)
                       else
                         ((let uu____15170 =
                             FStar_All.pipe_left
                               (FStar_TypeChecker_Env.debug env)
                               (FStar_Options.Other "Rel") in
                           if uu____15170
                           then
                             let uu____15171 =
                               FStar_TypeChecker_Env.get_range env in
                             let uu____15172 =
                               let uu____15173 =
                                 FStar_Syntax_Print.term_to_string vc2 in
                               FStar_Util.format1 "Checking VC=\n%s\n"
                                 uu____15173 in
                             FStar_Errors.diag uu____15171 uu____15172
                           else ());
                          (let vcs =
                             let uu____15180 = FStar_Options.use_tactics () in
                             if uu____15180
>>>>>>> origin/guido_tactics
                             then
                               (env.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.preprocess
                                 env vc2
                             else
                               (let uu____15186 =
                                  let uu____15190 = FStar_Options.peek () in
                                  (env, vc2, uu____15190) in
                                [uu____15186]) in
                           FStar_All.pipe_right vcs
                             (FStar_List.iter
<<<<<<< HEAD
                                (fun uu____15352  ->
                                   match uu____15352 with
                                   | (env1,goal) ->
                                       (env1.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.solve
                                         use_env_range_msg env1 goal)));
=======
                                (fun uu____15204  ->
                                   match uu____15204 with
                                   | (env1,goal,opts) ->
                                       let goal1 =
                                         FStar_TypeChecker_Normalize.normalize
                                           [FStar_TypeChecker_Normalize.Simplify;
                                           FStar_TypeChecker_Normalize.Primops]
                                           env1 goal in
                                       let uu____15212 = check_trivial goal1 in
                                       (match uu____15212 with
                                        | FStar_TypeChecker_Common.Trivial 
                                            ->
                                            let uu____15214 =
                                              (FStar_All.pipe_left
                                                 (FStar_TypeChecker_Env.debug
                                                    env1)
                                                 (FStar_Options.Other "Rel"))
                                                ||
                                                (FStar_All.pipe_left
                                                   (FStar_TypeChecker_Env.debug
                                                      env1)
                                                   (FStar_Options.Other "Tac")) in
                                            if uu____15214
                                            then
                                              FStar_Util.print_string
                                                "Goal completely solved by tactic\n"
                                            else ()
                                        | FStar_TypeChecker_Common.NonTrivial
                                            goal2 ->
                                            (FStar_Options.push ();
                                             FStar_Options.set opts;
                                             (env1.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.refresh
                                               ();
                                             (let uu____15221 =
                                                FStar_All.pipe_left
                                                  (FStar_TypeChecker_Env.debug
                                                     env1)
                                                  (FStar_Options.Other "Rel") in
                                              if uu____15221
                                              then
                                                let uu____15222 =
                                                  FStar_TypeChecker_Env.get_range
                                                    env1 in
                                                let uu____15223 =
                                                  let uu____15224 =
                                                    FStar_Syntax_Print.term_to_string
                                                      goal2 in
                                                  let uu____15225 =
                                                    FStar_TypeChecker_Env.string_of_proof_ns
                                                      env1 in
                                                  FStar_Util.format2
                                                    "Trying to solve:\n> %s\nWith proof_ns:\n %s\n"
                                                    uu____15224 uu____15225 in
                                                FStar_Errors.diag uu____15222
                                                  uu____15223
                                              else ());
                                             (env1.FStar_TypeChecker_Env.solver).FStar_TypeChecker_Env.solve
                                               use_env_range_msg env1 goal2;
                                             FStar_Options.pop ())))));
>>>>>>> origin/guido_tactics
                          Some ret_g))))
let discharge_guard_no_smt:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun env  ->
    fun g  ->
<<<<<<< HEAD
      let uu____15363 = discharge_guard' None env g false in
      match uu____15363 with
      | Some g1 -> g1
      | None  ->
          let uu____15368 =
            let uu____15369 =
              let uu____15372 = FStar_TypeChecker_Env.get_range env in
              ("Expected a trivial pre-condition", uu____15372) in
            FStar_Errors.Error uu____15369 in
          raise uu____15368
=======
      let uu____15237 = discharge_guard' None env g false in
      match uu____15237 with
      | Some g1 -> g1
      | None  ->
          let uu____15242 =
            let uu____15243 =
              let uu____15246 = FStar_TypeChecker_Env.get_range env in
              ("Expected a trivial pre-condition", uu____15246) in
            FStar_Errors.Error uu____15243 in
          raise uu____15242
>>>>>>> origin/guido_tactics
let discharge_guard:
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun env  ->
    fun g  ->
<<<<<<< HEAD
      let uu____15379 = discharge_guard' None env g true in
      match uu____15379 with
=======
      let uu____15255 = discharge_guard' None env g true in
      match uu____15255 with
>>>>>>> origin/guido_tactics
      | Some g1 -> g1
      | None  ->
          failwith
            "Impossible, with use_smt = true, discharge_guard' should never have returned None"
let resolve_implicits':
  Prims.bool ->
    FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t
  =
  fun forcelax  ->
    fun g  ->
      let unresolved u =
        let uu____15272 = FStar_Syntax_Unionfind.find u in
        match uu____15272 with | None  -> true | uu____15274 -> false in
      let rec until_fixpoint acc implicits =
        let uu____15287 = acc in
        match uu____15287 with
        | (out,changed) ->
            (match implicits with
             | [] ->
                 if Prims.op_Negation changed
                 then out
                 else until_fixpoint ([], false) out
             | hd1::tl1 ->
                 let uu____15333 = hd1 in
                 (match uu____15333 with
                  | (uu____15340,env,u,tm,k,r) ->
                      let uu____15346 = unresolved u in
                      if uu____15346
                      then until_fixpoint ((hd1 :: out), changed) tl1
                      else
                        (let env1 =
                           FStar_TypeChecker_Env.set_expected_typ env k in
                         let tm1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Normalize.Beta] env1 tm in
                         (let uu____15364 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env1)
                              (FStar_Options.Other "RelCheck") in
                          if uu____15364
                          then
                            let uu____15365 =
                              FStar_Syntax_Print.uvar_to_string u in
                            let uu____15366 =
                              FStar_Syntax_Print.term_to_string tm1 in
                            let uu____15367 =
                              FStar_Syntax_Print.term_to_string k in
                            FStar_Util.print3
                              "Checking uvar %s resolved to %s at type %s\n"
                              uu____15365 uu____15366 uu____15367
                          else ());
                         (let env2 =
                            if forcelax
                            then
                              let uu___186_15370 = env1 in
                              {
                                FStar_TypeChecker_Env.solver =
                                  (uu___186_15370.FStar_TypeChecker_Env.solver);
                                FStar_TypeChecker_Env.range =
                                  (uu___186_15370.FStar_TypeChecker_Env.range);
                                FStar_TypeChecker_Env.curmodule =
                                  (uu___186_15370.FStar_TypeChecker_Env.curmodule);
                                FStar_TypeChecker_Env.gamma =
                                  (uu___186_15370.FStar_TypeChecker_Env.gamma);
                                FStar_TypeChecker_Env.gamma_cache =
                                  (uu___186_15370.FStar_TypeChecker_Env.gamma_cache);
                                FStar_TypeChecker_Env.modules =
                                  (uu___186_15370.FStar_TypeChecker_Env.modules);
                                FStar_TypeChecker_Env.expected_typ =
                                  (uu___186_15370.FStar_TypeChecker_Env.expected_typ);
                                FStar_TypeChecker_Env.sigtab =
                                  (uu___186_15370.FStar_TypeChecker_Env.sigtab);
                                FStar_TypeChecker_Env.is_pattern =
                                  (uu___186_15370.FStar_TypeChecker_Env.is_pattern);
                                FStar_TypeChecker_Env.instantiate_imp =
                                  (uu___186_15370.FStar_TypeChecker_Env.instantiate_imp);
                                FStar_TypeChecker_Env.effects =
                                  (uu___186_15370.FStar_TypeChecker_Env.effects);
                                FStar_TypeChecker_Env.generalize =
                                  (uu___186_15370.FStar_TypeChecker_Env.generalize);
                                FStar_TypeChecker_Env.letrecs =
                                  (uu___186_15370.FStar_TypeChecker_Env.letrecs);
                                FStar_TypeChecker_Env.top_level =
                                  (uu___186_15370.FStar_TypeChecker_Env.top_level);
                                FStar_TypeChecker_Env.check_uvars =
                                  (uu___186_15370.FStar_TypeChecker_Env.check_uvars);
                                FStar_TypeChecker_Env.use_eq =
                                  (uu___186_15370.FStar_TypeChecker_Env.use_eq);
                                FStar_TypeChecker_Env.is_iface =
                                  (uu___186_15370.FStar_TypeChecker_Env.is_iface);
                                FStar_TypeChecker_Env.admit =
                                  (uu___186_15370.FStar_TypeChecker_Env.admit);
                                FStar_TypeChecker_Env.lax = true;
                                FStar_TypeChecker_Env.lax_universes =
                                  (uu___186_15370.FStar_TypeChecker_Env.lax_universes);
                                FStar_TypeChecker_Env.type_of =
                                  (uu___186_15370.FStar_TypeChecker_Env.type_of);
                                FStar_TypeChecker_Env.universe_of =
                                  (uu___186_15370.FStar_TypeChecker_Env.universe_of);
                                FStar_TypeChecker_Env.use_bv_sorts =
                                  (uu___186_15370.FStar_TypeChecker_Env.use_bv_sorts);
                                FStar_TypeChecker_Env.qname_and_index =
                                  (uu___186_15370.FStar_TypeChecker_Env.qname_and_index);
                                FStar_TypeChecker_Env.proof_ns =
                                  (uu___186_15370.FStar_TypeChecker_Env.proof_ns);
                                FStar_TypeChecker_Env.synth =
                                  (uu___186_15370.FStar_TypeChecker_Env.synth);
                                FStar_TypeChecker_Env.is_native_tactic =
                                  (uu___186_15370.FStar_TypeChecker_Env.is_native_tactic)
                              }
                            else env1 in
                          let uu____15372 =
                            env2.FStar_TypeChecker_Env.type_of
                              (let uu___187_15376 = env2 in
                               {
                                 FStar_TypeChecker_Env.solver =
                                   (uu___187_15376.FStar_TypeChecker_Env.solver);
                                 FStar_TypeChecker_Env.range =
                                   (uu___187_15376.FStar_TypeChecker_Env.range);
                                 FStar_TypeChecker_Env.curmodule =
                                   (uu___187_15376.FStar_TypeChecker_Env.curmodule);
                                 FStar_TypeChecker_Env.gamma =
                                   (uu___187_15376.FStar_TypeChecker_Env.gamma);
                                 FStar_TypeChecker_Env.gamma_cache =
                                   (uu___187_15376.FStar_TypeChecker_Env.gamma_cache);
                                 FStar_TypeChecker_Env.modules =
                                   (uu___187_15376.FStar_TypeChecker_Env.modules);
                                 FStar_TypeChecker_Env.expected_typ =
                                   (uu___187_15376.FStar_TypeChecker_Env.expected_typ);
                                 FStar_TypeChecker_Env.sigtab =
                                   (uu___187_15376.FStar_TypeChecker_Env.sigtab);
                                 FStar_TypeChecker_Env.is_pattern =
                                   (uu___187_15376.FStar_TypeChecker_Env.is_pattern);
                                 FStar_TypeChecker_Env.instantiate_imp =
                                   (uu___187_15376.FStar_TypeChecker_Env.instantiate_imp);
                                 FStar_TypeChecker_Env.effects =
                                   (uu___187_15376.FStar_TypeChecker_Env.effects);
                                 FStar_TypeChecker_Env.generalize =
                                   (uu___187_15376.FStar_TypeChecker_Env.generalize);
                                 FStar_TypeChecker_Env.letrecs =
                                   (uu___187_15376.FStar_TypeChecker_Env.letrecs);
                                 FStar_TypeChecker_Env.top_level =
                                   (uu___187_15376.FStar_TypeChecker_Env.top_level);
                                 FStar_TypeChecker_Env.check_uvars =
                                   (uu___187_15376.FStar_TypeChecker_Env.check_uvars);
                                 FStar_TypeChecker_Env.use_eq =
                                   (uu___187_15376.FStar_TypeChecker_Env.use_eq);
                                 FStar_TypeChecker_Env.is_iface =
                                   (uu___187_15376.FStar_TypeChecker_Env.is_iface);
                                 FStar_TypeChecker_Env.admit =
                                   (uu___187_15376.FStar_TypeChecker_Env.admit);
                                 FStar_TypeChecker_Env.lax =
                                   (uu___187_15376.FStar_TypeChecker_Env.lax);
                                 FStar_TypeChecker_Env.lax_universes =
                                   (uu___187_15376.FStar_TypeChecker_Env.lax_universes);
                                 FStar_TypeChecker_Env.type_of =
                                   (uu___187_15376.FStar_TypeChecker_Env.type_of);
                                 FStar_TypeChecker_Env.universe_of =
                                   (uu___187_15376.FStar_TypeChecker_Env.universe_of);
                                 FStar_TypeChecker_Env.use_bv_sorts = true;
                                 FStar_TypeChecker_Env.qname_and_index =
                                   (uu___187_15376.FStar_TypeChecker_Env.qname_and_index);
                                 FStar_TypeChecker_Env.proof_ns =
                                   (uu___187_15376.FStar_TypeChecker_Env.proof_ns);
                                 FStar_TypeChecker_Env.synth =
                                   (uu___187_15376.FStar_TypeChecker_Env.synth);
                                 FStar_TypeChecker_Env.is_native_tactic =
                                   (uu___187_15376.FStar_TypeChecker_Env.is_native_tactic)
                               }) tm1 in
                          match uu____15372 with
                          | (uu____15377,uu____15378,g1) ->
                              let g2 =
                                if env2.FStar_TypeChecker_Env.is_pattern
                                then
                                  let uu___188_15381 = g1 in
                                  {
                                    FStar_TypeChecker_Env.guard_f =
                                      FStar_TypeChecker_Common.Trivial;
                                    FStar_TypeChecker_Env.deferred =
                                      (uu___188_15381.FStar_TypeChecker_Env.deferred);
                                    FStar_TypeChecker_Env.univ_ineqs =
                                      (uu___188_15381.FStar_TypeChecker_Env.univ_ineqs);
                                    FStar_TypeChecker_Env.implicits =
                                      (uu___188_15381.FStar_TypeChecker_Env.implicits)
                                  }
                                else g1 in
                              let g' =
                                let uu____15384 =
                                  discharge_guard'
                                    (Some
                                       (fun uu____15388  ->
                                          FStar_Syntax_Print.term_to_string
                                            tm1)) env2 g2 true in
                                match uu____15384 with
                                | Some g3 -> g3
                                | None  ->
                                    failwith
                                      "Impossible, with use_smt = true, discharge_guard' should never have returned None" in
                              until_fixpoint
                                ((FStar_List.append
                                    g'.FStar_TypeChecker_Env.implicits out),
                                  true) tl1)))) in
      let uu___189_15403 = g in
      let uu____15404 =
        until_fixpoint ([], false) g.FStar_TypeChecker_Env.implicits in
      {
        FStar_TypeChecker_Env.guard_f =
          (uu___189_15403.FStar_TypeChecker_Env.guard_f);
        FStar_TypeChecker_Env.deferred =
          (uu___189_15403.FStar_TypeChecker_Env.deferred);
        FStar_TypeChecker_Env.univ_ineqs =
          (uu___189_15403.FStar_TypeChecker_Env.univ_ineqs);
        FStar_TypeChecker_Env.implicits = uu____15404
      }
let resolve_implicits:
  FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t =
<<<<<<< HEAD
  fun g  ->
    let unresolved u =
      let uu____15391 = FStar_Syntax_Unionfind.find u in
      match uu____15391 with | None  -> true | uu____15393 -> false in
    let rec until_fixpoint acc implicits =
      let uu____15406 = acc in
      match uu____15406 with
      | (out,changed) ->
          (match implicits with
           | [] ->
               if Prims.op_Negation changed
               then out
               else until_fixpoint ([], false) out
           | hd1::tl1 ->
               let uu____15452 = hd1 in
               (match uu____15452 with
                | (uu____15459,env,u,tm,k,r) ->
                    let uu____15465 = unresolved u in
                    if uu____15465
                    then until_fixpoint ((hd1 :: out), changed) tl1
                    else
                      (let env1 =
                         FStar_TypeChecker_Env.set_expected_typ env k in
                       let tm1 =
                         FStar_TypeChecker_Normalize.normalize
                           [FStar_TypeChecker_Normalize.Beta] env1 tm in
                       (let uu____15483 =
                          FStar_All.pipe_left
                            (FStar_TypeChecker_Env.debug env1)
                            (FStar_Options.Other "RelCheck") in
                        if uu____15483
                        then
                          let uu____15484 =
                            FStar_Syntax_Print.uvar_to_string u in
                          let uu____15485 =
                            FStar_Syntax_Print.term_to_string tm1 in
                          let uu____15486 =
                            FStar_Syntax_Print.term_to_string k in
                          FStar_Util.print3
                            "Checking uvar %s resolved to %s at type %s\n"
                            uu____15484 uu____15485 uu____15486
                        else ());
                       (let uu____15488 =
                          env1.FStar_TypeChecker_Env.type_of
                            (let uu___184_15493 = env1 in
                             {
                               FStar_TypeChecker_Env.solver =
                                 (uu___184_15493.FStar_TypeChecker_Env.solver);
                               FStar_TypeChecker_Env.range =
                                 (uu___184_15493.FStar_TypeChecker_Env.range);
                               FStar_TypeChecker_Env.curmodule =
                                 (uu___184_15493.FStar_TypeChecker_Env.curmodule);
                               FStar_TypeChecker_Env.gamma =
                                 (uu___184_15493.FStar_TypeChecker_Env.gamma);
                               FStar_TypeChecker_Env.gamma_cache =
                                 (uu___184_15493.FStar_TypeChecker_Env.gamma_cache);
                               FStar_TypeChecker_Env.modules =
                                 (uu___184_15493.FStar_TypeChecker_Env.modules);
                               FStar_TypeChecker_Env.expected_typ =
                                 (uu___184_15493.FStar_TypeChecker_Env.expected_typ);
                               FStar_TypeChecker_Env.sigtab =
                                 (uu___184_15493.FStar_TypeChecker_Env.sigtab);
                               FStar_TypeChecker_Env.is_pattern =
                                 (uu___184_15493.FStar_TypeChecker_Env.is_pattern);
                               FStar_TypeChecker_Env.instantiate_imp =
                                 (uu___184_15493.FStar_TypeChecker_Env.instantiate_imp);
                               FStar_TypeChecker_Env.effects =
                                 (uu___184_15493.FStar_TypeChecker_Env.effects);
                               FStar_TypeChecker_Env.generalize =
                                 (uu___184_15493.FStar_TypeChecker_Env.generalize);
                               FStar_TypeChecker_Env.letrecs =
                                 (uu___184_15493.FStar_TypeChecker_Env.letrecs);
                               FStar_TypeChecker_Env.top_level =
                                 (uu___184_15493.FStar_TypeChecker_Env.top_level);
                               FStar_TypeChecker_Env.check_uvars =
                                 (uu___184_15493.FStar_TypeChecker_Env.check_uvars);
                               FStar_TypeChecker_Env.use_eq =
                                 (uu___184_15493.FStar_TypeChecker_Env.use_eq);
                               FStar_TypeChecker_Env.is_iface =
                                 (uu___184_15493.FStar_TypeChecker_Env.is_iface);
                               FStar_TypeChecker_Env.admit =
                                 (uu___184_15493.FStar_TypeChecker_Env.admit);
                               FStar_TypeChecker_Env.lax =
                                 (uu___184_15493.FStar_TypeChecker_Env.lax);
                               FStar_TypeChecker_Env.lax_universes =
                                 (uu___184_15493.FStar_TypeChecker_Env.lax_universes);
                               FStar_TypeChecker_Env.type_of =
                                 (uu___184_15493.FStar_TypeChecker_Env.type_of);
                               FStar_TypeChecker_Env.universe_of =
                                 (uu___184_15493.FStar_TypeChecker_Env.universe_of);
                               FStar_TypeChecker_Env.use_bv_sorts = true;
                               FStar_TypeChecker_Env.qname_and_index =
                                 (uu___184_15493.FStar_TypeChecker_Env.qname_and_index)
                             }) tm1 in
                        match uu____15488 with
                        | (uu____15494,uu____15495,g1) ->
                            let g2 =
                              if env1.FStar_TypeChecker_Env.is_pattern
                              then
                                let uu___185_15498 = g1 in
                                {
                                  FStar_TypeChecker_Env.guard_f =
                                    FStar_TypeChecker_Common.Trivial;
                                  FStar_TypeChecker_Env.deferred =
                                    (uu___185_15498.FStar_TypeChecker_Env.deferred);
                                  FStar_TypeChecker_Env.univ_ineqs =
                                    (uu___185_15498.FStar_TypeChecker_Env.univ_ineqs);
                                  FStar_TypeChecker_Env.implicits =
                                    (uu___185_15498.FStar_TypeChecker_Env.implicits)
                                }
                              else g1 in
                            let g' =
                              let uu____15501 =
                                discharge_guard'
                                  (Some
                                     (fun uu____15506  ->
                                        FStar_Syntax_Print.term_to_string tm1))
                                  env1 g2 true in
                              match uu____15501 with
                              | Some g3 -> g3
                              | None  ->
                                  failwith
                                    "Impossible, with use_smt = true, discharge_guard' should never have returned None" in
                            until_fixpoint
                              ((FStar_List.append
                                  g'.FStar_TypeChecker_Env.implicits out),
                                true) tl1)))) in
    let uu___186_15521 = g in
    let uu____15522 =
      until_fixpoint ([], false) g.FStar_TypeChecker_Env.implicits in
    {
      FStar_TypeChecker_Env.guard_f =
        (uu___186_15521.FStar_TypeChecker_Env.guard_f);
      FStar_TypeChecker_Env.deferred =
        (uu___186_15521.FStar_TypeChecker_Env.deferred);
      FStar_TypeChecker_Env.univ_ineqs =
        (uu___186_15521.FStar_TypeChecker_Env.univ_ineqs);
      FStar_TypeChecker_Env.implicits = uu____15522
    }
=======
  fun g  -> resolve_implicits' false g
let resolve_implicits_lax:
  FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t =
  fun g  -> resolve_implicits' true g
>>>>>>> origin/guido_tactics
let force_trivial_guard:
  FStar_TypeChecker_Env.env -> FStar_TypeChecker_Env.guard_t -> Prims.unit =
  fun env  ->
    fun g  ->
      let g1 =
<<<<<<< HEAD
        let uu____15550 = solve_deferred_constraints env g in
        FStar_All.pipe_right uu____15550 resolve_implicits in
      match g1.FStar_TypeChecker_Env.implicits with
      | [] ->
          let uu____15557 = discharge_guard env g1 in
          FStar_All.pipe_left FStar_Pervasives.ignore uu____15557
      | (reason,uu____15559,uu____15560,e,t,r)::uu____15564 ->
          let uu____15578 =
            let uu____15579 = FStar_Syntax_Print.term_to_string t in
            let uu____15580 = FStar_Syntax_Print.term_to_string e in
            FStar_Util.format2
              "Failed to resolve implicit argument of type '%s' introduced in %s"
              uu____15579 uu____15580 in
          FStar_Errors.err r uu____15578
=======
        let uu____15442 = solve_deferred_constraints env g in
        FStar_All.pipe_right uu____15442 resolve_implicits in
      match g1.FStar_TypeChecker_Env.implicits with
      | [] ->
          let uu____15449 = discharge_guard env g1 in
          FStar_All.pipe_left FStar_Pervasives.ignore uu____15449
      | (reason,uu____15451,uu____15452,e,t,r)::uu____15456 ->
          let uu____15470 =
            let uu____15471 = FStar_Syntax_Print.term_to_string t in
            let uu____15472 = FStar_Syntax_Print.term_to_string e in
            FStar_Util.format2
              "Failed to resolve implicit argument of type '%s' introduced in %s"
              uu____15471 uu____15472 in
          FStar_Errors.err r uu____15470
>>>>>>> origin/guido_tactics
let universe_inequality:
  FStar_Syntax_Syntax.universe ->
    FStar_Syntax_Syntax.universe -> FStar_TypeChecker_Env.guard_t
  =
  fun u1  ->
    fun u2  ->
<<<<<<< HEAD
      let uu___187_15587 = trivial_guard in
      {
        FStar_TypeChecker_Env.guard_f =
          (uu___187_15587.FStar_TypeChecker_Env.guard_f);
        FStar_TypeChecker_Env.deferred =
          (uu___187_15587.FStar_TypeChecker_Env.deferred);
        FStar_TypeChecker_Env.univ_ineqs = ([], [(u1, u2)]);
        FStar_TypeChecker_Env.implicits =
          (uu___187_15587.FStar_TypeChecker_Env.implicits)
=======
      let uu___190_15481 = trivial_guard in
      {
        FStar_TypeChecker_Env.guard_f =
          (uu___190_15481.FStar_TypeChecker_Env.guard_f);
        FStar_TypeChecker_Env.deferred =
          (uu___190_15481.FStar_TypeChecker_Env.deferred);
        FStar_TypeChecker_Env.univ_ineqs = ([], [(u1, u2)]);
        FStar_TypeChecker_Env.implicits =
          (uu___190_15481.FStar_TypeChecker_Env.implicits)
>>>>>>> origin/guido_tactics
      }
let teq_nosmt:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ -> Prims.bool
  =
  fun env  ->
    fun t1  ->
      fun t2  ->
<<<<<<< HEAD
        let uu____15605 = try_teq false env t1 t2 in
        match uu____15605 with
        | None  -> false
        | Some g ->
            let uu____15608 = discharge_guard' None env g false in
            (match uu____15608 with
             | Some uu____15612 -> true
=======
        let uu____15502 = try_teq false env t1 t2 in
        match uu____15502 with
        | None  -> false
        | Some g ->
            let uu____15505 = discharge_guard' None env g false in
            (match uu____15505 with
             | Some uu____15509 -> true
>>>>>>> origin/guido_tactics
             | None  -> false)