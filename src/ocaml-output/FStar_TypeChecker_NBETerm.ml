open Prims
type var = FStar_Syntax_Syntax.bv
type sort = Prims.int
type constant =
  | Unit 
  | Bool of Prims.bool 
  | Int of FStar_BigInt.t 
  | String of (Prims.string * FStar_Range.range) 
  | Char of FStar_Char.char 
  | Range of FStar_Range.range 
  | SConst of FStar_Const.sconst 
let (uu___is_Unit : constant -> Prims.bool) =
  fun projectee  -> match projectee with | Unit  -> true | uu____62 -> false 
let (uu___is_Bool : constant -> Prims.bool) =
  fun projectee  ->
    match projectee with | Bool _0 -> true | uu____75 -> false
  
let (__proj__Bool__item___0 : constant -> Prims.bool) =
  fun projectee  -> match projectee with | Bool _0 -> _0 
let (uu___is_Int : constant -> Prims.bool) =
  fun projectee  -> match projectee with | Int _0 -> true | uu____97 -> false 
let (__proj__Int__item___0 : constant -> FStar_BigInt.t) =
  fun projectee  -> match projectee with | Int _0 -> _0 
let (uu___is_String : constant -> Prims.bool) =
  fun projectee  ->
    match projectee with | String _0 -> true | uu____121 -> false
  
let (__proj__String__item___0 :
  constant -> (Prims.string * FStar_Range.range)) =
  fun projectee  -> match projectee with | String _0 -> _0 
let (uu___is_Char : constant -> Prims.bool) =
  fun projectee  ->
    match projectee with | Char _0 -> true | uu____156 -> false
  
let (__proj__Char__item___0 : constant -> FStar_Char.char) =
  fun projectee  -> match projectee with | Char _0 -> _0 
let (uu___is_Range : constant -> Prims.bool) =
  fun projectee  ->
    match projectee with | Range _0 -> true | uu____178 -> false
  
let (__proj__Range__item___0 : constant -> FStar_Range.range) =
  fun projectee  -> match projectee with | Range _0 -> _0 
let (uu___is_SConst : constant -> Prims.bool) =
  fun projectee  ->
    match projectee with | SConst _0 -> true | uu____197 -> false
  
let (__proj__SConst__item___0 : constant -> FStar_Const.sconst) =
  fun projectee  -> match projectee with | SConst _0 -> _0 
type atom =
  | Var of var 
  | Match of (t * (unit -> FStar_Syntax_Syntax.branch Prims.list)) 
  | UnreducedLet of (var * t FStar_Thunk.t * t FStar_Thunk.t * t
  FStar_Thunk.t * FStar_Syntax_Syntax.letbinding) 
  | UnreducedLetRec of ((var * t * t) Prims.list * t *
  FStar_Syntax_Syntax.letbinding Prims.list) 
  | UVar of FStar_Syntax_Syntax.term FStar_Thunk.t 
and t =
  | Lam of ((t Prims.list -> t) *
  ((t Prims.list * FStar_Syntax_Syntax.binders *
     FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option),
  (t * FStar_Syntax_Syntax.aqual) Prims.list) FStar_Util.either * Prims.int)
  
  | Accu of (atom * (t * FStar_Syntax_Syntax.aqual) Prims.list) 
  | Construct of (FStar_Syntax_Syntax.fv * FStar_Syntax_Syntax.universe
  Prims.list * (t * FStar_Syntax_Syntax.aqual) Prims.list) 
  | FV of (FStar_Syntax_Syntax.fv * FStar_Syntax_Syntax.universe Prims.list *
  (t * FStar_Syntax_Syntax.aqual) Prims.list) 
  | Constant of constant 
  | Type_t of FStar_Syntax_Syntax.universe 
  | Univ of FStar_Syntax_Syntax.universe 
  | Unknown 
  | Arrow of
  (FStar_Syntax_Syntax.term FStar_Thunk.t,((t * FStar_Syntax_Syntax.aqual)
                                            Prims.list * comp))
  FStar_Util.either 
  | Refinement of ((t -> t) * (unit -> (t * FStar_Syntax_Syntax.aqual))) 
  | Reflect of t 
  | Quote of (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.quoteinfo) 
  | Lazy of
  ((FStar_Syntax_Syntax.lazyinfo,(FStar_Dyn.dyn *
                                   FStar_Syntax_Syntax.emb_typ))
  FStar_Util.either * t FStar_Thunk.t) 
  | TopLevelLet of (FStar_Syntax_Syntax.letbinding * Prims.int * (t *
  FStar_Syntax_Syntax.aqual) Prims.list) 
  | TopLevelRec of (FStar_Syntax_Syntax.letbinding * Prims.int * Prims.bool
  Prims.list * (t * FStar_Syntax_Syntax.aqual) Prims.list) 
  | LocalLetRec of (Prims.int * FStar_Syntax_Syntax.letbinding *
  FStar_Syntax_Syntax.letbinding Prims.list * t Prims.list * (t *
  FStar_Syntax_Syntax.aqual) Prims.list * Prims.int * Prims.bool Prims.list) 
and comp =
  | Tot of (t * FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  
  | GTot of (t * FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  
  | Comp of comp_typ 
and comp_typ =
  {
  comp_univs: FStar_Syntax_Syntax.universes ;
  effect_name: FStar_Ident.lident ;
  result_typ: t ;
  effect_args: (t * FStar_Syntax_Syntax.aqual) Prims.list ;
  flags: cflag Prims.list }
and cflag =
  | TOTAL 
  | MLEFFECT 
  | RETURN 
  | PARTIAL_RETURN 
  | SOMETRIVIAL 
  | TRIVIAL_POSTCONDITION 
  | SHOULD_NOT_INLINE 
  | LEMMA 
  | CPS 
  | DECREASES of t 
and residual_comp =
  {
  residual_effect: FStar_Ident.lident ;
  residual_typ: t FStar_Pervasives_Native.option ;
  residual_flags: cflag Prims.list }
let (uu___is_Var : atom -> Prims.bool) =
  fun projectee  ->
    match projectee with | Var _0 -> true | uu____895 -> false
  
let (__proj__Var__item___0 : atom -> var) =
  fun projectee  -> match projectee with | Var _0 -> _0 
let (uu___is_Match : atom -> Prims.bool) =
  fun projectee  ->
    match projectee with | Match _0 -> true | uu____923 -> false
  
let (__proj__Match__item___0 :
  atom -> (t * (unit -> FStar_Syntax_Syntax.branch Prims.list))) =
  fun projectee  -> match projectee with | Match _0 -> _0 
let (uu___is_UnreducedLet : atom -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnreducedLet _0 -> true | uu____985 -> false
  
let (__proj__UnreducedLet__item___0 :
  atom ->
    (var * t FStar_Thunk.t * t FStar_Thunk.t * t FStar_Thunk.t *
      FStar_Syntax_Syntax.letbinding))
  = fun projectee  -> match projectee with | UnreducedLet _0 -> _0 
let (uu___is_UnreducedLetRec : atom -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnreducedLetRec _0 -> true | uu____1068 -> false
  
let (__proj__UnreducedLetRec__item___0 :
  atom ->
    ((var * t * t) Prims.list * t * FStar_Syntax_Syntax.letbinding
      Prims.list))
  = fun projectee  -> match projectee with | UnreducedLetRec _0 -> _0 
let (uu___is_UVar : atom -> Prims.bool) =
  fun projectee  ->
    match projectee with | UVar _0 -> true | uu____1137 -> false
  
let (__proj__UVar__item___0 : atom -> FStar_Syntax_Syntax.term FStar_Thunk.t)
  = fun projectee  -> match projectee with | UVar _0 -> _0 
let (uu___is_Lam : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Lam _0 -> true | uu____1194 -> false
  
let (__proj__Lam__item___0 :
  t ->
    ((t Prims.list -> t) *
      ((t Prims.list * FStar_Syntax_Syntax.binders *
         FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option),
      (t * FStar_Syntax_Syntax.aqual) Prims.list) FStar_Util.either *
      Prims.int))
  = fun projectee  -> match projectee with | Lam _0 -> _0 
let (uu___is_Accu : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Accu _0 -> true | uu____1319 -> false
  
let (__proj__Accu__item___0 :
  t -> (atom * (t * FStar_Syntax_Syntax.aqual) Prims.list)) =
  fun projectee  -> match projectee with | Accu _0 -> _0 
let (uu___is_Construct : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Construct _0 -> true | uu____1382 -> false
  
let (__proj__Construct__item___0 :
  t ->
    (FStar_Syntax_Syntax.fv * FStar_Syntax_Syntax.universe Prims.list * (t *
      FStar_Syntax_Syntax.aqual) Prims.list))
  = fun projectee  -> match projectee with | Construct _0 -> _0 
let (uu___is_FV : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | FV _0 -> true | uu____1457 -> false
  
let (__proj__FV__item___0 :
  t ->
    (FStar_Syntax_Syntax.fv * FStar_Syntax_Syntax.universe Prims.list * (t *
      FStar_Syntax_Syntax.aqual) Prims.list))
  = fun projectee  -> match projectee with | FV _0 -> _0 
let (uu___is_Constant : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Constant _0 -> true | uu____1518 -> false
  
let (__proj__Constant__item___0 : t -> constant) =
  fun projectee  -> match projectee with | Constant _0 -> _0 
let (uu___is_Type_t : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Type_t _0 -> true | uu____1537 -> false
  
let (__proj__Type_t__item___0 : t -> FStar_Syntax_Syntax.universe) =
  fun projectee  -> match projectee with | Type_t _0 -> _0 
let (uu___is_Univ : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Univ _0 -> true | uu____1556 -> false
  
let (__proj__Univ__item___0 : t -> FStar_Syntax_Syntax.universe) =
  fun projectee  -> match projectee with | Univ _0 -> _0 
let (uu___is_Unknown : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Unknown  -> true | uu____1574 -> false
  
let (uu___is_Arrow : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Arrow _0 -> true | uu____1602 -> false
  
let (__proj__Arrow__item___0 :
  t ->
    (FStar_Syntax_Syntax.term FStar_Thunk.t,((t * FStar_Syntax_Syntax.aqual)
                                              Prims.list * comp))
      FStar_Util.either)
  = fun projectee  -> match projectee with | Arrow _0 -> _0 
let (uu___is_Refinement : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Refinement _0 -> true | uu____1683 -> false
  
let (__proj__Refinement__item___0 :
  t -> ((t -> t) * (unit -> (t * FStar_Syntax_Syntax.aqual)))) =
  fun projectee  -> match projectee with | Refinement _0 -> _0 
let (uu___is_Reflect : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Reflect _0 -> true | uu____1744 -> false
  
let (__proj__Reflect__item___0 : t -> t) =
  fun projectee  -> match projectee with | Reflect _0 -> _0 
let (uu___is_Quote : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Quote _0 -> true | uu____1767 -> false
  
let (__proj__Quote__item___0 :
  t -> (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.quoteinfo)) =
  fun projectee  -> match projectee with | Quote _0 -> _0 
let (uu___is_Lazy : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Lazy _0 -> true | uu____1812 -> false
  
let (__proj__Lazy__item___0 :
  t ->
    ((FStar_Syntax_Syntax.lazyinfo,(FStar_Dyn.dyn *
                                     FStar_Syntax_Syntax.emb_typ))
      FStar_Util.either * t FStar_Thunk.t))
  = fun projectee  -> match projectee with | Lazy _0 -> _0 
let (uu___is_TopLevelLet : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | TopLevelLet _0 -> true | uu____1886 -> false
  
let (__proj__TopLevelLet__item___0 :
  t ->
    (FStar_Syntax_Syntax.letbinding * Prims.int * (t *
      FStar_Syntax_Syntax.aqual) Prims.list))
  = fun projectee  -> match projectee with | TopLevelLet _0 -> _0 
let (uu___is_TopLevelRec : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | TopLevelRec _0 -> true | uu____1962 -> false
  
let (__proj__TopLevelRec__item___0 :
  t ->
    (FStar_Syntax_Syntax.letbinding * Prims.int * Prims.bool Prims.list * (t
      * FStar_Syntax_Syntax.aqual) Prims.list))
  = fun projectee  -> match projectee with | TopLevelRec _0 -> _0 
let (uu___is_LocalLetRec : t -> Prims.bool) =
  fun projectee  ->
    match projectee with | LocalLetRec _0 -> true | uu____2064 -> false
  
let (__proj__LocalLetRec__item___0 :
  t ->
    (Prims.int * FStar_Syntax_Syntax.letbinding *
      FStar_Syntax_Syntax.letbinding Prims.list * t Prims.list * (t *
      FStar_Syntax_Syntax.aqual) Prims.list * Prims.int * Prims.bool
      Prims.list))
  = fun projectee  -> match projectee with | LocalLetRec _0 -> _0 
let (uu___is_Tot : comp -> Prims.bool) =
  fun projectee  ->
    match projectee with | Tot _0 -> true | uu____2176 -> false
  
let (__proj__Tot__item___0 :
  comp -> (t * FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option))
  = fun projectee  -> match projectee with | Tot _0 -> _0 
let (uu___is_GTot : comp -> Prims.bool) =
  fun projectee  ->
    match projectee with | GTot _0 -> true | uu____2219 -> false
  
let (__proj__GTot__item___0 :
  comp -> (t * FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option))
  = fun projectee  -> match projectee with | GTot _0 -> _0 
let (uu___is_Comp : comp -> Prims.bool) =
  fun projectee  ->
    match projectee with | Comp _0 -> true | uu____2256 -> false
  
let (__proj__Comp__item___0 : comp -> comp_typ) =
  fun projectee  -> match projectee with | Comp _0 -> _0 
let (__proj__Mkcomp_typ__item__comp_univs :
  comp_typ -> FStar_Syntax_Syntax.universes) =
  fun projectee  ->
    match projectee with
    | { comp_univs; effect_name; result_typ; effect_args; flags;_} ->
        comp_univs
  
let (__proj__Mkcomp_typ__item__effect_name : comp_typ -> FStar_Ident.lident)
  =
  fun projectee  ->
    match projectee with
    | { comp_univs; effect_name; result_typ; effect_args; flags;_} ->
        effect_name
  
let (__proj__Mkcomp_typ__item__result_typ : comp_typ -> t) =
  fun projectee  ->
    match projectee with
    | { comp_univs; effect_name; result_typ; effect_args; flags;_} ->
        result_typ
  
let (__proj__Mkcomp_typ__item__effect_args :
  comp_typ -> (t * FStar_Syntax_Syntax.aqual) Prims.list) =
  fun projectee  ->
    match projectee with
    | { comp_univs; effect_name; result_typ; effect_args; flags;_} ->
        effect_args
  
let (__proj__Mkcomp_typ__item__flags : comp_typ -> cflag Prims.list) =
  fun projectee  ->
    match projectee with
    | { comp_univs; effect_name; result_typ; effect_args; flags;_} -> flags
  
let (uu___is_TOTAL : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | TOTAL  -> true | uu____2385 -> false
  
let (uu___is_MLEFFECT : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | MLEFFECT  -> true | uu____2396 -> false
  
let (uu___is_RETURN : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | RETURN  -> true | uu____2407 -> false
  
let (uu___is_PARTIAL_RETURN : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | PARTIAL_RETURN  -> true | uu____2418 -> false
  
let (uu___is_SOMETRIVIAL : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | SOMETRIVIAL  -> true | uu____2429 -> false
  
let (uu___is_TRIVIAL_POSTCONDITION : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | TRIVIAL_POSTCONDITION  -> true
    | uu____2440 -> false
  
let (uu___is_SHOULD_NOT_INLINE : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | SHOULD_NOT_INLINE  -> true | uu____2451 -> false
  
let (uu___is_LEMMA : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | LEMMA  -> true | uu____2462 -> false
  
let (uu___is_CPS : cflag -> Prims.bool) =
  fun projectee  -> match projectee with | CPS  -> true | uu____2473 -> false 
let (uu___is_DECREASES : cflag -> Prims.bool) =
  fun projectee  ->
    match projectee with | DECREASES _0 -> true | uu____2485 -> false
  
let (__proj__DECREASES__item___0 : cflag -> t) =
  fun projectee  -> match projectee with | DECREASES _0 -> _0 
let (__proj__Mkresidual_comp__item__residual_effect :
  residual_comp -> FStar_Ident.lident) =
  fun projectee  ->
    match projectee with
    | { residual_effect; residual_typ; residual_flags;_} -> residual_effect
  
let (__proj__Mkresidual_comp__item__residual_typ :
  residual_comp -> t FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { residual_effect; residual_typ; residual_flags;_} -> residual_typ
  
let (__proj__Mkresidual_comp__item__residual_flags :
  residual_comp -> cflag Prims.list) =
  fun projectee  ->
    match projectee with
    | { residual_effect; residual_typ; residual_flags;_} -> residual_flags
  
type arg = (t * FStar_Syntax_Syntax.aqual)
type args = (t * FStar_Syntax_Syntax.aqual) Prims.list
type head = t
type annot = t FStar_Pervasives_Native.option
let (isAccu : t -> Prims.bool) =
  fun trm  -> match trm with | Accu uu____2561 -> true | uu____2573 -> false 
let (isNotAccu : t -> Prims.bool) =
  fun x  ->
    match x with | Accu (uu____2583,uu____2584) -> false | uu____2598 -> true
  
let (mkConstruct :
  FStar_Syntax_Syntax.fv ->
    FStar_Syntax_Syntax.universe Prims.list -> args -> t)
  = fun i  -> fun us  -> fun ts  -> Construct (i, us, ts) 
let (mkFV :
  FStar_Syntax_Syntax.fv ->
    FStar_Syntax_Syntax.universe Prims.list -> args -> t)
  = fun i  -> fun us  -> fun ts  -> FV (i, us, ts) 
let (mkAccuVar : var -> t) = fun v1  -> Accu ((Var v1), []) 
let (mkAccuMatch : t -> (unit -> FStar_Syntax_Syntax.branch Prims.list) -> t)
  = fun s  -> fun bs  -> Accu ((Match (s, bs)), []) 
let (equal_if : Prims.bool -> FStar_Syntax_Util.eq_result) =
  fun uu___0_2713  ->
    if uu___0_2713
    then FStar_Syntax_Util.Equal
    else FStar_Syntax_Util.Unknown
  
let (equal_iff : Prims.bool -> FStar_Syntax_Util.eq_result) =
  fun uu___1_2724  ->
    if uu___1_2724
    then FStar_Syntax_Util.Equal
    else FStar_Syntax_Util.NotEqual
  
let (eq_inj :
  FStar_Syntax_Util.eq_result ->
    FStar_Syntax_Util.eq_result -> FStar_Syntax_Util.eq_result)
  =
  fun r1  ->
    fun r2  ->
      match (r1, r2) with
      | (FStar_Syntax_Util.Equal ,FStar_Syntax_Util.Equal ) ->
          FStar_Syntax_Util.Equal
      | (FStar_Syntax_Util.NotEqual ,uu____2740) ->
          FStar_Syntax_Util.NotEqual
      | (uu____2741,FStar_Syntax_Util.NotEqual ) ->
          FStar_Syntax_Util.NotEqual
      | (FStar_Syntax_Util.Unknown ,uu____2742) -> FStar_Syntax_Util.Unknown
      | (uu____2743,FStar_Syntax_Util.Unknown ) -> FStar_Syntax_Util.Unknown
  
let (eq_and :
  FStar_Syntax_Util.eq_result ->
    (unit -> FStar_Syntax_Util.eq_result) -> FStar_Syntax_Util.eq_result)
  =
  fun f  ->
    fun g  ->
      match f with
      | FStar_Syntax_Util.Equal  -> g ()
      | uu____2760 -> FStar_Syntax_Util.Unknown
  
let (eq_constant : constant -> constant -> FStar_Syntax_Util.eq_result) =
  fun c1  ->
    fun c2  ->
      match (c1, c2) with
      | (Unit ,Unit ) -> FStar_Syntax_Util.Equal
      | (Bool b1,Bool b2) -> equal_iff (b1 = b2)
      | (Int i1,Int i2) -> equal_iff (i1 = i2)
      | (String (s1,uu____2780),String (s2,uu____2782)) ->
          equal_iff (s1 = s2)
      | (Char c11,Char c21) -> equal_iff (c11 = c21)
      | (Range r1,Range r2) -> FStar_Syntax_Util.Unknown
      | (uu____2795,uu____2796) -> FStar_Syntax_Util.NotEqual
  
let rec (eq_t : t -> t -> FStar_Syntax_Util.eq_result) =
  fun t1  ->
    fun t2  ->
      match (t1, t2) with
      | (Lam uu____2832,Lam uu____2833) -> FStar_Syntax_Util.Unknown
      | (Accu (a1,as1),Accu (a2,as2)) ->
          let uu____2926 = eq_atom a1 a2  in
          eq_and uu____2926 (fun uu____2928  -> eq_args as1 as2)
      | (Construct (v1,us1,args1),Construct (v2,us2,args2)) ->
          let uu____2967 = FStar_Syntax_Syntax.fv_eq v1 v2  in
          if uu____2967
          then
            (if (FStar_List.length args1) <> (FStar_List.length args2)
             then failwith "eq_t, different number of args on Construct"
             else ();
             (let uu____2983 = FStar_List.zip args1 args2  in
              FStar_All.pipe_left
                (FStar_List.fold_left
                   (fun acc  ->
                      fun uu____3040  ->
                        match uu____3040 with
                        | ((a1,uu____3054),(a2,uu____3056)) ->
                            let uu____3065 = eq_t a1 a2  in
                            eq_inj acc uu____3065) FStar_Syntax_Util.Equal)
                uu____2983))
          else FStar_Syntax_Util.NotEqual
      | (FV (v1,us1,args1),FV (v2,us2,args2)) ->
          let uu____3106 = FStar_Syntax_Syntax.fv_eq v1 v2  in
          if uu____3106
          then
            let uu____3109 =
              let uu____3110 = FStar_Syntax_Util.eq_univs_list us1 us2  in
              equal_iff uu____3110  in
            eq_and uu____3109 (fun uu____3113  -> eq_args args1 args2)
          else FStar_Syntax_Util.Unknown
      | (Constant c1,Constant c2) -> eq_constant c1 c2
      | (Type_t u1,Type_t u2) ->
          let uu____3120 = FStar_Syntax_Util.eq_univs u1 u2  in
          equal_iff uu____3120
      | (Univ u1,Univ u2) ->
          let uu____3124 = FStar_Syntax_Util.eq_univs u1 u2  in
          equal_iff uu____3124
      | (Refinement (r1,t11),Refinement (r2,t21)) ->
          let x =
            FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
              FStar_Syntax_Syntax.t_unit
             in
          let uu____3171 =
            let uu____3172 =
              let uu____3173 = t11 ()  in
              FStar_Pervasives_Native.fst uu____3173  in
            let uu____3178 =
              let uu____3179 = t21 ()  in
              FStar_Pervasives_Native.fst uu____3179  in
            eq_t uu____3172 uu____3178  in
          eq_and uu____3171
            (fun uu____3187  ->
               let uu____3188 =
                 let uu____3189 = mkAccuVar x  in r1 uu____3189  in
               let uu____3190 =
                 let uu____3191 = mkAccuVar x  in r2 uu____3191  in
               eq_t uu____3188 uu____3190)
      | (Unknown ,Unknown ) -> FStar_Syntax_Util.Equal
      | (uu____3192,uu____3193) -> FStar_Syntax_Util.Unknown

and (eq_atom : atom -> atom -> FStar_Syntax_Util.eq_result) =
  fun a1  ->
    fun a2  ->
      match (a1, a2) with
      | (Var bv1,Var bv2) ->
          let uu____3198 = FStar_Syntax_Syntax.bv_eq bv1 bv2  in
          equal_if uu____3198
      | (uu____3200,uu____3201) -> FStar_Syntax_Util.Unknown

and (eq_arg : arg -> arg -> FStar_Syntax_Util.eq_result) =
  fun a1  ->
    fun a2  ->
      eq_t (FStar_Pervasives_Native.fst a1) (FStar_Pervasives_Native.fst a2)

and (eq_args : args -> args -> FStar_Syntax_Util.eq_result) =
  fun as1  ->
    fun as2  ->
      match (as1, as2) with
      | ([],[]) -> FStar_Syntax_Util.Equal
      | (x::xs,y::ys) ->
          let uu____3282 = eq_arg x y  in
          eq_and uu____3282 (fun uu____3284  -> eq_args xs ys)
      | (uu____3285,uu____3286) -> FStar_Syntax_Util.Unknown

let (constant_to_string : constant -> Prims.string) =
  fun c  ->
    match c with
    | Unit  -> "Unit"
    | Bool b -> if b then "Bool true" else "Bool false"
    | Int i -> FStar_BigInt.string_of_big_int i
    | Char c1 -> FStar_Util.format1 "'%s'" (FStar_Util.string_of_char c1)
    | String (s,uu____3333) -> FStar_Util.format1 "\"%s\"" s
    | Range r ->
        let uu____3338 = FStar_Range.string_of_range r  in
        FStar_Util.format1 "Range %s" uu____3338
    | SConst s -> FStar_Syntax_Print.const_to_string s
  
let rec (t_to_string : t -> Prims.string) =
  fun x  ->
    match x with
    | Lam (b,uu____3356,arity) ->
        let uu____3410 = FStar_Util.string_of_int arity  in
        FStar_Util.format1 "Lam (_, %s args)" uu____3410
    | Accu (a,l) ->
        let uu____3427 =
          let uu____3429 = atom_to_string a  in
          let uu____3431 =
            let uu____3433 =
              let uu____3435 =
                let uu____3437 =
                  FStar_List.map
                    (fun x1  -> t_to_string (FStar_Pervasives_Native.fst x1))
                    l
                   in
                FStar_String.concat "; " uu____3437  in
              FStar_String.op_Hat uu____3435 ")"  in
            FStar_String.op_Hat ") (" uu____3433  in
          FStar_String.op_Hat uu____3429 uu____3431  in
        FStar_String.op_Hat "Accu (" uu____3427
    | Construct (fv,us,l) ->
        let uu____3475 =
          let uu____3477 = FStar_Syntax_Print.fv_to_string fv  in
          let uu____3479 =
            let uu____3481 =
              let uu____3483 =
                let uu____3485 =
                  FStar_List.map FStar_Syntax_Print.univ_to_string us  in
                FStar_String.concat "; " uu____3485  in
              let uu____3491 =
                let uu____3493 =
                  let uu____3495 =
                    let uu____3497 =
                      FStar_List.map
                        (fun x1  ->
                           t_to_string (FStar_Pervasives_Native.fst x1)) l
                       in
                    FStar_String.concat "; " uu____3497  in
                  FStar_String.op_Hat uu____3495 "]"  in
                FStar_String.op_Hat "] [" uu____3493  in
              FStar_String.op_Hat uu____3483 uu____3491  in
            FStar_String.op_Hat ") [" uu____3481  in
          FStar_String.op_Hat uu____3477 uu____3479  in
        FStar_String.op_Hat "Construct (" uu____3475
    | FV (fv,us,l) ->
        let uu____3536 =
          let uu____3538 = FStar_Syntax_Print.fv_to_string fv  in
          let uu____3540 =
            let uu____3542 =
              let uu____3544 =
                let uu____3546 =
                  FStar_List.map FStar_Syntax_Print.univ_to_string us  in
                FStar_String.concat "; " uu____3546  in
              let uu____3552 =
                let uu____3554 =
                  let uu____3556 =
                    let uu____3558 =
                      FStar_List.map
                        (fun x1  ->
                           t_to_string (FStar_Pervasives_Native.fst x1)) l
                       in
                    FStar_String.concat "; " uu____3558  in
                  FStar_String.op_Hat uu____3556 "]"  in
                FStar_String.op_Hat "] [" uu____3554  in
              FStar_String.op_Hat uu____3544 uu____3552  in
            FStar_String.op_Hat ") [" uu____3542  in
          FStar_String.op_Hat uu____3538 uu____3540  in
        FStar_String.op_Hat "FV (" uu____3536
    | Constant c -> constant_to_string c
    | Univ u ->
        let uu____3580 = FStar_Syntax_Print.univ_to_string u  in
        FStar_String.op_Hat "Universe " uu____3580
    | Type_t u ->
        let uu____3584 = FStar_Syntax_Print.univ_to_string u  in
        FStar_String.op_Hat "Type_t " uu____3584
    | Arrow uu____3587 -> "Arrow"
    | Refinement (f,t) ->
        let x1 =
          FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
            FStar_Syntax_Syntax.t_unit
           in
        let t1 =
          let uu____3629 = t ()  in FStar_Pervasives_Native.fst uu____3629
           in
        let uu____3634 =
          let uu____3636 = FStar_Syntax_Print.bv_to_string x1  in
          let uu____3638 =
            let uu____3640 =
              let uu____3642 = t_to_string t1  in
              let uu____3644 =
                let uu____3646 =
                  let uu____3648 =
                    let uu____3650 =
                      let uu____3651 = mkAccuVar x1  in f uu____3651  in
                    t_to_string uu____3650  in
                  FStar_String.op_Hat uu____3648 "}"  in
                FStar_String.op_Hat "{" uu____3646  in
              FStar_String.op_Hat uu____3642 uu____3644  in
            FStar_String.op_Hat ":" uu____3640  in
          FStar_String.op_Hat uu____3636 uu____3638  in
        FStar_String.op_Hat "Refinement " uu____3634
    | Unknown  -> "Unknown"
    | Reflect t ->
        let uu____3658 = t_to_string t  in
        FStar_String.op_Hat "Reflect " uu____3658
    | Quote uu____3661 -> "Quote _"
    | Lazy (FStar_Util.Inl li,uu____3668) ->
        let uu____3685 =
          let uu____3687 = FStar_Syntax_Util.unfold_lazy li  in
          FStar_Syntax_Print.term_to_string uu____3687  in
        FStar_Util.format1 "Lazy (Inl {%s})" uu____3685
    | Lazy (FStar_Util.Inr (uu____3689,et),uu____3691) ->
        let uu____3708 = FStar_Syntax_Print.emb_typ_to_string et  in
        FStar_Util.format1 "Lazy (Inr (?, %s))" uu____3708
    | LocalLetRec
        (uu____3711,l,uu____3713,uu____3714,uu____3715,uu____3716,uu____3717)
        ->
        let uu____3748 =
          let uu____3750 = FStar_Syntax_Print.lbs_to_string [] (true, [l])
             in
          FStar_String.op_Hat uu____3750 ")"  in
        FStar_String.op_Hat "LocalLetRec (" uu____3748
    | TopLevelLet (lb,uu____3759,uu____3760) ->
        let uu____3775 =
          let uu____3777 =
            let uu____3779 = FStar_Util.right lb.FStar_Syntax_Syntax.lbname
               in
            FStar_Syntax_Print.fv_to_string uu____3779  in
          FStar_String.op_Hat uu____3777 ")"  in
        FStar_String.op_Hat "TopLevelLet (" uu____3775
    | TopLevelRec (lb,uu____3783,uu____3784,uu____3785) ->
        let uu____3806 =
          let uu____3808 =
            let uu____3810 = FStar_Util.right lb.FStar_Syntax_Syntax.lbname
               in
            FStar_Syntax_Print.fv_to_string uu____3810  in
          FStar_String.op_Hat uu____3808 ")"  in
        FStar_String.op_Hat "TopLevelRec (" uu____3806

and (atom_to_string : atom -> Prims.string) =
  fun a  ->
    match a with
    | Var v1 ->
        let uu____3816 = FStar_Syntax_Print.bv_to_string v1  in
        FStar_String.op_Hat "Var " uu____3816
    | Match (t,uu____3820) ->
        let uu____3831 = t_to_string t  in
        FStar_String.op_Hat "Match " uu____3831
    | UnreducedLet (var,typ,def,body,lb) ->
        let uu____3851 =
          let uu____3853 = FStar_Syntax_Print.lbs_to_string [] (false, [lb])
             in
          FStar_String.op_Hat uu____3853 " in ...)"  in
        FStar_String.op_Hat "UnreducedLet(" uu____3851
    | UnreducedLetRec (uu____3861,body,lbs) ->
        let uu____3884 =
          let uu____3886 = FStar_Syntax_Print.lbs_to_string [] (true, lbs)
             in
          let uu____3892 =
            let uu____3894 =
              let uu____3896 = t_to_string body  in
              FStar_String.op_Hat uu____3896 ")"  in
            FStar_String.op_Hat " in " uu____3894  in
          FStar_String.op_Hat uu____3886 uu____3892  in
        FStar_String.op_Hat "UnreducedLetRec(" uu____3884
    | UVar uu____3901 -> "UVar"

let (arg_to_string : arg -> Prims.string) =
  fun a  ->
    let uu____3912 = FStar_All.pipe_right a FStar_Pervasives_Native.fst  in
    FStar_All.pipe_right uu____3912 t_to_string
  
let (args_to_string : args -> Prims.string) =
  fun args  ->
    let uu____3925 = FStar_All.pipe_right args (FStar_List.map arg_to_string)
       in
    FStar_All.pipe_right uu____3925 (FStar_String.concat " ")
  
type nbe_cbs =
  {
  iapp: t -> args -> t ;
  translate: FStar_Syntax_Syntax.term -> t }
let (__proj__Mknbe_cbs__item__iapp : nbe_cbs -> t -> args -> t) =
  fun projectee  -> match projectee with | { iapp; translate;_} -> iapp 
let (__proj__Mknbe_cbs__item__translate :
  nbe_cbs -> FStar_Syntax_Syntax.term -> t) =
  fun projectee  -> match projectee with | { iapp; translate;_} -> translate 
let (iapp_cb : nbe_cbs -> t -> args -> t) =
  fun cbs  -> fun h  -> fun a  -> cbs.iapp h a 
let (translate_cb : nbe_cbs -> FStar_Syntax_Syntax.term -> t) =
  fun cbs  -> fun t  -> cbs.translate t 
type 'a embedding =
  {
  em: nbe_cbs -> 'a -> t ;
  un: nbe_cbs -> t -> 'a FStar_Pervasives_Native.option ;
  typ: t ;
  emb_typ: FStar_Syntax_Syntax.emb_typ }
let __proj__Mkembedding__item__em : 'a . 'a embedding -> nbe_cbs -> 'a -> t =
  fun projectee  -> match projectee with | { em; un; typ; emb_typ;_} -> em 
let __proj__Mkembedding__item__un :
  'a . 'a embedding -> nbe_cbs -> t -> 'a FStar_Pervasives_Native.option =
  fun projectee  -> match projectee with | { em; un; typ; emb_typ;_} -> un 
let __proj__Mkembedding__item__typ : 'a . 'a embedding -> t =
  fun projectee  -> match projectee with | { em; un; typ; emb_typ;_} -> typ 
let __proj__Mkembedding__item__emb_typ :
  'a . 'a embedding -> FStar_Syntax_Syntax.emb_typ =
  fun projectee  ->
    match projectee with | { em; un; typ; emb_typ;_} -> emb_typ
  
let embed : 'a . 'a embedding -> nbe_cbs -> 'a -> t =
  fun e  -> fun cb  -> fun x  -> e.em cb x 
let unembed :
  'a . 'a embedding -> nbe_cbs -> t -> 'a FStar_Pervasives_Native.option =
  fun e  -> fun cb  -> fun trm  -> e.un cb trm 
let type_of : 'a . 'a embedding -> t = fun e  -> e.typ 
let mk_emb :
  'a .
    (nbe_cbs -> 'a -> t) ->
      (nbe_cbs -> t -> 'a FStar_Pervasives_Native.option) ->
        t -> FStar_Syntax_Syntax.emb_typ -> 'a embedding
  =
  fun em  -> fun un  -> fun typ  -> fun et  -> { em; un; typ; emb_typ = et } 
let (lid_as_constr :
  FStar_Ident.lident -> FStar_Syntax_Syntax.universe Prims.list -> args -> t)
  =
  fun l  ->
    fun us  ->
      fun args  ->
        let uu____4396 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.delta_constant
            (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor)
           in
        mkConstruct uu____4396 us args
  
let (lid_as_typ :
  FStar_Ident.lident -> FStar_Syntax_Syntax.universe Prims.list -> args -> t)
  =
  fun l  ->
    fun us  ->
      fun args  ->
        let uu____4417 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.delta_constant
            FStar_Pervasives_Native.None
           in
        mkFV uu____4417 us args
  
let (as_iarg : t -> arg) =
  fun a  -> (a, (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.imp_tag)) 
let (as_arg : t -> arg) = fun a  -> (a, FStar_Pervasives_Native.None) 
let (make_arrow1 : t -> arg -> t) =
  fun t1  ->
    fun a  ->
      Arrow (FStar_Util.Inr ([a], (Tot (t1, FStar_Pervasives_Native.None))))
  
let lazy_embed : 'a . FStar_Syntax_Syntax.emb_typ -> 'a -> (unit -> t) -> t =
  fun et  ->
    fun x  ->
      fun f  ->
        (let uu____4500 = FStar_ST.op_Bang FStar_Options.debug_embedding  in
         if uu____4500
         then
           let uu____4524 = FStar_Syntax_Print.emb_typ_to_string et  in
           FStar_Util.print1 "Embedding\n\temb_typ=%s\n" uu____4524
         else ());
        (let uu____4529 = FStar_ST.op_Bang FStar_Options.eager_embedding  in
         if uu____4529
         then f ()
         else
           (let thunk1 = FStar_Thunk.mk f  in
            let li = let uu____4563 = FStar_Dyn.mkdyn x  in (uu____4563, et)
               in
            Lazy ((FStar_Util.Inr li), thunk1)))
  
let lazy_unembed :
  'Auu____4591 'a .
    'Auu____4591 ->
      FStar_Syntax_Syntax.emb_typ ->
        t ->
          (t -> 'a FStar_Pervasives_Native.option) ->
            'a FStar_Pervasives_Native.option
  =
  fun cb  ->
    fun et  ->
      fun x  ->
        fun f  ->
          match x with
          | Lazy (FStar_Util.Inl li,thunk1) ->
              let uu____4642 = FStar_Thunk.force thunk1  in f uu____4642
          | Lazy (FStar_Util.Inr (b,et'),thunk1) ->
              let uu____4662 =
                (et <> et') ||
                  (FStar_ST.op_Bang FStar_Options.eager_embedding)
                 in
              if uu____4662
              then
                let res =
                  let uu____4691 = FStar_Thunk.force thunk1  in f uu____4691
                   in
                ((let uu____4693 =
                    FStar_ST.op_Bang FStar_Options.debug_embedding  in
                  if uu____4693
                  then
                    let uu____4717 = FStar_Syntax_Print.emb_typ_to_string et
                       in
                    let uu____4719 = FStar_Syntax_Print.emb_typ_to_string et'
                       in
                    FStar_Util.print2
                      "Unembed cancellation failed\n\t%s <> %s\n" uu____4717
                      uu____4719
                  else ());
                 res)
              else
                (let a = FStar_Dyn.undyn b  in
                 (let uu____4728 =
                    FStar_ST.op_Bang FStar_Options.debug_embedding  in
                  if uu____4728
                  then
                    let uu____4752 = FStar_Syntax_Print.emb_typ_to_string et
                       in
                    FStar_Util.print1 "Unembed cancelled for %s\n" uu____4752
                  else ());
                 FStar_Pervasives_Native.Some a)
          | uu____4757 ->
              let aopt = f x  in
              ((let uu____4762 =
                  FStar_ST.op_Bang FStar_Options.debug_embedding  in
                if uu____4762
                then
                  let uu____4786 = FStar_Syntax_Print.emb_typ_to_string et
                     in
                  FStar_Util.print1 "Unembedding:\n\temb_typ=%s\n" uu____4786
                else ());
               aopt)
  
let (mk_any_emb : t -> t embedding) =
  fun ty  ->
    let em _cb a = a  in
    let un _cb t = FStar_Pervasives_Native.Some t  in
    mk_emb em un ty FStar_Syntax_Syntax.ET_abstract
  
let (e_any : t embedding) =
  let em _cb a = a  in
  let un _cb t = FStar_Pervasives_Native.Some t  in
  let uu____4854 = lid_as_typ FStar_Parser_Const.term_lid [] []  in
  mk_emb em un uu____4854 FStar_Syntax_Syntax.ET_abstract 
let (e_unit : unit embedding) =
  let em _cb a = Constant Unit  in
  let un _cb t = FStar_Pervasives_Native.Some ()  in
  let uu____4888 = lid_as_typ FStar_Parser_Const.unit_lid [] []  in
  let uu____4893 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_unit  in
  mk_emb em un uu____4888 uu____4893 
let (e_bool : Prims.bool embedding) =
  let em _cb a = Constant (Bool a)  in
  let un _cb t =
    match t with
    | Constant (Bool a) -> FStar_Pervasives_Native.Some a
    | uu____4934 -> FStar_Pervasives_Native.None  in
  let uu____4936 = lid_as_typ FStar_Parser_Const.bool_lid [] []  in
  let uu____4941 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_unit  in
  mk_emb em un uu____4936 uu____4941 
let (e_char : FStar_Char.char embedding) =
  let em _cb c = Constant (Char c)  in
  let un _cb c =
    match c with
    | Constant (Char a) -> FStar_Pervasives_Native.Some a
    | uu____4983 -> FStar_Pervasives_Native.None  in
  let uu____4985 = lid_as_typ FStar_Parser_Const.char_lid [] []  in
  let uu____4990 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_char  in
  mk_emb em un uu____4985 uu____4990 
let (e_string : Prims.string embedding) =
  let em _cb s = Constant (String (s, FStar_Range.dummyRange))  in
  let un _cb s =
    match s with
    | Constant (String (s1,uu____5032)) -> FStar_Pervasives_Native.Some s1
    | uu____5036 -> FStar_Pervasives_Native.None  in
  let uu____5038 = lid_as_typ FStar_Parser_Const.string_lid [] []  in
  let uu____5043 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_string  in
  mk_emb em un uu____5038 uu____5043 
let (e_int : FStar_BigInt.t embedding) =
  let em _cb c = Constant (Int c)  in
  let un _cb c =
    match c with
    | Constant (Int a) -> FStar_Pervasives_Native.Some a
    | uu____5078 -> FStar_Pervasives_Native.None  in
  let uu____5079 = lid_as_typ FStar_Parser_Const.int_lid [] []  in
  let uu____5084 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_int  in
  mk_emb em un uu____5079 uu____5084 
let e_option :
  'a . 'a embedding -> 'a FStar_Pervasives_Native.option embedding =
  fun ea  ->
    let etyp =
      let uu____5105 =
        let uu____5113 =
          FStar_All.pipe_right FStar_Parser_Const.option_lid
            FStar_Ident.string_of_lid
           in
        (uu____5113, [ea.emb_typ])  in
      FStar_Syntax_Syntax.ET_app uu____5105  in
    let em cb o =
      lazy_embed etyp o
        (fun uu____5138  ->
           match o with
           | FStar_Pervasives_Native.None  ->
               let uu____5139 =
                 let uu____5140 =
                   let uu____5145 = type_of ea  in as_iarg uu____5145  in
                 [uu____5140]  in
               lid_as_constr FStar_Parser_Const.none_lid
                 [FStar_Syntax_Syntax.U_zero] uu____5139
           | FStar_Pervasives_Native.Some x ->
               let uu____5155 =
                 let uu____5156 =
                   let uu____5161 = embed ea cb x  in as_arg uu____5161  in
                 let uu____5162 =
                   let uu____5169 =
                     let uu____5174 = type_of ea  in as_iarg uu____5174  in
                   [uu____5169]  in
                 uu____5156 :: uu____5162  in
               lid_as_constr FStar_Parser_Const.some_lid
                 [FStar_Syntax_Syntax.U_zero] uu____5155)
       in
    let un cb trm =
      lazy_unembed cb etyp trm
        (fun trm1  ->
           match trm1 with
           | Construct (fvar1,us,args) when
               FStar_Syntax_Syntax.fv_eq_lid fvar1
                 FStar_Parser_Const.none_lid
               -> FStar_Pervasives_Native.Some FStar_Pervasives_Native.None
           | Construct (fvar1,us,(a,uu____5241)::uu____5242::[]) when
               FStar_Syntax_Syntax.fv_eq_lid fvar1
                 FStar_Parser_Const.some_lid
               ->
               let uu____5269 = unembed ea cb a  in
               FStar_Util.bind_opt uu____5269
                 (fun a1  ->
                    FStar_Pervasives_Native.Some
                      (FStar_Pervasives_Native.Some a1))
           | uu____5278 -> FStar_Pervasives_Native.None)
       in
    let uu____5281 =
      let uu____5282 =
        let uu____5283 = let uu____5288 = type_of ea  in as_arg uu____5288
           in
        [uu____5283]  in
      lid_as_typ FStar_Parser_Const.option_lid [FStar_Syntax_Syntax.U_zero]
        uu____5282
       in
    mk_emb em un uu____5281 etyp
  
let e_tuple2 : 'a 'b . 'a embedding -> 'b embedding -> ('a * 'b) embedding =
  fun ea  ->
    fun eb  ->
      let etyp =
        let uu____5335 =
          let uu____5343 =
            FStar_All.pipe_right FStar_Parser_Const.lid_tuple2
              FStar_Ident.string_of_lid
             in
          (uu____5343, [ea.emb_typ; eb.emb_typ])  in
        FStar_Syntax_Syntax.ET_app uu____5335  in
      let em cb x =
        lazy_embed etyp x
          (fun uu____5374  ->
             let uu____5375 =
               let uu____5376 =
                 let uu____5381 = embed eb cb (FStar_Pervasives_Native.snd x)
                    in
                 as_arg uu____5381  in
               let uu____5382 =
                 let uu____5389 =
                   let uu____5394 =
                     embed ea cb (FStar_Pervasives_Native.fst x)  in
                   as_arg uu____5394  in
                 let uu____5395 =
                   let uu____5402 =
                     let uu____5407 = type_of eb  in as_iarg uu____5407  in
                   let uu____5408 =
                     let uu____5415 =
                       let uu____5420 = type_of ea  in as_iarg uu____5420  in
                     [uu____5415]  in
                   uu____5402 :: uu____5408  in
                 uu____5389 :: uu____5395  in
               uu____5376 :: uu____5382  in
             lid_as_constr FStar_Parser_Const.lid_Mktuple2
               [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero]
               uu____5375)
         in
      let un cb trm =
        lazy_unembed cb etyp trm
          (fun trm1  ->
             match trm1 with
             | Construct
                 (fvar1,us,(b,uu____5488)::(a,uu____5490)::uu____5491::uu____5492::[])
                 when
                 FStar_Syntax_Syntax.fv_eq_lid fvar1
                   FStar_Parser_Const.lid_Mktuple2
                 ->
                 let uu____5531 = unembed ea cb a  in
                 FStar_Util.bind_opt uu____5531
                   (fun a1  ->
                      let uu____5541 = unembed eb cb b  in
                      FStar_Util.bind_opt uu____5541
                        (fun b1  -> FStar_Pervasives_Native.Some (a1, b1)))
             | uu____5554 -> FStar_Pervasives_Native.None)
         in
      let uu____5559 =
        let uu____5560 =
          let uu____5561 = let uu____5566 = type_of eb  in as_arg uu____5566
             in
          let uu____5567 =
            let uu____5574 =
              let uu____5579 = type_of ea  in as_arg uu____5579  in
            [uu____5574]  in
          uu____5561 :: uu____5567  in
        lid_as_typ FStar_Parser_Const.lid_tuple2
          [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero] uu____5560
         in
      mk_emb em un uu____5559 etyp
  
let e_either :
  'a 'b . 'a embedding -> 'b embedding -> ('a,'b) FStar_Util.either embedding
  =
  fun ea  ->
    fun eb  ->
      let etyp =
        let uu____5632 =
          let uu____5640 =
            FStar_All.pipe_right FStar_Parser_Const.either_lid
              FStar_Ident.string_of_lid
             in
          (uu____5640, [ea.emb_typ; eb.emb_typ])  in
        FStar_Syntax_Syntax.ET_app uu____5632  in
      let em cb s =
        lazy_embed etyp s
          (fun uu____5672  ->
             match s with
             | FStar_Util.Inl a ->
                 let uu____5674 =
                   let uu____5675 =
                     let uu____5680 = embed ea cb a  in as_arg uu____5680  in
                   let uu____5681 =
                     let uu____5688 =
                       let uu____5693 = type_of eb  in as_iarg uu____5693  in
                     let uu____5694 =
                       let uu____5701 =
                         let uu____5706 = type_of ea  in as_iarg uu____5706
                          in
                       [uu____5701]  in
                     uu____5688 :: uu____5694  in
                   uu____5675 :: uu____5681  in
                 lid_as_constr FStar_Parser_Const.inl_lid
                   [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero]
                   uu____5674
             | FStar_Util.Inr b ->
                 let uu____5724 =
                   let uu____5725 =
                     let uu____5730 = embed eb cb b  in as_arg uu____5730  in
                   let uu____5731 =
                     let uu____5738 =
                       let uu____5743 = type_of eb  in as_iarg uu____5743  in
                     let uu____5744 =
                       let uu____5751 =
                         let uu____5756 = type_of ea  in as_iarg uu____5756
                          in
                       [uu____5751]  in
                     uu____5738 :: uu____5744  in
                   uu____5725 :: uu____5731  in
                 lid_as_constr FStar_Parser_Const.inr_lid
                   [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero]
                   uu____5724)
         in
      let un cb trm =
        lazy_unembed cb etyp trm
          (fun trm1  ->
             match trm1 with
             | Construct
                 (fvar1,us,(a,uu____5818)::uu____5819::uu____5820::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fvar1
                   FStar_Parser_Const.inl_lid
                 ->
                 let uu____5855 = unembed ea cb a  in
                 FStar_Util.bind_opt uu____5855
                   (fun a1  ->
                      FStar_Pervasives_Native.Some (FStar_Util.Inl a1))
             | Construct
                 (fvar1,us,(b,uu____5871)::uu____5872::uu____5873::[]) when
                 FStar_Syntax_Syntax.fv_eq_lid fvar1
                   FStar_Parser_Const.inr_lid
                 ->
                 let uu____5908 = unembed eb cb b  in
                 FStar_Util.bind_opt uu____5908
                   (fun b1  ->
                      FStar_Pervasives_Native.Some (FStar_Util.Inr b1))
             | uu____5921 -> FStar_Pervasives_Native.None)
         in
      let uu____5926 =
        let uu____5927 =
          let uu____5928 = let uu____5933 = type_of eb  in as_arg uu____5933
             in
          let uu____5934 =
            let uu____5941 =
              let uu____5946 = type_of ea  in as_arg uu____5946  in
            [uu____5941]  in
          uu____5928 :: uu____5934  in
        lid_as_typ FStar_Parser_Const.either_lid
          [FStar_Syntax_Syntax.U_zero; FStar_Syntax_Syntax.U_zero] uu____5927
         in
      mk_emb em un uu____5926 etyp
  
let (e_range : FStar_Range.range embedding) =
  let em cb r = Constant (Range r)  in
  let un cb t =
    match t with
    | Constant (Range r) -> FStar_Pervasives_Native.Some r
    | uu____5995 -> FStar_Pervasives_Native.None  in
  let uu____5996 = lid_as_typ FStar_Parser_Const.range_lid [] []  in
  let uu____6001 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_range  in
  mk_emb em un uu____5996 uu____6001 
let e_list : 'a . 'a embedding -> 'a Prims.list embedding =
  fun ea  ->
    let etyp =
      let uu____6022 =
        let uu____6030 =
          FStar_All.pipe_right FStar_Parser_Const.list_lid
            FStar_Ident.string_of_lid
           in
        (uu____6030, [ea.emb_typ])  in
      FStar_Syntax_Syntax.ET_app uu____6022  in
    let em cb l =
      lazy_embed etyp l
        (fun uu____6057  ->
           let typ = let uu____6059 = type_of ea  in as_iarg uu____6059  in
           let nil =
             lid_as_constr FStar_Parser_Const.nil_lid
               [FStar_Syntax_Syntax.U_zero] [typ]
              in
           let cons1 hd1 tl1 =
             let uu____6080 =
               let uu____6081 = as_arg tl1  in
               let uu____6086 =
                 let uu____6093 =
                   let uu____6098 = embed ea cb hd1  in as_arg uu____6098  in
                 [uu____6093; typ]  in
               uu____6081 :: uu____6086  in
             lid_as_constr FStar_Parser_Const.cons_lid
               [FStar_Syntax_Syntax.U_zero] uu____6080
              in
           FStar_List.fold_right cons1 l nil)
       in
    let rec un cb trm =
      lazy_unembed cb etyp trm
        (fun trm1  ->
           match trm1 with
           | Construct (fv,uu____6146,uu____6147) when
               FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nil_lid ->
               FStar_Pervasives_Native.Some []
           | Construct
               (fv,uu____6167,(tl1,FStar_Pervasives_Native.None )::(hd1,FStar_Pervasives_Native.None
                                                                    )::
                (uu____6170,FStar_Pervasives_Native.Some
                 (FStar_Syntax_Syntax.Implicit uu____6171))::[])
               when
               FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid
               ->
               let uu____6199 = unembed ea cb hd1  in
               FStar_Util.bind_opt uu____6199
                 (fun hd2  ->
                    let uu____6207 = un cb tl1  in
                    FStar_Util.bind_opt uu____6207
                      (fun tl2  -> FStar_Pervasives_Native.Some (hd2 :: tl2)))
           | Construct
               (fv,uu____6223,(tl1,FStar_Pervasives_Native.None )::(hd1,FStar_Pervasives_Native.None
                                                                    )::[])
               when
               FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid
               ->
               let uu____6248 = unembed ea cb hd1  in
               FStar_Util.bind_opt uu____6248
                 (fun hd2  ->
                    let uu____6256 = un cb tl1  in
                    FStar_Util.bind_opt uu____6256
                      (fun tl2  -> FStar_Pervasives_Native.Some (hd2 :: tl2)))
           | uu____6271 -> FStar_Pervasives_Native.None)
       in
    let uu____6274 =
      let uu____6275 =
        let uu____6276 = let uu____6281 = type_of ea  in as_arg uu____6281
           in
        [uu____6276]  in
      lid_as_typ FStar_Parser_Const.list_lid [FStar_Syntax_Syntax.U_zero]
        uu____6275
       in
    mk_emb em un uu____6274 etyp
  
let (e_string_list : Prims.string Prims.list embedding) = e_list e_string 
let e_arrow : 'a 'b . 'a embedding -> 'b embedding -> ('a -> 'b) embedding =
  fun ea  ->
    fun eb  ->
      let etyp = FStar_Syntax_Syntax.ET_fun ((ea.emb_typ), (eb.emb_typ))  in
      let em cb f =
        lazy_embed etyp f
          (fun uu____6355  ->
             let uu____6356 =
               let uu____6389 =
                 let uu____6410 =
                   let uu____6417 =
                     let uu____6422 = type_of eb  in as_arg uu____6422  in
                   [uu____6417]  in
                 FStar_Util.Inr uu____6410  in
               ((fun tas  ->
                   let uu____6480 =
                     let uu____6483 = FStar_List.hd tas  in
                     unembed ea cb uu____6483  in
                   match uu____6480 with
                   | FStar_Pervasives_Native.Some a ->
                       let uu____6485 = f a  in embed eb cb uu____6485
                   | FStar_Pervasives_Native.None  ->
                       failwith "cannot unembed function argument"),
                 uu____6389, Prims.int_one)
                in
             Lam uu____6356)
         in
      let un cb lam =
        let k lam1 =
          FStar_Pervasives_Native.Some
            (fun x  ->
               let uu____6532 =
                 let uu____6535 =
                   let uu____6536 =
                     let uu____6537 =
                       let uu____6542 = embed ea cb x  in as_arg uu____6542
                        in
                     [uu____6537]  in
                   cb.iapp lam1 uu____6536  in
                 unembed eb cb uu____6535  in
               match uu____6532 with
               | FStar_Pervasives_Native.Some y -> y
               | FStar_Pervasives_Native.None  ->
                   failwith "cannot unembed function result")
           in
        lazy_unembed cb etyp lam k  in
      let uu____6556 =
        let uu____6557 = type_of ea  in
        let uu____6558 = let uu____6559 = type_of eb  in as_iarg uu____6559
           in
        make_arrow1 uu____6557 uu____6558  in
      mk_emb em un uu____6556 etyp
  
let (e_norm_step : FStar_Syntax_Embeddings.norm_step embedding) =
  let em cb n1 =
    match n1 with
    | FStar_Syntax_Embeddings.Simpl  ->
        let uu____6577 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_simpl
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6577 [] []
    | FStar_Syntax_Embeddings.Weak  ->
        let uu____6582 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_weak
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6582 [] []
    | FStar_Syntax_Embeddings.HNF  ->
        let uu____6587 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_hnf
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6587 [] []
    | FStar_Syntax_Embeddings.Primops  ->
        let uu____6592 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_primops
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6592 [] []
    | FStar_Syntax_Embeddings.Delta  ->
        let uu____6597 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_delta
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6597 [] []
    | FStar_Syntax_Embeddings.Zeta  ->
        let uu____6602 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_zeta
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6602 [] []
    | FStar_Syntax_Embeddings.Iota  ->
        let uu____6607 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_iota
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6607 [] []
    | FStar_Syntax_Embeddings.Reify  ->
        let uu____6612 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_reify
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6612 [] []
    | FStar_Syntax_Embeddings.NBE  ->
        let uu____6617 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_nbe
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        mkFV uu____6617 [] []
    | FStar_Syntax_Embeddings.UnfoldOnly l ->
        let uu____6626 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_unfoldonly
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        let uu____6627 =
          let uu____6628 =
            let uu____6633 =
              let uu____6634 = e_list e_string  in embed uu____6634 cb l  in
            as_arg uu____6633  in
          [uu____6628]  in
        mkFV uu____6626 [] uu____6627
    | FStar_Syntax_Embeddings.UnfoldFully l ->
        let uu____6656 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_unfoldfully
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        let uu____6657 =
          let uu____6658 =
            let uu____6663 =
              let uu____6664 = e_list e_string  in embed uu____6664 cb l  in
            as_arg uu____6663  in
          [uu____6658]  in
        mkFV uu____6656 [] uu____6657
    | FStar_Syntax_Embeddings.UnfoldAttr l ->
        let uu____6686 =
          FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.steps_unfoldattr
            FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
           in
        let uu____6687 =
          let uu____6688 =
            let uu____6693 =
              let uu____6694 = e_list e_string  in embed uu____6694 cb l  in
            as_arg uu____6693  in
          [uu____6688]  in
        mkFV uu____6686 [] uu____6687
     in
  let un cb t0 =
    match t0 with
    | FV (fv,uu____6728,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_simpl ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Simpl
    | FV (fv,uu____6744,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_weak ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Weak
    | FV (fv,uu____6760,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_hnf ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.HNF
    | FV (fv,uu____6776,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_primops ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Primops
    | FV (fv,uu____6792,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_delta ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Delta
    | FV (fv,uu____6808,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_zeta ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Zeta
    | FV (fv,uu____6824,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_iota ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Iota
    | FV (fv,uu____6840,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_nbe ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.NBE
    | FV (fv,uu____6856,[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_reify ->
        FStar_Pervasives_Native.Some FStar_Syntax_Embeddings.Reify
    | FV (fv,uu____6872,(l,uu____6874)::[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_unfoldonly
        ->
        let uu____6893 =
          let uu____6899 = e_list e_string  in unembed uu____6899 cb l  in
        FStar_Util.bind_opt uu____6893
          (fun ss  ->
             FStar_All.pipe_left
               (fun _6919  -> FStar_Pervasives_Native.Some _6919)
               (FStar_Syntax_Embeddings.UnfoldOnly ss))
    | FV (fv,uu____6921,(l,uu____6923)::[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_unfoldfully
        ->
        let uu____6942 =
          let uu____6948 = e_list e_string  in unembed uu____6948 cb l  in
        FStar_Util.bind_opt uu____6942
          (fun ss  ->
             FStar_All.pipe_left
               (fun _6968  -> FStar_Pervasives_Native.Some _6968)
               (FStar_Syntax_Embeddings.UnfoldFully ss))
    | FV (fv,uu____6970,(l,uu____6972)::[]) when
        FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.steps_unfoldattr
        ->
        let uu____6991 =
          let uu____6997 = e_list e_string  in unembed uu____6997 cb l  in
        FStar_Util.bind_opt uu____6991
          (fun ss  ->
             FStar_All.pipe_left
               (fun _7017  -> FStar_Pervasives_Native.Some _7017)
               (FStar_Syntax_Embeddings.UnfoldAttr ss))
    | uu____7018 ->
        ((let uu____7020 =
            let uu____7026 =
              let uu____7028 = t_to_string t0  in
              FStar_Util.format1 "Not an embedded norm_step: %s" uu____7028
               in
            (FStar_Errors.Warning_NotEmbedded, uu____7026)  in
          FStar_Errors.log_issue FStar_Range.dummyRange uu____7020);
         FStar_Pervasives_Native.None)
     in
  let uu____7032 =
    let uu____7033 =
      FStar_Syntax_Syntax.lid_as_fv FStar_Parser_Const.norm_step_lid
        FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None
       in
    mkFV uu____7033 [] []  in
  let uu____7038 =
    FStar_Syntax_Embeddings.emb_typ_of FStar_Syntax_Embeddings.e_norm_step
     in
  mk_emb em un uu____7032 uu____7038 
let (bogus_cbs : nbe_cbs) =
  {
    iapp = (fun h  -> fun _args  -> h);
    translate = (fun uu____7047  -> failwith "bogus_cbs translate")
  } 
let (arg_as_int : arg -> FStar_BigInt.t FStar_Pervasives_Native.option) =
  fun a  ->
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (unembed e_int bogus_cbs)
  
let (arg_as_bool : arg -> Prims.bool FStar_Pervasives_Native.option) =
  fun a  ->
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (unembed e_bool bogus_cbs)
  
let (arg_as_char : arg -> FStar_Char.char FStar_Pervasives_Native.option) =
  fun a  ->
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (unembed e_char bogus_cbs)
  
let (arg_as_string : arg -> Prims.string FStar_Pervasives_Native.option) =
  fun a  ->
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (unembed e_string bogus_cbs)
  
let arg_as_list :
  'a . 'a embedding -> arg -> 'a Prims.list FStar_Pervasives_Native.option =
  fun e  ->
    fun a  ->
      let uu____7124 =
        let uu____7133 = e_list e  in unembed uu____7133 bogus_cbs  in
      FStar_All.pipe_right (FStar_Pervasives_Native.fst a) uu____7124
  
let (arg_as_bounded_int :
  arg ->
    (FStar_Syntax_Syntax.fv * FStar_BigInt.t) FStar_Pervasives_Native.option)
  =
  fun uu____7155  ->
    match uu____7155 with
    | (a,uu____7163) ->
        (match a with
         | FV (fv1,[],(Constant (Int i),uu____7178)::[]) when
             let uu____7195 =
               FStar_Ident.string_of_lid
                 (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                in
             FStar_Util.ends_with uu____7195 "int_to_t" ->
             FStar_Pervasives_Native.Some (fv1, i)
         | uu____7202 -> FStar_Pervasives_Native.None)
  
let (int_as_bounded : FStar_Syntax_Syntax.fv -> FStar_BigInt.t -> t) =
  fun int_to_t1  ->
    fun n1  ->
      let c = embed e_int bogus_cbs n1  in
      let int_to_t2 args = FV (int_to_t1, [], args)  in
      let uu____7245 = let uu____7252 = as_arg c  in [uu____7252]  in
      int_to_t2 uu____7245
  
let lift_unary :
  'a 'b .
    ('a -> 'b) ->
      'a FStar_Pervasives_Native.option Prims.list ->
        'b FStar_Pervasives_Native.option
  =
  fun f  ->
    fun aopts  ->
      match aopts with
      | (FStar_Pervasives_Native.Some a)::[] ->
          let uu____7306 = f a  in FStar_Pervasives_Native.Some uu____7306
      | uu____7307 -> FStar_Pervasives_Native.None
  
let lift_binary :
  'a 'b .
    ('a -> 'a -> 'b) ->
      'a FStar_Pervasives_Native.option Prims.list ->
        'b FStar_Pervasives_Native.option
  =
  fun f  ->
    fun aopts  ->
      match aopts with
      | (FStar_Pervasives_Native.Some a0)::(FStar_Pervasives_Native.Some
          a1)::[] ->
          let uu____7361 = f a0 a1  in
          FStar_Pervasives_Native.Some uu____7361
      | uu____7362 -> FStar_Pervasives_Native.None
  
let unary_op :
  'a .
    (arg -> 'a FStar_Pervasives_Native.option) ->
      ('a -> t) -> args -> t FStar_Pervasives_Native.option
  =
  fun as_a  ->
    fun f  ->
      fun args  ->
        let uu____7406 = FStar_List.map as_a args  in lift_unary f uu____7406
  
let binary_op :
  'a .
    (arg -> 'a FStar_Pervasives_Native.option) ->
      ('a -> 'a -> t) -> args -> t FStar_Pervasives_Native.option
  =
  fun as_a  ->
    fun f  ->
      fun args  ->
        let uu____7461 = FStar_List.map as_a args  in
        lift_binary f uu____7461
  
let (unary_int_op :
  (FStar_BigInt.t -> FStar_BigInt.t) ->
    args -> t FStar_Pervasives_Native.option)
  =
  fun f  ->
    unary_op arg_as_int
      (fun x  -> let uu____7491 = f x  in embed e_int bogus_cbs uu____7491)
  
let (binary_int_op :
  (FStar_BigInt.t -> FStar_BigInt.t -> FStar_BigInt.t) ->
    args -> t FStar_Pervasives_Native.option)
  =
  fun f  ->
    binary_op arg_as_int
      (fun x  ->
         fun y  ->
           let uu____7518 = f x y  in embed e_int bogus_cbs uu____7518)
  
let (unary_bool_op :
  (Prims.bool -> Prims.bool) -> args -> t FStar_Pervasives_Native.option) =
  fun f  ->
    unary_op arg_as_bool
      (fun x  -> let uu____7544 = f x  in embed e_bool bogus_cbs uu____7544)
  
let (binary_bool_op :
  (Prims.bool -> Prims.bool -> Prims.bool) ->
    args -> t FStar_Pervasives_Native.option)
  =
  fun f  ->
    binary_op arg_as_bool
      (fun x  ->
         fun y  ->
           let uu____7582 = f x y  in embed e_bool bogus_cbs uu____7582)
  
let (binary_string_op :
  (Prims.string -> Prims.string -> Prims.string) ->
    args -> t FStar_Pervasives_Native.option)
  =
  fun f  ->
    binary_op arg_as_string
      (fun x  ->
         fun y  ->
           let uu____7620 = f x y  in embed e_string bogus_cbs uu____7620)
  
let mixed_binary_op :
  'a 'b 'c .
    (arg -> 'a FStar_Pervasives_Native.option) ->
      (arg -> 'b FStar_Pervasives_Native.option) ->
        ('c -> t) ->
          ('a -> 'b -> 'c) -> args -> t FStar_Pervasives_Native.option
  =
  fun as_a  ->
    fun as_b  ->
      fun embed_c  ->
        fun f  ->
          fun args  ->
            match args with
            | a::b::[] ->
                let uu____7725 =
                  let uu____7734 = as_a a  in
                  let uu____7737 = as_b b  in (uu____7734, uu____7737)  in
                (match uu____7725 with
                 | (FStar_Pervasives_Native.Some
                    a1,FStar_Pervasives_Native.Some b1) ->
                     let uu____7752 =
                       let uu____7753 = f a1 b1  in embed_c uu____7753  in
                     FStar_Pervasives_Native.Some uu____7752
                 | uu____7754 -> FStar_Pervasives_Native.None)
            | uu____7763 -> FStar_Pervasives_Native.None
  
let (list_of_string' : Prims.string -> t) =
  fun s  ->
    let uu____7772 = e_list e_char  in
    let uu____7779 = FStar_String.list_of_string s  in
    embed uu____7772 bogus_cbs uu____7779
  
let (string_of_list' : FStar_Char.char Prims.list -> t) =
  fun l  ->
    let s = FStar_String.string_of_list l  in
    Constant (String (s, FStar_Range.dummyRange))
  
let (string_compare' : Prims.string -> Prims.string -> t) =
  fun s1  ->
    fun s2  ->
      let r = FStar_String.compare s1 s2  in
      let uu____7818 =
        let uu____7819 = FStar_Util.string_of_int r  in
        FStar_BigInt.big_int_of_string uu____7819  in
      embed e_int bogus_cbs uu____7818
  
let (string_concat' : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | a1::a2::[] ->
        let uu____7853 = arg_as_string a1  in
        (match uu____7853 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____7862 = arg_as_list e_string a2  in
             (match uu____7862 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.concat s1 s2  in
                  let uu____7880 = embed e_string bogus_cbs r  in
                  FStar_Pervasives_Native.Some uu____7880
              | uu____7882 -> FStar_Pervasives_Native.None)
         | uu____7888 -> FStar_Pervasives_Native.None)
    | uu____7892 -> FStar_Pervasives_Native.None
  
let (string_of_int : FStar_BigInt.t -> t) =
  fun i  ->
    let uu____7899 = FStar_BigInt.string_of_big_int i  in
    embed e_string bogus_cbs uu____7899
  
let (string_of_bool : Prims.bool -> t) =
  fun b  -> embed e_string bogus_cbs (if b then "true" else "false") 
let (string_lowercase : Prims.string -> t) =
  fun s  -> embed e_string bogus_cbs (FStar_String.lowercase s) 
let (string_uppercase : Prims.string -> t) =
  fun s  -> embed e_string bogus_cbs (FStar_String.lowercase s) 
let (decidable_eq : Prims.bool -> args -> t FStar_Pervasives_Native.option) =
  fun neg  ->
    fun args  ->
      let tru = embed e_bool bogus_cbs true  in
      let fal = embed e_bool bogus_cbs false  in
      match args with
      | (_typ,uu____7961)::(a1,uu____7963)::(a2,uu____7965)::[] ->
          let uu____7982 = eq_t a1 a2  in
          (match uu____7982 with
           | FStar_Syntax_Util.Equal  ->
               FStar_Pervasives_Native.Some (if neg then fal else tru)
           | FStar_Syntax_Util.NotEqual  ->
               FStar_Pervasives_Native.Some (if neg then tru else fal)
           | uu____7991 -> FStar_Pervasives_Native.None)
      | uu____7992 -> failwith "Unexpected number of arguments"
  
let (interp_prop_eq2 : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | (_u,uu____8007)::(_typ,uu____8009)::(a1,uu____8011)::(a2,uu____8013)::[]
        ->
        let uu____8034 = eq_t a1 a2  in
        (match uu____8034 with
         | FStar_Syntax_Util.Equal  ->
             let uu____8037 = embed e_bool bogus_cbs true  in
             FStar_Pervasives_Native.Some uu____8037
         | FStar_Syntax_Util.NotEqual  ->
             let uu____8040 = embed e_bool bogus_cbs false  in
             FStar_Pervasives_Native.Some uu____8040
         | FStar_Syntax_Util.Unknown  -> FStar_Pervasives_Native.None)
    | uu____8043 -> failwith "Unexpected number of arguments"
  
let (interp_prop_eq3 : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | (_u,uu____8058)::(_v,uu____8060)::(t1,uu____8062)::(t2,uu____8064)::
        (a1,uu____8066)::(a2,uu____8068)::[] ->
        let uu____8097 =
          let uu____8098 = eq_t t1 t2  in
          let uu____8099 = eq_t a1 a2  in
          FStar_Syntax_Util.eq_inj uu____8098 uu____8099  in
        (match uu____8097 with
         | FStar_Syntax_Util.Equal  ->
             let uu____8102 = embed e_bool bogus_cbs true  in
             FStar_Pervasives_Native.Some uu____8102
         | FStar_Syntax_Util.NotEqual  ->
             let uu____8105 = embed e_bool bogus_cbs false  in
             FStar_Pervasives_Native.Some uu____8105
         | FStar_Syntax_Util.Unknown  -> FStar_Pervasives_Native.None)
    | uu____8108 -> failwith "Unexpected number of arguments"
  
let (dummy_interp :
  FStar_Ident.lid -> args -> t FStar_Pervasives_Native.option) =
  fun lid  ->
    fun args  ->
      let uu____8127 =
        let uu____8129 = FStar_Ident.string_of_lid lid  in
        FStar_String.op_Hat "No interpretation for " uu____8129  in
      failwith uu____8127
  
let (prims_to_fstar_range_step : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | (a1,uu____8145)::[] ->
        let uu____8154 = unembed e_range bogus_cbs a1  in
        (match uu____8154 with
         | FStar_Pervasives_Native.Some r ->
             let uu____8160 = embed e_range bogus_cbs r  in
             FStar_Pervasives_Native.Some uu____8160
         | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None)
    | uu____8161 -> failwith "Unexpected number of arguments"
  
let (string_split' : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | a1::a2::[] ->
        let uu____8197 = arg_as_list e_char a1  in
        (match uu____8197 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____8213 = arg_as_string a2  in
             (match uu____8213 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.split s1 s2  in
                  let uu____8226 =
                    let uu____8227 = e_list e_string  in
                    embed uu____8227 bogus_cbs r  in
                  FStar_Pervasives_Native.Some uu____8226
              | uu____8237 -> FStar_Pervasives_Native.None)
         | uu____8241 -> FStar_Pervasives_Native.None)
    | uu____8247 -> FStar_Pervasives_Native.None
  
let (string_index : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | a1::a2::[] ->
        let uu____8280 =
          let uu____8290 = arg_as_string a1  in
          let uu____8294 = arg_as_int a2  in (uu____8290, uu____8294)  in
        (match uu____8280 with
         | (FStar_Pervasives_Native.Some s,FStar_Pervasives_Native.Some i) ->
             (try
                (fun uu___1008_8318  ->
                   match () with
                   | () ->
                       let r = FStar_String.index s i  in
                       let uu____8323 = embed e_char bogus_cbs r  in
                       FStar_Pervasives_Native.Some uu____8323) ()
              with | uu___1007_8326 -> FStar_Pervasives_Native.None)
         | uu____8329 -> FStar_Pervasives_Native.None)
    | uu____8339 -> FStar_Pervasives_Native.None
  
let (string_index_of : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | a1::a2::[] ->
        let uu____8372 =
          let uu____8383 = arg_as_string a1  in
          let uu____8387 = arg_as_char a2  in (uu____8383, uu____8387)  in
        (match uu____8372 with
         | (FStar_Pervasives_Native.Some s,FStar_Pervasives_Native.Some c) ->
             (try
                (fun uu___1026_8416  ->
                   match () with
                   | () ->
                       let r = FStar_String.index_of s c  in
                       let uu____8420 = embed e_int bogus_cbs r  in
                       FStar_Pervasives_Native.Some uu____8420) ()
              with | uu___1025_8422 -> FStar_Pervasives_Native.None)
         | uu____8425 -> FStar_Pervasives_Native.None)
    | uu____8436 -> FStar_Pervasives_Native.None
  
let (string_substring' : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | a1::a2::a3::[] ->
        let uu____8478 =
          let uu____8492 = arg_as_string a1  in
          let uu____8496 = arg_as_int a2  in
          let uu____8499 = arg_as_int a3  in
          (uu____8492, uu____8496, uu____8499)  in
        (match uu____8478 with
         | (FStar_Pervasives_Native.Some s1,FStar_Pervasives_Native.Some
            n1,FStar_Pervasives_Native.Some n2) ->
             let n11 = FStar_BigInt.to_int_fs n1  in
             let n21 = FStar_BigInt.to_int_fs n2  in
             (try
                (fun uu___1049_8532  ->
                   match () with
                   | () ->
                       let r = FStar_String.substring s1 n11 n21  in
                       let uu____8537 = embed e_string bogus_cbs r  in
                       FStar_Pervasives_Native.Some uu____8537) ()
              with | uu___1048_8540 -> FStar_Pervasives_Native.None)
         | uu____8543 -> FStar_Pervasives_Native.None)
    | uu____8557 -> FStar_Pervasives_Native.None
  
let (mk_range : args -> t FStar_Pervasives_Native.option) =
  fun args  ->
    match args with
    | fn::from_line::from_col::to_line::to_col::[] ->
        let uu____8617 =
          let uu____8639 = arg_as_string fn  in
          let uu____8643 = arg_as_int from_line  in
          let uu____8646 = arg_as_int from_col  in
          let uu____8649 = arg_as_int to_line  in
          let uu____8652 = arg_as_int to_col  in
          (uu____8639, uu____8643, uu____8646, uu____8649, uu____8652)  in
        (match uu____8617 with
         | (FStar_Pervasives_Native.Some fn1,FStar_Pervasives_Native.Some
            from_l,FStar_Pervasives_Native.Some
            from_c,FStar_Pervasives_Native.Some
            to_l,FStar_Pervasives_Native.Some to_c) ->
             let r =
               let uu____8687 =
                 let uu____8688 = FStar_BigInt.to_int_fs from_l  in
                 let uu____8690 = FStar_BigInt.to_int_fs from_c  in
                 FStar_Range.mk_pos uu____8688 uu____8690  in
               let uu____8692 =
                 let uu____8693 = FStar_BigInt.to_int_fs to_l  in
                 let uu____8695 = FStar_BigInt.to_int_fs to_c  in
                 FStar_Range.mk_pos uu____8693 uu____8695  in
               FStar_Range.mk_range fn1 uu____8687 uu____8692  in
             let uu____8697 = embed e_range bogus_cbs r  in
             FStar_Pervasives_Native.Some uu____8697
         | uu____8698 -> FStar_Pervasives_Native.None)
    | uu____8720 -> FStar_Pervasives_Native.None
  
let arrow_as_prim_step_1 :
  'a 'b .
    'a embedding ->
      'b embedding ->
        ('a -> 'b) ->
          Prims.int ->
            FStar_Ident.lid ->
              nbe_cbs -> args -> t FStar_Pervasives_Native.option
  =
  fun ea  ->
    fun eb  ->
      fun f  ->
        fun n_tvars  ->
          fun _fv_lid  ->
            fun cb  ->
              let f_wrapped args =
                let uu____8810 = FStar_List.splitAt n_tvars args  in
                match uu____8810 with
                | (_tvar_args,rest_args) ->
                    let uu____8859 = FStar_List.hd rest_args  in
                    (match uu____8859 with
                     | (x,uu____8871) ->
                         let uu____8872 = unembed ea cb x  in
                         FStar_Util.map_opt uu____8872
                           (fun x1  ->
                              let uu____8878 = f x1  in
                              embed eb cb uu____8878))
                 in
              f_wrapped
  
let arrow_as_prim_step_2 :
  'a 'b 'c .
    'a embedding ->
      'b embedding ->
        'c embedding ->
          ('a -> 'b -> 'c) ->
            Prims.int ->
              FStar_Ident.lid ->
                nbe_cbs -> args -> t FStar_Pervasives_Native.option
  =
  fun ea  ->
    fun eb  ->
      fun ec  ->
        fun f  ->
          fun n_tvars  ->
            fun _fv_lid  ->
              fun cb  ->
                let f_wrapped args =
                  let uu____8987 = FStar_List.splitAt n_tvars args  in
                  match uu____8987 with
                  | (_tvar_args,rest_args) ->
                      let uu____9036 = FStar_List.hd rest_args  in
                      (match uu____9036 with
                       | (x,uu____9048) ->
                           let uu____9049 =
                             let uu____9054 = FStar_List.tl rest_args  in
                             FStar_List.hd uu____9054  in
                           (match uu____9049 with
                            | (y,uu____9072) ->
                                let uu____9073 = unembed ea cb x  in
                                FStar_Util.bind_opt uu____9073
                                  (fun x1  ->
                                     let uu____9079 = unembed eb cb y  in
                                     FStar_Util.bind_opt uu____9079
                                       (fun y1  ->
                                          let uu____9085 =
                                            let uu____9086 = f x1 y1  in
                                            embed ec cb uu____9086  in
                                          FStar_Pervasives_Native.Some
                                            uu____9085))))
                   in
                f_wrapped
  
let arrow_as_prim_step_3 :
  'a 'b 'c 'd .
    'a embedding ->
      'b embedding ->
        'c embedding ->
          'd embedding ->
            ('a -> 'b -> 'c -> 'd) ->
              Prims.int ->
                FStar_Ident.lid ->
                  nbe_cbs -> args -> t FStar_Pervasives_Native.option
  =
  fun ea  ->
    fun eb  ->
      fun ec  ->
        fun ed  ->
          fun f  ->
            fun n_tvars  ->
              fun _fv_lid  ->
                fun cb  ->
                  let f_wrapped args =
                    let uu____9214 = FStar_List.splitAt n_tvars args  in
                    match uu____9214 with
                    | (_tvar_args,rest_args) ->
                        let uu____9263 = FStar_List.hd rest_args  in
                        (match uu____9263 with
                         | (x,uu____9275) ->
                             let uu____9276 =
                               let uu____9281 = FStar_List.tl rest_args  in
                               FStar_List.hd uu____9281  in
                             (match uu____9276 with
                              | (y,uu____9299) ->
                                  let uu____9300 =
                                    let uu____9305 =
                                      let uu____9312 =
                                        FStar_List.tl rest_args  in
                                      FStar_List.tl uu____9312  in
                                    FStar_List.hd uu____9305  in
                                  (match uu____9300 with
                                   | (z,uu____9334) ->
                                       let uu____9335 = unembed ea cb x  in
                                       FStar_Util.bind_opt uu____9335
                                         (fun x1  ->
                                            let uu____9341 = unembed eb cb y
                                               in
                                            FStar_Util.bind_opt uu____9341
                                              (fun y1  ->
                                                 let uu____9347 =
                                                   unembed ec cb z  in
                                                 FStar_Util.bind_opt
                                                   uu____9347
                                                   (fun z1  ->
                                                      let uu____9353 =
                                                        let uu____9354 =
                                                          f x1 y1 z1  in
                                                        embed ed cb
                                                          uu____9354
                                                         in
                                                      FStar_Pervasives_Native.Some
                                                        uu____9353))))))
                     in
                  f_wrapped
  