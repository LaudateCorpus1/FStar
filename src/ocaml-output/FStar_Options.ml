open Prims
type debug_level_t =
  | Low
  | Medium
  | High
  | Extreme
  | Other of Prims.string
let uu___is_Low: debug_level_t -> Prims.bool =
  fun projectee  -> match projectee with | Low  -> true | uu____9 -> false
let uu___is_Medium: debug_level_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Medium  -> true | uu____14 -> false
let uu___is_High: debug_level_t -> Prims.bool =
  fun projectee  -> match projectee with | High  -> true | uu____19 -> false
let uu___is_Extreme: debug_level_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Extreme  -> true | uu____24 -> false
let uu___is_Other: debug_level_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Other _0 -> true | uu____30 -> false
let __proj__Other__item___0: debug_level_t -> Prims.string =
  fun projectee  -> match projectee with | Other _0 -> _0
type option_val =
  | Bool of Prims.bool
  | String of Prims.string
  | Path of Prims.string
  | Int of Prims.int
  | List of option_val Prims.list
  | Unset
let uu___is_Bool: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Bool _0 -> true | uu____65 -> false
let __proj__Bool__item___0: option_val -> Prims.bool =
  fun projectee  -> match projectee with | Bool _0 -> _0
let uu___is_String: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | String _0 -> true | uu____79 -> false
let __proj__String__item___0: option_val -> Prims.string =
  fun projectee  -> match projectee with | String _0 -> _0
let uu___is_Path: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Path _0 -> true | uu____93 -> false
let __proj__Path__item___0: option_val -> Prims.string =
  fun projectee  -> match projectee with | Path _0 -> _0
let uu___is_Int: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Int _0 -> true | uu____107 -> false
let __proj__Int__item___0: option_val -> Prims.int =
  fun projectee  -> match projectee with | Int _0 -> _0
let uu___is_List: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | List _0 -> true | uu____122 -> false
let __proj__List__item___0: option_val -> option_val Prims.list =
  fun projectee  -> match projectee with | List _0 -> _0
let uu___is_Unset: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Unset  -> true | uu____138 -> false
type options =
  | Set
  | Reset
  | Restore
let uu___is_Set: options -> Prims.bool =
  fun projectee  -> match projectee with | Set  -> true | uu____143 -> false
let uu___is_Reset: options -> Prims.bool =
  fun projectee  ->
    match projectee with | Reset  -> true | uu____148 -> false
let uu___is_Restore: options -> Prims.bool =
  fun projectee  ->
    match projectee with | Restore  -> true | uu____153 -> false
let __unit_tests__: Prims.bool FStar_ST.ref = FStar_Util.mk_ref false
let __unit_tests: Prims.unit -> Prims.bool =
  fun uu____160  -> FStar_ST.read __unit_tests__
let __set_unit_tests: Prims.unit -> Prims.unit =
  fun uu____166  -> FStar_ST.write __unit_tests__ true
let __clear_unit_tests: Prims.unit -> Prims.unit =
  fun uu____172  -> FStar_ST.write __unit_tests__ false
let as_bool: option_val -> Prims.bool =
  fun uu___49_178  ->
    match uu___49_178 with
    | Bool b -> b
    | uu____180 -> failwith "Impos: expected Bool"
let as_int: option_val -> Prims.int =
  fun uu___50_184  ->
    match uu___50_184 with
    | Int b -> b
    | uu____186 -> failwith "Impos: expected Int"
let as_string: option_val -> Prims.string =
  fun uu___51_190  ->
    match uu___51_190 with
    | String b -> b
    | Path b -> FStar_Common.try_convert_file_name_to_mixed b
    | uu____193 -> failwith "Impos: expected String"
let as_list as_t uu___52_212 =
  match uu___52_212 with
  | List ts -> FStar_All.pipe_right ts (FStar_List.map as_t)
  | uu____219 -> failwith "Impos: expected List"
let as_option as_t uu___53_239 =
  match uu___53_239 with
  | Unset  -> None
  | v1 -> let uu____243 = as_t v1 in Some uu____243
type optionstate = option_val FStar_Util.smap
let fstar_options: optionstate Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let peek: Prims.unit -> optionstate =
  fun uu____253  ->
    let uu____254 = FStar_ST.read fstar_options in FStar_List.hd uu____254
let pop: Prims.unit -> Prims.unit =
  fun uu____262  ->
    let uu____263 = FStar_ST.read fstar_options in
    match uu____263 with
    | [] -> failwith "TOO MANY POPS!"
    | uu____268::[] -> failwith "TOO MANY POPS!"
    | uu____269::tl1 -> FStar_ST.write fstar_options tl1
let push: Prims.unit -> Prims.unit =
  fun uu____278  ->
    let uu____279 =
      let uu____281 =
        let uu____283 = peek () in FStar_Util.smap_copy uu____283 in
      let uu____285 = FStar_ST.read fstar_options in uu____281 :: uu____285 in
    FStar_ST.write fstar_options uu____279
let set: optionstate -> Prims.unit =
  fun o  ->
    let uu____299 = FStar_ST.read fstar_options in
    match uu____299 with
    | [] -> failwith "set on empty option stack"
    | uu____304::os -> FStar_ST.write fstar_options (o :: os)
let set_option: Prims.string -> option_val -> Prims.unit =
  fun k  ->
    fun v1  -> let uu____318 = peek () in FStar_Util.smap_add uu____318 k v1
let set_option': (Prims.string* option_val) -> Prims.unit =
  fun uu____325  -> match uu____325 with | (k,v1) -> set_option k v1
let with_saved_options f = push (); (let retv = f () in pop (); retv)
let light_off_files: Prims.string Prims.list FStar_ST.ref =
  FStar_Util.mk_ref []
let add_light_off_file: Prims.string -> Prims.unit =
  fun filename  ->
    let uu____356 =
      let uu____358 = FStar_ST.read light_off_files in filename :: uu____358 in
    FStar_ST.write light_off_files uu____356
let defaults: (Prims.string* option_val) Prims.list =
  [("__temp_no_proj", (List []));
  ("_fstar_home", (String ""));
  ("_include_path", (List []));
  ("admit_smt_queries", (Bool false));
  ("check_hints", (Bool false));
  ("codegen", Unset);
  ("codegen-lib", (List []));
  ("debug", (List []));
  ("debug_level", (List []));
  ("dep", Unset);
  ("detail_errors", (Bool false));
  ("doc", (Bool false));
  ("dump_module", (List []));
  ("eager_inference", (Bool false));
  ("explicit_deps", (Bool false));
  ("extract_all", (Bool false));
  ("extract_module", (List []));
  ("extract_namespace", (List []));
  ("fs_typ_app", (Bool false));
  ("fstar_home", Unset);
  ("full_context_dependency", (Bool true));
  ("hide_genident_nums", (Bool false));
  ("hide_uvar_nums", (Bool false));
  ("hint_info", (Bool false));
  ("in", (Bool false));
  ("ide", (Bool false));
  ("include", (List []));
  ("indent", (Bool false));
  ("initial_fuel", (Int (Prims.parse_int "2")));
  ("initial_ifuel", (Int (Prims.parse_int "1")));
  ("lax", (Bool false));
  ("load", Unset);
  ("log_queries", (Bool false));
  ("log_types", (Bool false));
  ("max_fuel", (Int (Prims.parse_int "8")));
  ("max_ifuel", (Int (Prims.parse_int "2")));
  ("min_fuel", (Int (Prims.parse_int "1")));
  ("MLish", (Bool false));
  ("n_cores", (Int (Prims.parse_int "1")));
  ("no_default_includes", (Bool false));
  ("no_extract", (List []));
  ("no_location_info", (Bool false));
  ("odir", Unset);
  ("prims", Unset);
  ("pretype", (Bool true));
  ("prims_ref", Unset);
  ("print_bound_var_types", (Bool false));
  ("print_effect_args", (Bool false));
  ("print_fuels", (Bool false));
  ("print_full_names", (Bool false));
  ("print_implicits", (Bool false));
  ("print_universes", (Bool false));
  ("print_z3_statistics", (Bool false));
  ("prn", (Bool false));
  ("record_hints", (Bool false));
  ("reuse_hint_for", Unset);
  ("show_signatures", (List []));
  ("silent", (Bool false));
  ("smt", Unset);
  ("smtencoding.elim_box", (Bool false));
  ("smtencoding.nl_arith_repr", (String "boxwrap"));
  ("smtencoding.l_arith_repr", (String "boxwrap"));
  ("split_cases", (Int (Prims.parse_int "0")));
  ("timing", (Bool false));
  ("trace_error", (Bool false));
  ("ugly", (Bool false));
  ("unthrottle_inductives", (Bool false));
  ("use_eq_at_higher_order", (Bool false));
  ("use_hints", (Bool false));
  ("no_tactics", (Bool false));
  ("using_facts_from", Unset);
  ("verify", (Bool true));
  ("verify_all", (Bool false));
  ("verify_module", (List []));
  ("warn_default_effects", (Bool false));
  ("z3refresh", (Bool false));
  ("z3rlimit", (Int (Prims.parse_int "5")));
  ("z3rlimit_factor", (Int (Prims.parse_int "1")));
  ("z3seed", (Int (Prims.parse_int "0")));
  ("z3cliopt", (List []));
  ("__no_positivity", (Bool false))]
let init: Prims.unit -> Prims.unit =
  fun uu____536  ->
    let o = peek () in
    FStar_Util.smap_clear o;
    FStar_All.pipe_right defaults (FStar_List.iter set_option')
let clear: Prims.unit -> Prims.unit =
  fun uu____547  ->
    let o = FStar_Util.smap_create (Prims.parse_int "50") in
    FStar_ST.write fstar_options [o];
    FStar_ST.write light_off_files [];
    init ()
let _run: Prims.unit = clear ()
let get_option: Prims.string -> option_val =
  fun s  ->
    let uu____564 =
      let uu____566 = peek () in FStar_Util.smap_try_find uu____566 s in
    match uu____564 with
    | None  ->
        failwith
          (Prims.strcat "Impossible: option " (Prims.strcat s " not found"))
    | Some s1 -> s1
let lookup_opt s c = c (get_option s)
let get_admit_smt_queries: Prims.unit -> Prims.bool =
  fun uu____592  -> lookup_opt "admit_smt_queries" as_bool
let get_check_hints: Prims.unit -> Prims.bool =
  fun uu____596  -> lookup_opt "check_hints" as_bool
let get_codegen: Prims.unit -> Prims.string option =
  fun uu____601  -> lookup_opt "codegen" (as_option as_string)
let get_codegen_lib: Prims.unit -> Prims.string Prims.list =
  fun uu____607  -> lookup_opt "codegen-lib" (as_list as_string)
let get_debug: Prims.unit -> Prims.string Prims.list =
  fun uu____613  -> lookup_opt "debug" (as_list as_string)
let get_debug_level: Prims.unit -> Prims.string Prims.list =
  fun uu____619  -> lookup_opt "debug_level" (as_list as_string)
let get_dep: Prims.unit -> Prims.string option =
  fun uu____625  -> lookup_opt "dep" (as_option as_string)
let get_detail_errors: Prims.unit -> Prims.bool =
  fun uu____630  -> lookup_opt "detail_errors" as_bool
let get_doc: Prims.unit -> Prims.bool =
  fun uu____634  -> lookup_opt "doc" as_bool
let get_dump_module: Prims.unit -> Prims.string Prims.list =
  fun uu____639  -> lookup_opt "dump_module" (as_list as_string)
let get_eager_inference: Prims.unit -> Prims.bool =
  fun uu____644  -> lookup_opt "eager_inference" as_bool
let get_explicit_deps: Prims.unit -> Prims.bool =
  fun uu____648  -> lookup_opt "explicit_deps" as_bool
let get_extract_all: Prims.unit -> Prims.bool =
  fun uu____652  -> lookup_opt "extract_all" as_bool
let get_extract_module: Prims.unit -> Prims.string Prims.list =
  fun uu____657  -> lookup_opt "extract_module" (as_list as_string)
let get_extract_namespace: Prims.unit -> Prims.string Prims.list =
  fun uu____663  -> lookup_opt "extract_namespace" (as_list as_string)
let get_fs_typ_app: Prims.unit -> Prims.bool =
  fun uu____668  -> lookup_opt "fs_typ_app" as_bool
let get_fstar_home: Prims.unit -> Prims.string option =
  fun uu____673  -> lookup_opt "fstar_home" (as_option as_string)
let get_hide_genident_nums: Prims.unit -> Prims.bool =
  fun uu____678  -> lookup_opt "hide_genident_nums" as_bool
let get_hide_uvar_nums: Prims.unit -> Prims.bool =
  fun uu____682  -> lookup_opt "hide_uvar_nums" as_bool
let get_hint_info: Prims.unit -> Prims.bool =
  fun uu____686  -> lookup_opt "hint_info" as_bool
let get_in: Prims.unit -> Prims.bool =
  fun uu____690  -> lookup_opt "in" as_bool
let get_ide: Prims.unit -> Prims.bool =
  fun uu____694  -> lookup_opt "ide" as_bool
let get_include: Prims.unit -> Prims.string Prims.list =
  fun uu____699  -> lookup_opt "include" (as_list as_string)
let get_indent: Prims.unit -> Prims.bool =
  fun uu____704  -> lookup_opt "indent" as_bool
let get_initial_fuel: Prims.unit -> Prims.int =
  fun uu____708  -> lookup_opt "initial_fuel" as_int
let get_initial_ifuel: Prims.unit -> Prims.int =
  fun uu____712  -> lookup_opt "initial_ifuel" as_int
let get_lax: Prims.unit -> Prims.bool =
  fun uu____716  -> lookup_opt "lax" as_bool
let get_load: Prims.unit -> Prims.string option =
  fun uu____721  -> lookup_opt "load" (as_option as_string)
let get_log_queries: Prims.unit -> Prims.bool =
  fun uu____726  -> lookup_opt "log_queries" as_bool
let get_log_types: Prims.unit -> Prims.bool =
  fun uu____730  -> lookup_opt "log_types" as_bool
let get_max_fuel: Prims.unit -> Prims.int =
  fun uu____734  -> lookup_opt "max_fuel" as_int
let get_max_ifuel: Prims.unit -> Prims.int =
  fun uu____738  -> lookup_opt "max_ifuel" as_int
let get_min_fuel: Prims.unit -> Prims.int =
  fun uu____742  -> lookup_opt "min_fuel" as_int
let get_MLish: Prims.unit -> Prims.bool =
  fun uu____746  -> lookup_opt "MLish" as_bool
let get_n_cores: Prims.unit -> Prims.int =
  fun uu____750  -> lookup_opt "n_cores" as_int
let get_no_default_includes: Prims.unit -> Prims.bool =
  fun uu____754  -> lookup_opt "no_default_includes" as_bool
let get_no_extract: Prims.unit -> Prims.string Prims.list =
  fun uu____759  -> lookup_opt "no_extract" (as_list as_string)
let get_no_location_info: Prims.unit -> Prims.bool =
  fun uu____764  -> lookup_opt "no_location_info" as_bool
let get_odir: Prims.unit -> Prims.string option =
  fun uu____769  -> lookup_opt "odir" (as_option as_string)
let get_ugly: Prims.unit -> Prims.bool =
  fun uu____774  -> lookup_opt "ugly" as_bool
let get_prims: Prims.unit -> Prims.string option =
  fun uu____779  -> lookup_opt "prims" (as_option as_string)
let get_print_bound_var_types: Prims.unit -> Prims.bool =
  fun uu____784  -> lookup_opt "print_bound_var_types" as_bool
let get_print_effect_args: Prims.unit -> Prims.bool =
  fun uu____788  -> lookup_opt "print_effect_args" as_bool
let get_print_fuels: Prims.unit -> Prims.bool =
  fun uu____792  -> lookup_opt "print_fuels" as_bool
let get_print_full_names: Prims.unit -> Prims.bool =
  fun uu____796  -> lookup_opt "print_full_names" as_bool
let get_print_implicits: Prims.unit -> Prims.bool =
  fun uu____800  -> lookup_opt "print_implicits" as_bool
let get_print_universes: Prims.unit -> Prims.bool =
  fun uu____804  -> lookup_opt "print_universes" as_bool
let get_print_z3_statistics: Prims.unit -> Prims.bool =
  fun uu____808  -> lookup_opt "print_z3_statistics" as_bool
let get_prn: Prims.unit -> Prims.bool =
  fun uu____812  -> lookup_opt "prn" as_bool
let get_record_hints: Prims.unit -> Prims.bool =
  fun uu____816  -> lookup_opt "record_hints" as_bool
let get_reuse_hint_for: Prims.unit -> Prims.string option =
  fun uu____821  -> lookup_opt "reuse_hint_for" (as_option as_string)
let get_show_signatures: Prims.unit -> Prims.string Prims.list =
  fun uu____827  -> lookup_opt "show_signatures" (as_list as_string)
let get_silent: Prims.unit -> Prims.bool =
  fun uu____832  -> lookup_opt "silent" as_bool
let get_smt: Prims.unit -> Prims.string option =
  fun uu____837  -> lookup_opt "smt" (as_option as_string)
let get_smtencoding_elim_box: Prims.unit -> Prims.bool =
  fun uu____842  -> lookup_opt "smtencoding.elim_box" as_bool
let get_smtencoding_nl_arith_repr: Prims.unit -> Prims.string =
  fun uu____846  -> lookup_opt "smtencoding.nl_arith_repr" as_string
let get_smtencoding_l_arith_repr: Prims.unit -> Prims.string =
  fun uu____850  -> lookup_opt "smtencoding.l_arith_repr" as_string
let get_split_cases: Prims.unit -> Prims.int =
  fun uu____854  -> lookup_opt "split_cases" as_int
let get_timing: Prims.unit -> Prims.bool =
  fun uu____858  -> lookup_opt "timing" as_bool
let get_trace_error: Prims.unit -> Prims.bool =
  fun uu____862  -> lookup_opt "trace_error" as_bool
let get_unthrottle_inductives: Prims.unit -> Prims.bool =
  fun uu____866  -> lookup_opt "unthrottle_inductives" as_bool
let get_use_eq_at_higher_order: Prims.unit -> Prims.bool =
  fun uu____870  -> lookup_opt "use_eq_at_higher_order" as_bool
let get_use_hints: Prims.unit -> Prims.bool =
  fun uu____874  -> lookup_opt "use_hints" as_bool
let get_use_tactics: Prims.unit -> Prims.bool =
  fun uu____878  ->
    let uu____879 = lookup_opt "no_tactics" as_bool in
    Prims.op_Negation uu____879
let get_using_facts_from: Prims.unit -> Prims.string Prims.list option =
  fun uu____885  ->
    lookup_opt "using_facts_from" (as_option (as_list as_string))
let get_verify_all: Prims.unit -> Prims.bool =
  fun uu____892  -> lookup_opt "verify_all" as_bool
let get_verify_module: Prims.unit -> Prims.string Prims.list =
  fun uu____897  -> lookup_opt "verify_module" (as_list as_string)
let get___temp_no_proj: Prims.unit -> Prims.string Prims.list =
  fun uu____903  -> lookup_opt "__temp_no_proj" (as_list as_string)
let get_version: Prims.unit -> Prims.bool =
  fun uu____908  -> lookup_opt "version" as_bool
let get_warn_default_effects: Prims.unit -> Prims.bool =
  fun uu____912  -> lookup_opt "warn_default_effects" as_bool
let get_z3cliopt: Prims.unit -> Prims.string Prims.list =
  fun uu____917  -> lookup_opt "z3cliopt" (as_list as_string)
let get_z3refresh: Prims.unit -> Prims.bool =
  fun uu____922  -> lookup_opt "z3refresh" as_bool
let get_z3rlimit: Prims.unit -> Prims.int =
  fun uu____926  -> lookup_opt "z3rlimit" as_int
let get_z3rlimit_factor: Prims.unit -> Prims.int =
  fun uu____930  -> lookup_opt "z3rlimit_factor" as_int
let get_z3seed: Prims.unit -> Prims.int =
  fun uu____934  -> lookup_opt "z3seed" as_int
let get_no_positivity: Prims.unit -> Prims.bool =
  fun uu____938  -> lookup_opt "__no_positivity" as_bool
let dlevel: Prims.string -> debug_level_t =
  fun uu___54_942  ->
    match uu___54_942 with
    | "Low" -> Low
    | "Medium" -> Medium
    | "High" -> High
    | "Extreme" -> Extreme
    | s -> Other s
let one_debug_level_geq: debug_level_t -> debug_level_t -> Prims.bool =
  fun l1  ->
    fun l2  ->
      match l1 with
      | Other uu____952 -> l1 = l2
      | Low  -> l1 = l2
      | Medium  -> (l2 = Low) || (l2 = Medium)
      | High  -> ((l2 = Low) || (l2 = Medium)) || (l2 = High)
      | Extreme  ->
          (((l2 = Low) || (l2 = Medium)) || (l2 = High)) || (l2 = Extreme)
let debug_level_geq: debug_level_t -> Prims.bool =
  fun l2  ->
    let uu____957 = get_debug_level () in
    FStar_All.pipe_right uu____957
      (FStar_Util.for_some (fun l1  -> one_debug_level_geq (dlevel l1) l2))
let universe_include_path_base_dirs: Prims.string Prims.list =
  ["/ulib"; "/lib/fstar"]
let _version: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _platform: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _compiler: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _date: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _commit: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let display_version: Prims.unit -> Prims.unit =
<<<<<<< HEAD
  fun uu____862  ->
    let uu____863 =
      let uu____864 = FStar_ST.read _version in
      let uu____867 = FStar_ST.read _platform in
      let uu____870 = FStar_ST.read _compiler in
      let uu____873 = FStar_ST.read _date in
      let uu____876 = FStar_ST.read _commit in
      FStar_Util.format5
        "F* %s\nplatform=%s\ncompiler=%s\ndate=%s\ncommit=%s\n" uu____864
        uu____867 uu____870 uu____873 uu____876 in
    FStar_Util.print_string uu____863
let display_usage_aux specs =
  FStar_Util.print_string "fstar.exe [options] file[s]\n";
  FStar_List.iter
    (fun uu____913  ->
       match uu____913 with
       | (uu____919,flag,p,doc) ->
=======
  fun uu____985  ->
    let uu____986 =
      let uu____987 = FStar_ST.read _version in
      let uu____990 = FStar_ST.read _platform in
      let uu____993 = FStar_ST.read _compiler in
      let uu____996 = FStar_ST.read _date in
      let uu____999 = FStar_ST.read _commit in
      FStar_Util.format5
        "F* %s\nplatform=%s\ncompiler=%s\ndate=%s\ncommit=%s\n" uu____987
        uu____990 uu____993 uu____996 uu____999 in
    FStar_Util.print_string uu____986
let display_usage_aux specs =
  FStar_Util.print_string "fstar.exe [options] file[s]\n";
  FStar_List.iter
    (fun uu____1032  ->
       match uu____1032 with
       | (uu____1038,flag,p,doc) ->
>>>>>>> origin/guido_tactics
           (match p with
            | FStar_Getopt.ZeroArgs ig ->
                if doc = ""
                then
<<<<<<< HEAD
                  let uu____928 =
                    let uu____929 = FStar_Util.colorize_bold flag in
                    FStar_Util.format1 "  --%s\n" uu____929 in
                  FStar_Util.print_string uu____928
                else
                  (let uu____931 =
                     let uu____932 = FStar_Util.colorize_bold flag in
                     FStar_Util.format2 "  --%s  %s\n" uu____932 doc in
                   FStar_Util.print_string uu____931)
            | FStar_Getopt.OneArg (uu____933,argname) ->
                if doc = ""
                then
                  let uu____939 =
                    let uu____940 = FStar_Util.colorize_bold flag in
                    let uu____941 = FStar_Util.colorize_bold argname in
                    FStar_Util.format2 "  --%s %s\n" uu____940 uu____941 in
                  FStar_Util.print_string uu____939
                else
                  (let uu____943 =
                     let uu____944 = FStar_Util.colorize_bold flag in
                     let uu____945 = FStar_Util.colorize_bold argname in
                     FStar_Util.format3 "  --%s %s  %s\n" uu____944 uu____945
                       doc in
                   FStar_Util.print_string uu____943))) specs
=======
                  let uu____1047 =
                    let uu____1048 = FStar_Util.colorize_bold flag in
                    FStar_Util.format1 "  --%s\n" uu____1048 in
                  FStar_Util.print_string uu____1047
                else
                  (let uu____1050 =
                     let uu____1051 = FStar_Util.colorize_bold flag in
                     FStar_Util.format2 "  --%s  %s\n" uu____1051 doc in
                   FStar_Util.print_string uu____1050)
            | FStar_Getopt.OneArg (uu____1052,argname) ->
                if doc = ""
                then
                  let uu____1058 =
                    let uu____1059 = FStar_Util.colorize_bold flag in
                    let uu____1060 = FStar_Util.colorize_bold argname in
                    FStar_Util.format2 "  --%s %s\n" uu____1059 uu____1060 in
                  FStar_Util.print_string uu____1058
                else
                  (let uu____1062 =
                     let uu____1063 = FStar_Util.colorize_bold flag in
                     let uu____1064 = FStar_Util.colorize_bold argname in
                     FStar_Util.format3 "  --%s %s  %s\n" uu____1063
                       uu____1064 doc in
                   FStar_Util.print_string uu____1062))) specs
>>>>>>> origin/guido_tactics
let mk_spec:
  (FStar_BaseTypes.char* Prims.string* option_val FStar_Getopt.opt_variant*
    Prims.string) -> FStar_Getopt.opt
  =
  fun o  ->
<<<<<<< HEAD
    let uu____959 = o in
    match uu____959 with
=======
    let uu____1079 = o in
    match uu____1079 with
>>>>>>> origin/guido_tactics
    | (ns,name,arg,desc) ->
        let arg1 =
          match arg with
          | FStar_Getopt.ZeroArgs f ->
<<<<<<< HEAD
              let g uu____980 =
                let uu____981 = let uu____984 = f () in (name, uu____984) in
                set_option' uu____981 in
              FStar_Getopt.ZeroArgs g
          | FStar_Getopt.OneArg (f,d) ->
              let g x =
                let uu____995 = let uu____998 = f x in (name, uu____998) in
                set_option' uu____995 in
=======
              let g uu____1100 =
                let uu____1101 = let uu____1104 = f () in (name, uu____1104) in
                set_option' uu____1101 in
              FStar_Getopt.ZeroArgs g
          | FStar_Getopt.OneArg (f,d) ->
              let g x =
                let uu____1115 = let uu____1118 = f x in (name, uu____1118) in
                set_option' uu____1115 in
>>>>>>> origin/guido_tactics
              FStar_Getopt.OneArg (g, d) in
        (ns, name, arg1, desc)
let cons_extract_module: Prims.string -> option_val =
  fun s  ->
<<<<<<< HEAD
    let uu____1005 =
      let uu____1007 =
        let uu____1009 = get_extract_module () in (FStar_String.lowercase s)
          :: uu____1009 in
      FStar_All.pipe_right uu____1007
        (FStar_List.map (fun _0_26  -> String _0_26)) in
    List uu____1005
let cons_extract_namespace: Prims.string -> option_val =
  fun s  ->
    let uu____1016 =
      let uu____1018 =
        let uu____1020 = get_extract_namespace () in
        (FStar_String.lowercase s) :: uu____1020 in
      FStar_All.pipe_right uu____1018
        (FStar_List.map (fun _0_27  -> String _0_27)) in
    List uu____1016
let add_extract_module: Prims.string -> Prims.unit =
  fun s  ->
    let uu____1027 = cons_extract_module s in
    set_option "extract_module" uu____1027
let add_extract_namespace: Prims.string -> Prims.unit =
  fun s  ->
    let uu____1031 = cons_extract_namespace s in
    set_option "extract_namespace" uu____1031
let cons_verify_module: Prims.string -> option_val =
  fun s  ->
    let uu____1035 =
      let uu____1037 =
        let uu____1039 = get_verify_module () in (FStar_String.lowercase s)
          :: uu____1039 in
      FStar_All.pipe_right uu____1037
        (FStar_List.map (fun _0_28  -> String _0_28)) in
    List uu____1035
let cons_using_facts_from: Prims.string -> option_val =
  fun s  ->
    set_option "z3refresh" (Bool true);
    (let uu____1047 = get_using_facts_from () in
     match uu____1047 with
     | None  -> List [String s]
     | Some l ->
         let uu____1054 =
           FStar_List.map (fun _0_29  -> String _0_29) (s :: l) in
         List uu____1054)
let add_verify_module: Prims.string -> Prims.unit =
  fun s  ->
    let uu____1059 = cons_verify_module s in
    set_option "verify_module" uu____1059
=======
    let uu____1126 =
      let uu____1128 =
        let uu____1130 = get_extract_module () in (FStar_String.lowercase s)
          :: uu____1130 in
      FStar_All.pipe_right uu____1128
        (FStar_List.map (fun _0_26  -> String _0_26)) in
    List uu____1126
let cons_extract_namespace: Prims.string -> option_val =
  fun s  ->
    let uu____1138 =
      let uu____1140 =
        let uu____1142 = get_extract_namespace () in
        (FStar_String.lowercase s) :: uu____1142 in
      FStar_All.pipe_right uu____1140
        (FStar_List.map (fun _0_27  -> String _0_27)) in
    List uu____1138
let add_extract_module: Prims.string -> Prims.unit =
  fun s  ->
    let uu____1150 = cons_extract_module s in
    set_option "extract_module" uu____1150
let add_extract_namespace: Prims.string -> Prims.unit =
  fun s  ->
    let uu____1155 = cons_extract_namespace s in
    set_option "extract_namespace" uu____1155
let cons_verify_module: Prims.string -> option_val =
  fun s  ->
    let uu____1160 =
      let uu____1162 =
        let uu____1164 = get_verify_module () in (FStar_String.lowercase s)
          :: uu____1164 in
      FStar_All.pipe_right uu____1162
        (FStar_List.map (fun _0_28  -> String _0_28)) in
    List uu____1160
let cons_using_facts_from: Prims.string -> option_val =
  fun s  ->
    set_option "z3refresh" (Bool true);
    (let uu____1173 = get_using_facts_from () in
     match uu____1173 with
     | None  -> List [String s]
     | Some l ->
         let uu____1180 =
           FStar_List.map (fun _0_29  -> String _0_29) (s :: l) in
         List uu____1180)
let add_verify_module: Prims.string -> Prims.unit =
  fun s  ->
    let uu____1186 = cons_verify_module s in
    set_option "verify_module" uu____1186
>>>>>>> origin/guido_tactics
let rec specs:
  Prims.unit ->
    (FStar_Char.char* Prims.string* Prims.unit FStar_Getopt.opt_variant*
      Prims.string) Prims.list
  =
<<<<<<< HEAD
  fun uu____1071  ->
=======
  fun uu____1198  ->
>>>>>>> origin/guido_tactics
    let specs1 =
      [(FStar_Getopt.noshort, "admit_smt_queries",
         (FStar_Getopt.OneArg
            (((fun s  ->
                 if s = "true"
                 then Bool true
                 else
                   if s = "false"
                   then Bool false
                   else failwith "Invalid argument to --admit_smt_queries")),
              "[true|false]")),
         "Admit SMT queries, unsafe! (default 'false')");
      (FStar_Getopt.noshort, "codegen",
        (FStar_Getopt.OneArg
<<<<<<< HEAD
           (((fun s  -> let uu____1103 = parse_codegen s in String uu____1103)),
=======
           (((fun s  -> let uu____1227 = parse_codegen s in String uu____1227)),
>>>>>>> origin/guido_tactics
             "[OCaml|FSharp|Kremlin]")), "Generate code for execution");
      (FStar_Getopt.noshort, "codegen-lib",
        (FStar_Getopt.OneArg
           (((fun s  ->
<<<<<<< HEAD
                let uu____1115 =
                  let uu____1117 =
                    let uu____1119 = get_codegen_lib () in s :: uu____1119 in
                  FStar_All.pipe_right uu____1117
                    (FStar_List.map (fun _0_30  -> String _0_30)) in
                List uu____1115)), "[namespace]")),
=======
                let uu____1237 =
                  let uu____1239 =
                    let uu____1241 = get_codegen_lib () in s :: uu____1241 in
                  FStar_All.pipe_right uu____1239
                    (FStar_List.map (fun _0_30  -> String _0_30)) in
                List uu____1237)), "[namespace]")),
>>>>>>> origin/guido_tactics
        "External runtime library (i.e. M.N.x extracts to M.N.X instead of M_N.x)");
      (FStar_Getopt.noshort, "debug",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1134 =
                  let uu____1136 =
                    let uu____1138 = get_debug () in x :: uu____1138 in
                  FStar_All.pipe_right uu____1136
                    (FStar_List.map (fun _0_31  -> String _0_31)) in
                List uu____1134)), "[module name]")),
=======
                let uu____1254 =
                  let uu____1256 =
                    let uu____1258 = get_debug () in x :: uu____1258 in
                  FStar_All.pipe_right uu____1256
                    (FStar_List.map (fun _0_31  -> String _0_31)) in
                List uu____1254)), "[module name]")),
>>>>>>> origin/guido_tactics
        "Print lots of debugging information while checking module");
      (FStar_Getopt.noshort, "debug_level",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1153 =
                  let uu____1155 =
                    let uu____1157 = get_debug_level () in x :: uu____1157 in
                  FStar_All.pipe_right uu____1155
                    (FStar_List.map (fun _0_32  -> String _0_32)) in
                List uu____1153)), "[Low|Medium|High|Extreme|...]")),
=======
                let uu____1271 =
                  let uu____1273 =
                    let uu____1275 = get_debug_level () in x :: uu____1275 in
                  FStar_All.pipe_right uu____1273
                    (FStar_List.map (fun _0_32  -> String _0_32)) in
                List uu____1271)), "[Low|Medium|High|Extreme|...]")),
>>>>>>> origin/guido_tactics
        "Control the verbosity of debugging info");
      (FStar_Getopt.noshort, "dep",
        (FStar_Getopt.OneArg
           (((fun x  ->
                if (x = "make") || (x = "graph")
                then String x
                else failwith "invalid argument to 'dep'")), "[make|graph]")),
        "Output the transitive closure of the dependency graph in a format suitable for the given tool");
      (FStar_Getopt.noshort, "detail_errors",
<<<<<<< HEAD
        (FStar_Getopt.ZeroArgs ((fun uu____1179  -> Bool true))),
        "Emit a detailed error report by asking the SMT solver many queries; will take longer;\n         implies n_cores=1");
      (FStar_Getopt.noshort, "doc",
        (FStar_Getopt.ZeroArgs ((fun uu____1187  -> Bool true))),
=======
        (FStar_Getopt.ZeroArgs ((fun uu____1295  -> Bool true))),
        "Emit a detailed error report by asking the SMT solver many queries; will take longer;\n         implies n_cores=1");
      (FStar_Getopt.noshort, "doc",
        (FStar_Getopt.ZeroArgs ((fun uu____1302  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Extract Markdown documentation files for the input modules, as well as an index. Output is written to --odir directory.");
      (FStar_Getopt.noshort, "dump_module",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1199 =
                  let uu____1201 =
                    let uu____1203 = get_dump_module () in x :: uu____1203 in
                  FStar_All.pipe_right uu____1201
                    (FStar_List.map (fun _0_33  -> String _0_33)) in
                FStar_All.pipe_right uu____1199 (fun _0_34  -> List _0_34))),
             "[module name]")), "");
      (FStar_Getopt.noshort, "eager_inference",
        (FStar_Getopt.ZeroArgs ((fun uu____1215  -> Bool true))),
        "Solve all type-inference constraints eagerly; more efficient but at the cost of generality");
      (FStar_Getopt.noshort, "explicit_deps",
        (FStar_Getopt.ZeroArgs ((fun uu____1223  -> Bool true))),
        "Do not find dependencies automatically, the user provides them on the command-line");
      (FStar_Getopt.noshort, "extract_all",
        (FStar_Getopt.ZeroArgs ((fun uu____1231  -> Bool true))),
=======
                let uu____1312 =
                  let uu____1314 =
                    let uu____1316 = get_dump_module () in x :: uu____1316 in
                  FStar_All.pipe_right uu____1314
                    (FStar_List.map (fun _0_33  -> String _0_33)) in
                FStar_All.pipe_right uu____1312 (fun _0_34  -> List _0_34))),
             "[module name]")), "");
      (FStar_Getopt.noshort, "eager_inference",
        (FStar_Getopt.ZeroArgs ((fun uu____1327  -> Bool true))),
        "Solve all type-inference constraints eagerly; more efficient but at the cost of generality");
      (FStar_Getopt.noshort, "explicit_deps",
        (FStar_Getopt.ZeroArgs ((fun uu____1334  -> Bool true))),
        "Do not find dependencies automatically, the user provides them on the command-line");
      (FStar_Getopt.noshort, "extract_all",
        (FStar_Getopt.ZeroArgs ((fun uu____1341  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Discover the complete dependency graph and do not stop at interface boundaries");
      (FStar_Getopt.noshort, "extract_module",
        (FStar_Getopt.OneArg (cons_extract_module, "[module name]")),
        "Only extract the specified modules (instead of the possibly-partial dependency graph)");
      (FStar_Getopt.noshort, "extract_namespace",
        (FStar_Getopt.OneArg (cons_extract_namespace, "[namespace name]")),
        "Only extract modules in the specified namespace");
      (FStar_Getopt.noshort, "fstar_home",
        (FStar_Getopt.OneArg (((fun _0_35  -> Path _0_35)), "[dir]")),
        "Set the FSTAR_HOME variable to [dir]");
      (FStar_Getopt.noshort, "hide_genident_nums",
<<<<<<< HEAD
        (FStar_Getopt.ZeroArgs ((fun uu____1263  -> Bool true))),
        "Don't print generated identifier numbers");
      (FStar_Getopt.noshort, "hide_uvar_nums",
        (FStar_Getopt.ZeroArgs ((fun uu____1271  -> Bool true))),
        "Don't print unification variable numbers");
      (FStar_Getopt.noshort, "hint_info",
        (FStar_Getopt.ZeroArgs ((fun uu____1279  -> Bool true))),
        "Print information regarding hints");
      (FStar_Getopt.noshort, "in",
        (FStar_Getopt.ZeroArgs ((fun uu____1287  -> Bool true))),
        "Legacy interactive mode; reads input from stdin");
      (FStar_Getopt.noshort, "ide",
        (FStar_Getopt.ZeroArgs ((fun uu____1295  -> Bool true))),
=======
        (FStar_Getopt.ZeroArgs ((fun uu____1372  -> Bool true))),
        "Don't print generated identifier numbers");
      (FStar_Getopt.noshort, "hide_uvar_nums",
        (FStar_Getopt.ZeroArgs ((fun uu____1379  -> Bool true))),
        "Don't print unification variable numbers");
      (FStar_Getopt.noshort, "hint_info",
        (FStar_Getopt.ZeroArgs ((fun uu____1386  -> Bool true))),
        "Print information regarding hints");
      (FStar_Getopt.noshort, "in",
        (FStar_Getopt.ZeroArgs ((fun uu____1393  -> Bool true))),
        "Legacy interactive mode; reads input from stdin");
      (FStar_Getopt.noshort, "ide",
        (FStar_Getopt.ZeroArgs ((fun uu____1400  -> Bool true))),
>>>>>>> origin/guido_tactics
        "JSON-based interactive mode for IDEs");
      (FStar_Getopt.noshort, "include",
        (FStar_Getopt.OneArg
           (((fun s  ->
<<<<<<< HEAD
                let uu____1307 =
                  let uu____1309 =
                    let uu____1311 = get_include () in
                    FStar_List.map (fun _0_36  -> String _0_36) uu____1311 in
                  FStar_List.append uu____1309 [Path s] in
                List uu____1307)), "[path]")),
        "A directory in which to search for files included on the command line");
      (FStar_Getopt.noshort, "indent",
        (FStar_Getopt.ZeroArgs ((fun uu____1320  -> Bool true))),
=======
                let uu____1410 =
                  let uu____1412 =
                    let uu____1414 = get_include () in
                    FStar_List.map (fun _0_36  -> String _0_36) uu____1414 in
                  FStar_List.append uu____1412 [Path s] in
                List uu____1410)), "[path]")),
        "A directory in which to search for files included on the command line");
      (FStar_Getopt.noshort, "indent",
        (FStar_Getopt.ZeroArgs ((fun uu____1422  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Parses and outputs the files on the command line");
      (FStar_Getopt.noshort, "initial_fuel",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1332 = FStar_Util.int_of_string x in Int uu____1332)),
=======
                let uu____1432 = FStar_Util.int_of_string x in Int uu____1432)),
>>>>>>> origin/guido_tactics
             "[non-negative integer]")),
        "Number of unrolling of recursive functions to try initially (default 2)");
      (FStar_Getopt.noshort, "initial_ifuel",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1344 = FStar_Util.int_of_string x in Int uu____1344)),
             "[non-negative integer]")),
        "Number of unrolling of inductive datatypes to try at first (default 1)");
      (FStar_Getopt.noshort, "inline_arith",
        (FStar_Getopt.ZeroArgs ((fun uu____1352  -> Bool true))),
        "Inline definitions of arithmetic functions in the SMT encoding");
      (FStar_Getopt.noshort, "lax",
        (FStar_Getopt.ZeroArgs ((fun uu____1360  -> Bool true))),
=======
                let uu____1442 = FStar_Util.int_of_string x in Int uu____1442)),
             "[non-negative integer]")),
        "Number of unrolling of inductive datatypes to try at first (default 1)");
      (FStar_Getopt.noshort, "inline_arith",
        (FStar_Getopt.ZeroArgs ((fun uu____1449  -> Bool true))),
        "Inline definitions of arithmetic functions in the SMT encoding");
      (FStar_Getopt.noshort, "lax",
        (FStar_Getopt.ZeroArgs ((fun uu____1456  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Run the lax-type checker only (admit all verification conditions)");
      (FStar_Getopt.noshort, "load",
        (FStar_Getopt.OneArg (((fun s  -> String s)), "[module]")),
        "Load compiled module");
      (FStar_Getopt.noshort, "log_types",
<<<<<<< HEAD
        (FStar_Getopt.ZeroArgs ((fun uu____1368  -> Bool true))),
        "Print types computed for data/val/let-bindings");
      (FStar_Getopt.noshort, "log_queries",
        (FStar_Getopt.ZeroArgs ((fun uu____1376  -> Bool true))),
=======
        (FStar_Getopt.ZeroArgs ((fun uu____1472  -> Bool true))),
        "Print types computed for data/val/let-bindings");
      (FStar_Getopt.noshort, "log_queries",
        (FStar_Getopt.ZeroArgs ((fun uu____1479  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Log the Z3 queries in several queries-*.smt2 files, as we go");
      (FStar_Getopt.noshort, "max_fuel",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1388 = FStar_Util.int_of_string x in Int uu____1388)),
=======
                let uu____1489 = FStar_Util.int_of_string x in Int uu____1489)),
>>>>>>> origin/guido_tactics
             "[non-negative integer]")),
        "Number of unrolling of recursive functions to try at most (default 8)");
      (FStar_Getopt.noshort, "max_ifuel",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1400 = FStar_Util.int_of_string x in Int uu____1400)),
=======
                let uu____1499 = FStar_Util.int_of_string x in Int uu____1499)),
>>>>>>> origin/guido_tactics
             "[non-negative integer]")),
        "Number of unrolling of inductive datatypes to try at most (default 2)");
      (FStar_Getopt.noshort, "min_fuel",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1412 = FStar_Util.int_of_string x in Int uu____1412)),
             "[non-negative integer]")),
        "Minimum number of unrolling of recursive functions to try (default 1)");
      (FStar_Getopt.noshort, "MLish",
        (FStar_Getopt.ZeroArgs ((fun uu____1420  -> Bool true))),
=======
                let uu____1509 = FStar_Util.int_of_string x in Int uu____1509)),
             "[non-negative integer]")),
        "Minimum number of unrolling of recursive functions to try (default 1)");
      (FStar_Getopt.noshort, "MLish",
        (FStar_Getopt.ZeroArgs ((fun uu____1516  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Trigger various specializations for compiling the F* compiler itself (not meant for user code)");
      (FStar_Getopt.noshort, "n_cores",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1432 = FStar_Util.int_of_string x in Int uu____1432)),
             "[positive integer]")),
        "Maximum number of cores to use for the solver (implies detail_errors = false) (default 1)");
      (FStar_Getopt.noshort, "no_default_includes",
        (FStar_Getopt.ZeroArgs ((fun uu____1440  -> Bool true))),
=======
                let uu____1526 = FStar_Util.int_of_string x in Int uu____1526)),
             "[positive integer]")),
        "Maximum number of cores to use for the solver (implies detail_errors = false) (default 1)");
      (FStar_Getopt.noshort, "no_default_includes",
        (FStar_Getopt.ZeroArgs ((fun uu____1533  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Ignore the default module search paths");
      (FStar_Getopt.noshort, "no_extract",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1452 =
                  let uu____1454 =
                    let uu____1456 = get_no_extract () in x :: uu____1456 in
                  FStar_All.pipe_right uu____1454
                    (FStar_List.map (fun _0_37  -> String _0_37)) in
                List uu____1452)), "[module name]")),
        "Do not extract code from this module");
      (FStar_Getopt.noshort, "no_location_info",
        (FStar_Getopt.ZeroArgs ((fun uu____1467  -> Bool true))),
        "Suppress location information in the generated OCaml output (only relevant with --codegen OCaml)");
      (FStar_Getopt.noshort, "odir",
        (FStar_Getopt.OneArg
           (((fun p  -> let uu____1479 = validate_dir p in Path uu____1479)),
=======
                let uu____1543 =
                  let uu____1545 =
                    let uu____1547 = get_no_extract () in x :: uu____1547 in
                  FStar_All.pipe_right uu____1545
                    (FStar_List.map (fun _0_37  -> String _0_37)) in
                List uu____1543)), "[module name]")),
        "Do not extract code from this module");
      (FStar_Getopt.noshort, "no_location_info",
        (FStar_Getopt.ZeroArgs ((fun uu____1557  -> Bool true))),
        "Suppress location information in the generated OCaml output (only relevant with --codegen OCaml)");
      (FStar_Getopt.noshort, "odir",
        (FStar_Getopt.OneArg
           (((fun p  -> let uu____1567 = validate_dir p in Path uu____1567)),
>>>>>>> origin/guido_tactics
             "[dir]")), "Place output in directory [dir]");
      (FStar_Getopt.noshort, "prims",
        (FStar_Getopt.OneArg (((fun _0_38  -> String _0_38)), "file")), "");
      (FStar_Getopt.noshort, "print_bound_var_types",
<<<<<<< HEAD
        (FStar_Getopt.ZeroArgs ((fun uu____1495  -> Bool true))),
        "Print the types of bound variables");
      (FStar_Getopt.noshort, "print_effect_args",
        (FStar_Getopt.ZeroArgs ((fun uu____1503  -> Bool true))),
        "Print inferred predicate transformers for all computation types");
      (FStar_Getopt.noshort, "print_fuels",
        (FStar_Getopt.ZeroArgs ((fun uu____1511  -> Bool true))),
        "Print the fuel amounts used for each successful query");
      (FStar_Getopt.noshort, "print_full_names",
        (FStar_Getopt.ZeroArgs ((fun uu____1519  -> Bool true))),
        "Print full names of variables");
      (FStar_Getopt.noshort, "print_implicits",
        (FStar_Getopt.ZeroArgs ((fun uu____1527  -> Bool true))),
        "Print implicit arguments");
      (FStar_Getopt.noshort, "print_universes",
        (FStar_Getopt.ZeroArgs ((fun uu____1535  -> Bool true))),
        "Print universes");
      (FStar_Getopt.noshort, "print_z3_statistics",
        (FStar_Getopt.ZeroArgs ((fun uu____1543  -> Bool true))),
        "Print Z3 statistics for each SMT query");
      (FStar_Getopt.noshort, "prn",
        (FStar_Getopt.ZeroArgs ((fun uu____1551  -> Bool true))),
        "Print full names (deprecated; use --print_full_names instead)");
      (FStar_Getopt.noshort, "record_hints",
        (FStar_Getopt.ZeroArgs ((fun uu____1559  -> Bool true))),
        "Record a database of hints for efficient proof replay");
      (FStar_Getopt.noshort, "check_hints",
        (FStar_Getopt.ZeroArgs ((fun uu____1567  -> Bool true))),
=======
        (FStar_Getopt.ZeroArgs ((fun uu____1582  -> Bool true))),
        "Print the types of bound variables");
      (FStar_Getopt.noshort, "print_effect_args",
        (FStar_Getopt.ZeroArgs ((fun uu____1589  -> Bool true))),
        "Print inferred predicate transformers for all computation types");
      (FStar_Getopt.noshort, "print_fuels",
        (FStar_Getopt.ZeroArgs ((fun uu____1596  -> Bool true))),
        "Print the fuel amounts used for each successful query");
      (FStar_Getopt.noshort, "print_full_names",
        (FStar_Getopt.ZeroArgs ((fun uu____1603  -> Bool true))),
        "Print full names of variables");
      (FStar_Getopt.noshort, "print_implicits",
        (FStar_Getopt.ZeroArgs ((fun uu____1610  -> Bool true))),
        "Print implicit arguments");
      (FStar_Getopt.noshort, "print_universes",
        (FStar_Getopt.ZeroArgs ((fun uu____1617  -> Bool true))),
        "Print universes");
      (FStar_Getopt.noshort, "print_z3_statistics",
        (FStar_Getopt.ZeroArgs ((fun uu____1624  -> Bool true))),
        "Print Z3 statistics for each SMT query");
      (FStar_Getopt.noshort, "prn",
        (FStar_Getopt.ZeroArgs ((fun uu____1631  -> Bool true))),
        "Print full names (deprecated; use --print_full_names instead)");
      (FStar_Getopt.noshort, "record_hints",
        (FStar_Getopt.ZeroArgs ((fun uu____1638  -> Bool true))),
        "Record a database of hints for efficient proof replay");
      (FStar_Getopt.noshort, "check_hints",
        (FStar_Getopt.ZeroArgs ((fun uu____1645  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Check new hints for replayability");
      (FStar_Getopt.noshort, "reuse_hint_for",
        (FStar_Getopt.OneArg
           (((fun _0_39  -> String _0_39)),
             "top-level name in the current module")),
        "Optimistically, attempt using the recorded hint for 'f' when trying to verify some other term 'g'");
      (FStar_Getopt.noshort, "show_signatures",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1587 =
                  let uu____1589 =
                    let uu____1591 = get_show_signatures () in x ::
                      uu____1591 in
                  FStar_All.pipe_right uu____1589
                    (FStar_List.map (fun _0_40  -> String _0_40)) in
                List uu____1587)), "[module name]")),
        "Show the checked signatures for all top-level symbols in the module");
      (FStar_Getopt.noshort, "silent",
        (FStar_Getopt.ZeroArgs ((fun uu____1602  -> Bool true))), " ");
=======
                let uu____1663 =
                  let uu____1665 =
                    let uu____1667 = get_show_signatures () in x ::
                      uu____1667 in
                  FStar_All.pipe_right uu____1665
                    (FStar_List.map (fun _0_40  -> String _0_40)) in
                List uu____1663)), "[module name]")),
        "Show the checked signatures for all top-level symbols in the module");
      (FStar_Getopt.noshort, "silent",
        (FStar_Getopt.ZeroArgs ((fun uu____1677  -> Bool true))), " ");
>>>>>>> origin/guido_tactics
      (FStar_Getopt.noshort, "smt",
        (FStar_Getopt.OneArg (((fun _0_41  -> Path _0_41)), "[path]")),
        "Path to the SMT solver (usually Z3, but could be any SMT2-compatible solver)");
      (FStar_Getopt.noshort, "smtencoding.elim_box",
        (FStar_Getopt.OneArg
           ((string_as_bool "smtencoding.elim_box"), "true|false")),
        "Toggle a peephole optimization that eliminates redundant uses of boxing/unboxing in the SMT encoding (default 'false')");
      (FStar_Getopt.noshort, "smtencoding.nl_arith_repr",
        (FStar_Getopt.OneArg
           (((fun _0_42  -> String _0_42)), "native|wrapped|boxwrap")),
        "Control the representation of non-linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap' use 'Prims.op_Multiply, Prims.op_Division, Prims.op_Modulus'; \n\t\tif 'native' use '*, div, mod';\n\t\tif 'wrapped' use '_mul, _div, _mod : Int*Int -> Int'; \n\t\t(default 'boxwrap')");
      (FStar_Getopt.noshort, "smtencoding.l_arith_repr",
        (FStar_Getopt.OneArg
           (((fun _0_43  -> String _0_43)), "native|boxwrap")),
        "Toggle the representation of linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap', use 'Prims.op_Addition, Prims.op_Subtraction, Prims.op_Minus'; \n\t\tif 'native', use '+, -, -'; \n\t\t(default 'boxwrap')");
      (FStar_Getopt.noshort, "split_cases",
        (FStar_Getopt.OneArg
           (((fun n1  ->
<<<<<<< HEAD
                let uu____1646 = FStar_Util.int_of_string n1 in
                Int uu____1646)), "[positive integer]")),
        "Partition VC of a match into groups of [n] cases");
      (FStar_Getopt.noshort, "timing",
        (FStar_Getopt.ZeroArgs ((fun uu____1654  -> Bool true))),
        "Print the time it takes to verify each top-level definition");
      (FStar_Getopt.noshort, "trace_error",
        (FStar_Getopt.ZeroArgs ((fun uu____1662  -> Bool true))),
        "Don't print an error message; show an exception trace instead");
      (FStar_Getopt.noshort, "ugly",
        (FStar_Getopt.ZeroArgs ((fun uu____1670  -> Bool true))),
        "Emit output formatted for debugging");
      (FStar_Getopt.noshort, "unthrottle_inductives",
        (FStar_Getopt.ZeroArgs ((fun uu____1678  -> Bool true))),
        "Let the SMT solver unfold inductive types to arbitrary depths (may affect verifier performance)");
      (FStar_Getopt.noshort, "use_eq_at_higher_order",
        (FStar_Getopt.ZeroArgs ((fun uu____1686  -> Bool true))),
        "Use equality constraints when comparing higher-order types (Temporary)");
      (FStar_Getopt.noshort, "use_hints",
        (FStar_Getopt.ZeroArgs ((fun uu____1694  -> Bool true))),
        "Use a previously recorded hints database for proof replay");
      (FStar_Getopt.noshort, "no_tactics",
        (FStar_Getopt.ZeroArgs ((fun uu____1702  -> Bool true))),
=======
                let uu____1719 = FStar_Util.int_of_string n1 in
                Int uu____1719)), "[positive integer]")),
        "Partition VC of a match into groups of [n] cases");
      (FStar_Getopt.noshort, "timing",
        (FStar_Getopt.ZeroArgs ((fun uu____1726  -> Bool true))),
        "Print the time it takes to verify each top-level definition");
      (FStar_Getopt.noshort, "trace_error",
        (FStar_Getopt.ZeroArgs ((fun uu____1733  -> Bool true))),
        "Don't print an error message; show an exception trace instead");
      (FStar_Getopt.noshort, "ugly",
        (FStar_Getopt.ZeroArgs ((fun uu____1740  -> Bool true))),
        "Emit output formatted for debugging");
      (FStar_Getopt.noshort, "unthrottle_inductives",
        (FStar_Getopt.ZeroArgs ((fun uu____1747  -> Bool true))),
        "Let the SMT solver unfold inductive types to arbitrary depths (may affect verifier performance)");
      (FStar_Getopt.noshort, "use_eq_at_higher_order",
        (FStar_Getopt.ZeroArgs ((fun uu____1754  -> Bool true))),
        "Use equality constraints when comparing higher-order types (Temporary)");
      (FStar_Getopt.noshort, "use_hints",
        (FStar_Getopt.ZeroArgs ((fun uu____1761  -> Bool true))),
        "Use a previously recorded hints database for proof replay");
      (FStar_Getopt.noshort, "no_tactics",
        (FStar_Getopt.ZeroArgs ((fun uu____1768  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Do not run the tactic engine before discharging a VC");
      (FStar_Getopt.noshort, "using_facts_from",
        (FStar_Getopt.OneArg (cons_using_facts_from, "[namespace | fact id]")),
        "Implies --z3refresh; prunes the context to include facts from the given namespace of fact id (multiple uses of this option will prune the context to include those facts that match any of the provided namespaces / fact ids");
      (FStar_Getopt.noshort, "verify_all",
<<<<<<< HEAD
        (FStar_Getopt.ZeroArgs ((fun uu____1718  -> Bool true))),
=======
        (FStar_Getopt.ZeroArgs ((fun uu____1783  -> Bool true))),
>>>>>>> origin/guido_tactics
        "With automatic dependencies, verify all the dependencies, not just the files passed on the command-line.");
      (FStar_Getopt.noshort, "verify_module",
        (FStar_Getopt.OneArg (cons_verify_module, "[module name]")),
        "Name of the module to verify");
      (FStar_Getopt.noshort, "__temp_no_proj",
        (FStar_Getopt.OneArg
           (((fun x  ->
<<<<<<< HEAD
                let uu____1738 =
                  let uu____1740 =
                    let uu____1742 = get___temp_no_proj () in x :: uu____1742 in
                  FStar_All.pipe_right uu____1740
                    (FStar_List.map (fun _0_44  -> String _0_44)) in
                List uu____1738)), "[module name]")),
        "Don't generate projectors for this module");
      ('v', "version",
        (FStar_Getopt.ZeroArgs
           ((fun uu____1754  ->
               display_version (); FStar_All.exit (Prims.parse_int "0")))),
        "Display version number");
      (FStar_Getopt.noshort, "warn_default_effects",
        (FStar_Getopt.ZeroArgs ((fun uu____1763  -> Bool true))),
=======
                let uu____1801 =
                  let uu____1803 =
                    let uu____1805 = get___temp_no_proj () in x :: uu____1805 in
                  FStar_All.pipe_right uu____1803
                    (FStar_List.map (fun _0_44  -> String _0_44)) in
                List uu____1801)), "[module name]")),
        "Don't generate projectors for this module");
      ('v', "version",
        (FStar_Getopt.ZeroArgs
           ((fun uu____1815  ->
               display_version (); FStar_All.exit (Prims.parse_int "0")))),
        "Display version number");
      (FStar_Getopt.noshort, "warn_default_effects",
        (FStar_Getopt.ZeroArgs ((fun uu____1823  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Warn when (a -> b) is desugared to (a -> Tot b)");
      (FStar_Getopt.noshort, "z3cliopt",
        (FStar_Getopt.OneArg
           (((fun s  ->
<<<<<<< HEAD
                let uu____1775 =
                  let uu____1777 =
                    let uu____1779 = get_z3cliopt () in
                    FStar_List.append uu____1779 [s] in
                  FStar_All.pipe_right uu____1777
                    (FStar_List.map (fun _0_45  -> String _0_45)) in
                List uu____1775)), "[option]")), "Z3 command line options");
      (FStar_Getopt.noshort, "z3refresh",
        (FStar_Getopt.ZeroArgs ((fun uu____1790  -> Bool true))),
=======
                let uu____1833 =
                  let uu____1835 =
                    let uu____1837 = get_z3cliopt () in
                    FStar_List.append uu____1837 [s] in
                  FStar_All.pipe_right uu____1835
                    (FStar_List.map (fun _0_45  -> String _0_45)) in
                List uu____1833)), "[option]")), "Z3 command line options");
      (FStar_Getopt.noshort, "z3refresh",
        (FStar_Getopt.ZeroArgs ((fun uu____1847  -> Bool true))),
>>>>>>> origin/guido_tactics
        "Restart Z3 after each query; useful for ensuring proof robustness");
      (FStar_Getopt.noshort, "z3rlimit",
        (FStar_Getopt.OneArg
           (((fun s  ->
<<<<<<< HEAD
                let uu____1802 = FStar_Util.int_of_string s in Int uu____1802)),
=======
                let uu____1857 = FStar_Util.int_of_string s in Int uu____1857)),
>>>>>>> origin/guido_tactics
             "[positive integer]")),
        "Set the Z3 per-query resource limit (default 5 units, taking roughtly 5s)");
      (FStar_Getopt.noshort, "z3rlimit_factor",
        (FStar_Getopt.OneArg
           (((fun s  ->
<<<<<<< HEAD
                let uu____1814 = FStar_Util.int_of_string s in Int uu____1814)),
=======
                let uu____1867 = FStar_Util.int_of_string s in Int uu____1867)),
>>>>>>> origin/guido_tactics
             "[positive integer]")),
        "Set the Z3 per-query resource limit multiplier. This is useful when, say, regenerating hints and you want to be more lax. (default 1)");
      (FStar_Getopt.noshort, "z3seed",
        (FStar_Getopt.OneArg
           (((fun s  ->
<<<<<<< HEAD
                let uu____1826 = FStar_Util.int_of_string s in Int uu____1826)),
             "[positive integer]")), "Set the Z3 random seed (default 0)");
      (FStar_Getopt.noshort, "z3timeout",
        (FStar_Getopt.OneArg
           (((fun s  ->
                FStar_Util.print_string
                  "Warning: z3timeout ignored; use z3rlimit instead\n";
                (let uu____1840 = FStar_Util.int_of_string s in
                 Int uu____1840))), "[positive integer]")),
        "Set the Z3 per-query (soft) timeout to [t] seconds (default 5)");
      (FStar_Getopt.noshort, "__no_positivity",
        (FStar_Getopt.ZeroArgs ((fun uu____1848  -> Bool true))),
        "Don't check positivity of inductive types")] in
    let uu____1854 = FStar_List.map mk_spec specs1 in
=======
                let uu____1877 = FStar_Util.int_of_string s in Int uu____1877)),
             "[positive integer]")), "Set the Z3 random seed (default 0)");
      (FStar_Getopt.noshort, "__no_positivity",
        (FStar_Getopt.ZeroArgs ((fun uu____1884  -> Bool true))),
        "Don't check positivity of inductive types")] in
    let uu____1890 = FStar_List.map mk_spec specs1 in
>>>>>>> origin/guido_tactics
    ('h', "help",
      (FStar_Getopt.ZeroArgs
         (fun x  ->
            display_usage_aux specs1; FStar_All.exit (Prims.parse_int "0"))),
<<<<<<< HEAD
      "Display this information") :: uu____1854
=======
      "Display this information") :: uu____1890
>>>>>>> origin/guido_tactics
and parse_codegen: Prims.string -> Prims.string =
  fun s  ->
    match s with
    | "Kremlin" -> s
    | "OCaml" -> s
    | "FSharp" -> s
<<<<<<< HEAD
    | uu____1877 ->
        (FStar_Util.print_string "Wrong argument to codegen flag\n";
         (let uu____1880 = specs () in display_usage_aux uu____1880);
         FStar_All.exit (Prims.parse_int "1"))
and string_as_bool: Prims.string -> Prims.string -> option_val =
  fun option_name  ->
    fun uu___55_1888  ->
      match uu___55_1888 with
      | "true" -> Bool true
      | "false" -> Bool false
      | uu____1889 ->
          (FStar_Util.print1 "Wrong argument to %s\n" option_name;
           (let uu____1892 = specs () in display_usage_aux uu____1892);
=======
    | uu____1911 ->
        (FStar_Util.print_string "Wrong argument to codegen flag\n";
         (let uu____1914 = specs () in display_usage_aux uu____1914);
         FStar_All.exit (Prims.parse_int "1"))
and string_as_bool: Prims.string -> Prims.string -> option_val =
  fun option_name  ->
    fun uu___55_1922  ->
      match uu___55_1922 with
      | "true" -> Bool true
      | "false" -> Bool false
      | uu____1923 ->
          (FStar_Util.print1 "Wrong argument to %s\n" option_name;
           (let uu____1926 = specs () in display_usage_aux uu____1926);
>>>>>>> origin/guido_tactics
           FStar_All.exit (Prims.parse_int "1"))
and validate_dir: Prims.string -> Prims.string =
  fun p  -> FStar_Util.mkdir false p; p
let docs: Prims.unit -> (Prims.string* Prims.string) Prims.list =
<<<<<<< HEAD
  fun uu____1906  ->
    let uu____1907 = specs () in
    FStar_List.map
      (fun uu____1926  ->
         match uu____1926 with
         | (uu____1934,name,uu____1936,doc) -> (name, doc)) uu____1907
let settable: Prims.string -> Prims.bool =
  fun uu___56_1942  ->
    match uu___56_1942 with
=======
  fun uu____1941  ->
    let uu____1942 = specs () in
    FStar_List.map
      (fun uu____1956  ->
         match uu____1956 with
         | (uu____1964,name,uu____1966,doc) -> (name, doc)) uu____1942
let settable: Prims.string -> Prims.bool =
  fun uu___56_1973  ->
    match uu___56_1973 with
>>>>>>> origin/guido_tactics
    | "admit_smt_queries" -> true
    | "debug" -> true
    | "debug_level" -> true
    | "detail_errors" -> true
    | "eager_inference" -> true
    | "hide_genident_nums" -> true
    | "hide_uvar_nums" -> true
    | "hint_info" -> true
    | "initial_fuel" -> true
    | "initial_ifuel" -> true
    | "inline_arith" -> true
    | "lax" -> true
    | "log_types" -> true
    | "log_queries" -> true
    | "max_fuel" -> true
    | "max_ifuel" -> true
    | "min_fuel" -> true
    | "ugly" -> true
    | "print_bound_var_types" -> true
    | "print_effect_args" -> true
    | "print_fuels" -> true
    | "print_full_names" -> true
    | "print_implicits" -> true
    | "print_universes" -> true
    | "print_z3_statistics" -> true
    | "prn" -> true
    | "show_signatures" -> true
    | "silent" -> true
    | "smtencoding.elim_box" -> true
    | "smtencoding.nl_arith_repr" -> true
    | "smtencoding.l_arith_repr" -> true
    | "split_cases" -> true
    | "timing" -> true
    | "trace_error" -> true
    | "unthrottle_inductives" -> true
    | "use_eq_at_higher_order" -> true
    | "no_tactics" -> true
    | "using_facts_from" -> true
    | "__temp_no_proj" -> true
    | "reuse_hint_for" -> true
    | "z3rlimit_factor" -> true
    | "z3rlimit" -> true
    | "z3refresh" -> true
<<<<<<< HEAD
    | uu____1943 -> false
=======
    | uu____1974 -> false
>>>>>>> origin/guido_tactics
let resettable: Prims.string -> Prims.bool =
  fun s  -> ((settable s) || (s = "z3seed")) || (s = "z3cliopt")
let all_specs: FStar_Getopt.opt Prims.list = specs ()
let settable_specs:
  (FStar_BaseTypes.char* Prims.string* Prims.unit FStar_Getopt.opt_variant*
    Prims.string) Prims.list
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
<<<<<<< HEAD
       (fun uu____1971  ->
          match uu____1971 with
          | (uu____1977,x,uu____1979,uu____1980) -> settable x))
=======
       (fun uu____1998  ->
          match uu____1998 with
          | (uu____2004,x,uu____2006,uu____2007) -> settable x))
>>>>>>> origin/guido_tactics
let resettable_specs:
  (FStar_BaseTypes.char* Prims.string* Prims.unit FStar_Getopt.opt_variant*
    Prims.string) Prims.list
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
<<<<<<< HEAD
       (fun uu____2006  ->
          match uu____2006 with
          | (uu____2012,x,uu____2014,uu____2015) -> resettable x))
let display_usage: Prims.unit -> Prims.unit =
  fun uu____2020  ->
    let uu____2021 = specs () in display_usage_aux uu____2021
let fstar_home: Prims.unit -> Prims.string =
  fun uu____2030  ->
    let uu____2031 = get_fstar_home () in
    match uu____2031 with
=======
       (fun uu____2028  ->
          match uu____2028 with
          | (uu____2034,x,uu____2036,uu____2037) -> resettable x))
let display_usage: Prims.unit -> Prims.unit =
  fun uu____2043  ->
    let uu____2044 = specs () in display_usage_aux uu____2044
let fstar_home: Prims.unit -> Prims.string =
  fun uu____2054  ->
    let uu____2055 = get_fstar_home () in
    match uu____2055 with
>>>>>>> origin/guido_tactics
    | None  ->
        let x = FStar_Util.get_exec_dir () in
        let x1 = Prims.strcat x "/.." in
        (set_option' ("fstar_home", (String x1)); x1)
    | Some x -> x
exception File_argument of Prims.string
let uu___is_File_argument: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with
<<<<<<< HEAD
    | File_argument uu____2043 -> true
    | uu____2044 -> false
let __proj__File_argument__item__uu___: Prims.exn -> Prims.string =
  fun projectee  ->
    match projectee with | File_argument uu____2051 -> uu____2051
=======
    | File_argument uu____2068 -> true
    | uu____2069 -> false
let __proj__File_argument__item__uu___: Prims.exn -> Prims.string =
  fun projectee  ->
    match projectee with | File_argument uu____2077 -> uu____2077
>>>>>>> origin/guido_tactics
let set_options: options -> Prims.string -> FStar_Getopt.parse_cmdline_res =
  fun o  ->
    fun s  ->
      let specs1 =
        match o with
        | Set  -> settable_specs
        | Reset  -> resettable_specs
        | Restore  -> all_specs in
      try
        if s = ""
        then FStar_Getopt.Success
        else
          FStar_Getopt.parse_string specs1
            (fun s1  -> raise (File_argument s1)) s
      with
      | File_argument s1 ->
<<<<<<< HEAD
          let uu____2083 =
            FStar_Util.format1 "File %s is not a valid option" s1 in
          FStar_Getopt.Error uu____2083
let file_list_: Prims.string Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let parse_cmd_line:
  Prims.unit -> (FStar_Getopt.parse_cmdline_res* Prims.string Prims.list) =
  fun uu____2094  ->
    let res =
      let uu____2096 = specs () in
      FStar_Getopt.parse_cmdline uu____2096
        (fun i  ->
           let uu____2101 =
             let uu____2103 = FStar_ST.read file_list_ in
             FStar_List.append uu____2103 [i] in
           FStar_ST.write file_list_ uu____2101) in
    let uu____2111 =
      let uu____2113 = FStar_ST.read file_list_ in
      FStar_List.map FStar_Common.try_convert_file_name_to_mixed uu____2113 in
    (res, uu____2111)
let file_list: Prims.unit -> Prims.string Prims.list =
  fun uu____2122  -> FStar_ST.read file_list_
=======
          let uu____2105 =
            FStar_Util.format1 "File %s is not a valid option" s1 in
          FStar_Getopt.Error uu____2105
let file_list_: Prims.string Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let parse_cmd_line:
  Prims.unit -> (FStar_Getopt.parse_cmdline_res* Prims.string Prims.list) =
  fun uu____2117  ->
    let res =
      let uu____2119 = specs () in
      FStar_Getopt.parse_cmdline uu____2119
        (fun i  ->
           let uu____2122 =
             let uu____2124 = FStar_ST.read file_list_ in
             FStar_List.append uu____2124 [i] in
           FStar_ST.write file_list_ uu____2122) in
    let uu____2132 =
      let uu____2134 = FStar_ST.read file_list_ in
      FStar_List.map FStar_Common.try_convert_file_name_to_mixed uu____2134 in
    (res, uu____2132)
let file_list: Prims.unit -> Prims.string Prims.list =
  fun uu____2144  -> FStar_ST.read file_list_
>>>>>>> origin/guido_tactics
let restore_cmd_line_options: Prims.bool -> FStar_Getopt.parse_cmdline_res =
  fun should_clear  ->
    let old_verify_module = get_verify_module () in
    if should_clear then clear () else init ();
    (let r =
<<<<<<< HEAD
       let uu____2134 = specs () in
       FStar_Getopt.parse_cmdline uu____2134 (fun x  -> ()) in
     (let uu____2139 =
        let uu____2142 =
          let uu____2143 =
            FStar_List.map (fun _0_46  -> String _0_46) old_verify_module in
          List uu____2143 in
        ("verify_module", uu____2142) in
      set_option' uu____2139);
     r)
let should_verify: Prims.string -> Prims.bool =
  fun m  ->
    let uu____2148 = get_lax () in
    if uu____2148
    then false
    else
      (let uu____2150 = get_verify_all () in
       if uu____2150
       then true
       else
         (let uu____2152 = get_verify_module () in
          match uu____2152 with
          | [] ->
              let uu____2154 = file_list () in
=======
       let uu____2157 = specs () in
       FStar_Getopt.parse_cmdline uu____2157 (fun x  -> ()) in
     (let uu____2161 =
        let uu____2164 =
          let uu____2165 =
            FStar_List.map (fun _0_46  -> String _0_46) old_verify_module in
          List uu____2165 in
        ("verify_module", uu____2164) in
      set_option' uu____2161);
     r)
let should_verify: Prims.string -> Prims.bool =
  fun m  ->
    let uu____2171 = get_lax () in
    if uu____2171
    then false
    else
      (let uu____2173 = get_verify_all () in
       if uu____2173
       then true
       else
         (let uu____2175 = get_verify_module () in
          match uu____2175 with
          | [] ->
              let uu____2177 = file_list () in
>>>>>>> origin/guido_tactics
              FStar_List.existsML
                (fun f  ->
                   let f1 = FStar_Util.basename f in
                   let f2 =
<<<<<<< HEAD
                     let uu____2162 =
                       let uu____2163 =
                         let uu____2164 =
                           let uu____2165 = FStar_Util.get_file_extension f1 in
                           FStar_String.length uu____2165 in
                         (FStar_String.length f1) - uu____2164 in
                       uu____2163 - (Prims.parse_int "1") in
                     FStar_String.substring f1 (Prims.parse_int "0")
                       uu____2162 in
                   (FStar_String.lowercase f2) = m) uu____2154
          | l -> FStar_List.contains (FStar_String.lowercase m) l))
let dont_gen_projectors: Prims.string -> Prims.bool =
  fun m  ->
    let uu____2175 = get___temp_no_proj () in
    FStar_List.contains m uu____2175
let should_print_message: Prims.string -> Prims.bool =
  fun m  ->
    let uu____2180 = should_verify m in
    if uu____2180 then m <> "Prims" else false
let include_path: Prims.unit -> Prims.string Prims.list =
  fun uu____2185  ->
    let uu____2186 = get_no_default_includes () in
    if uu____2186
=======
                     let uu____2182 =
                       let uu____2183 =
                         let uu____2184 =
                           let uu____2185 = FStar_Util.get_file_extension f1 in
                           FStar_String.length uu____2185 in
                         (FStar_String.length f1) - uu____2184 in
                       uu____2183 - (Prims.parse_int "1") in
                     FStar_String.substring f1 (Prims.parse_int "0")
                       uu____2182 in
                   (FStar_String.lowercase f2) = m) uu____2177
          | l -> FStar_List.contains (FStar_String.lowercase m) l))
let dont_gen_projectors: Prims.string -> Prims.bool =
  fun m  ->
    let uu____2200 = get___temp_no_proj () in
    FStar_List.contains m uu____2200
let should_print_message: Prims.string -> Prims.bool =
  fun m  ->
    let uu____2206 = should_verify m in
    if uu____2206 then m <> "Prims" else false
let include_path: Prims.unit -> Prims.string Prims.list =
  fun uu____2212  ->
    let uu____2213 = get_no_default_includes () in
    if uu____2213
>>>>>>> origin/guido_tactics
    then get_include ()
    else
      (let h = fstar_home () in
       let defs = universe_include_path_base_dirs in
<<<<<<< HEAD
       let uu____2192 =
         let uu____2194 =
           FStar_All.pipe_right defs
             (FStar_List.map (fun x  -> Prims.strcat h x)) in
         FStar_All.pipe_right uu____2194
           (FStar_List.filter FStar_Util.file_exists) in
       let uu____2202 =
         let uu____2204 = get_include () in
         FStar_List.append uu____2204 ["."] in
       FStar_List.append uu____2192 uu____2202)
let find_file: Prims.string -> Prims.string option =
  fun filename  ->
    let uu____2210 = FStar_Util.is_path_absolute filename in
    if uu____2210
    then (if FStar_Util.file_exists filename then Some filename else None)
    else
      (let uu____2215 =
         let uu____2217 = include_path () in FStar_List.rev uu____2217 in
       FStar_Util.find_map uu____2215
=======
       let uu____2219 =
         let uu____2221 =
           FStar_All.pipe_right defs
             (FStar_List.map (fun x  -> Prims.strcat h x)) in
         FStar_All.pipe_right uu____2221
           (FStar_List.filter FStar_Util.file_exists) in
       let uu____2228 =
         let uu____2230 = get_include () in
         FStar_List.append uu____2230 ["."] in
       FStar_List.append uu____2219 uu____2228)
let find_file: Prims.string -> Prims.string option =
  fun filename  ->
    let uu____2237 = FStar_Util.is_path_absolute filename in
    if uu____2237
    then (if FStar_Util.file_exists filename then Some filename else None)
    else
      (let uu____2242 =
         let uu____2244 = include_path () in FStar_List.rev uu____2244 in
       FStar_Util.find_map uu____2242
>>>>>>> origin/guido_tactics
         (fun p  ->
            let path = FStar_Util.join_paths p filename in
            if FStar_Util.file_exists path then Some path else None))
let prims: Prims.unit -> Prims.string =
<<<<<<< HEAD
  fun uu____2227  ->
    let uu____2228 = get_prims () in
    match uu____2228 with
    | None  ->
        let filename = "prims.fst" in
        let uu____2231 = find_file filename in
        (match uu____2231 with
         | Some result -> result
         | None  ->
             let uu____2234 =
               let uu____2235 =
                 FStar_Util.format1
                   "unable to find required file \"%s\" in the module search path.\n"
                   filename in
               FStar_Util.Failure uu____2235 in
             raise uu____2234)
    | Some x -> x
let prims_basename: Prims.unit -> Prims.string =
  fun uu____2239  ->
    let uu____2240 = prims () in FStar_Util.basename uu____2240
let pervasives: Prims.unit -> Prims.string =
  fun uu____2243  ->
    let filename = "FStar.Pervasives.fst" in
    let uu____2245 = find_file filename in
    match uu____2245 with
    | Some result -> result
    | None  ->
        let uu____2248 =
          let uu____2249 =
            FStar_Util.format1
              "unable to find required file \"%s\" in the module search path.\n"
              filename in
          FStar_Util.Failure uu____2249 in
        raise uu____2248
let pervasives_basename: Prims.unit -> Prims.string =
  fun uu____2252  ->
    let uu____2253 = pervasives () in FStar_Util.basename uu____2253
let prepend_output_dir: Prims.string -> Prims.string =
  fun fname  ->
    let uu____2257 = get_odir () in
    match uu____2257 with
=======
  fun uu____2253  ->
    let uu____2254 = get_prims () in
    match uu____2254 with
    | None  ->
        let filename = "prims.fst" in
        let uu____2257 = find_file filename in
        (match uu____2257 with
         | Some result -> result
         | None  ->
             let uu____2260 =
               let uu____2261 =
                 FStar_Util.format1
                   "unable to find required file \"%s\" in the module search path.\n"
                   filename in
               FStar_Util.Failure uu____2261 in
             raise uu____2260)
    | Some x -> x
let prims_basename: Prims.unit -> Prims.string =
  fun uu____2266  ->
    let uu____2267 = prims () in FStar_Util.basename uu____2267
let pervasives: Prims.unit -> Prims.string =
  fun uu____2271  ->
    let filename = "FStar.Pervasives.fst" in
    let uu____2273 = find_file filename in
    match uu____2273 with
    | Some result -> result
    | None  ->
        let uu____2276 =
          let uu____2277 =
            FStar_Util.format1
              "unable to find required file \"%s\" in the module search path.\n"
              filename in
          FStar_Util.Failure uu____2277 in
        raise uu____2276
let pervasives_basename: Prims.unit -> Prims.string =
  fun uu____2281  ->
    let uu____2282 = pervasives () in FStar_Util.basename uu____2282
let prepend_output_dir: Prims.string -> Prims.string =
  fun fname  ->
    let uu____2287 = get_odir () in
    match uu____2287 with
>>>>>>> origin/guido_tactics
    | None  -> fname
    | Some x -> Prims.strcat x (Prims.strcat "/" fname)
let __temp_no_proj: Prims.string -> Prims.bool =
  fun s  ->
<<<<<<< HEAD
    let uu____2263 = get___temp_no_proj () in
    FStar_All.pipe_right uu____2263 (FStar_List.contains s)
let admit_smt_queries: Prims.unit -> Prims.bool =
  fun uu____2268  -> get_admit_smt_queries ()
let check_hints: Prims.unit -> Prims.bool =
  fun uu____2271  -> get_check_hints ()
let codegen: Prims.unit -> Prims.string option =
  fun uu____2275  -> get_codegen ()
let codegen_libs: Prims.unit -> Prims.string Prims.list Prims.list =
  fun uu____2280  ->
    let uu____2281 = get_codegen_lib () in
    FStar_All.pipe_right uu____2281
      (FStar_List.map (fun x  -> FStar_Util.split x "."))
let debug_any: Prims.unit -> Prims.bool =
  fun uu____2291  -> let uu____2292 = get_debug () in uu____2292 <> []
=======
    let uu____2294 = get___temp_no_proj () in
    FStar_All.pipe_right uu____2294 (FStar_List.contains s)
let admit_smt_queries: Prims.unit -> Prims.bool =
  fun uu____2300  -> get_admit_smt_queries ()
let check_hints: Prims.unit -> Prims.bool =
  fun uu____2304  -> get_check_hints ()
let codegen: Prims.unit -> Prims.string option =
  fun uu____2309  -> get_codegen ()
let codegen_libs: Prims.unit -> Prims.string Prims.list Prims.list =
  fun uu____2315  ->
    let uu____2316 = get_codegen_lib () in
    FStar_All.pipe_right uu____2316
      (FStar_List.map (fun x  -> FStar_Util.split x "."))
let debug_any: Prims.unit -> Prims.bool =
  fun uu____2326  -> let uu____2327 = get_debug () in uu____2327 <> []
>>>>>>> origin/guido_tactics
let debug_at_level: Prims.string -> debug_level_t -> Prims.bool =
  fun modul  ->
    fun level  ->
      ((modul = "") ||
<<<<<<< HEAD
         (let uu____2302 = get_debug () in
          FStar_All.pipe_right uu____2302 (FStar_List.contains modul)))
        && (debug_level_geq level)
let dep: Prims.unit -> Prims.string option = fun uu____2308  -> get_dep ()
let detail_errors: Prims.unit -> Prims.bool =
  fun uu____2311  -> get_detail_errors ()
let doc: Prims.unit -> Prims.bool = fun uu____2314  -> get_doc ()
let dump_module: Prims.string -> Prims.bool =
  fun s  ->
    let uu____2318 = get_dump_module () in
    FStar_All.pipe_right uu____2318 (FStar_List.contains s)
let eager_inference: Prims.unit -> Prims.bool =
  fun uu____2323  -> get_eager_inference ()
let explicit_deps: Prims.unit -> Prims.bool =
  fun uu____2326  -> get_explicit_deps ()
let extract_all: Prims.unit -> Prims.bool =
  fun uu____2329  -> get_extract_all ()
let fs_typ_app: Prims.string -> Prims.bool =
  fun filename  ->
    let uu____2333 = FStar_ST.read light_off_files in
    FStar_List.contains filename uu____2333
let full_context_dependency: Prims.unit -> Prims.bool =
  fun uu____2340  -> true
let hide_genident_nums: Prims.unit -> Prims.bool =
  fun uu____2343  -> get_hide_genident_nums ()
let hide_uvar_nums: Prims.unit -> Prims.bool =
  fun uu____2346  -> get_hide_uvar_nums ()
let hint_info: Prims.unit -> Prims.bool = fun uu____2349  -> get_hint_info ()
let ide: Prims.unit -> Prims.bool = fun uu____2352  -> get_ide ()
let indent: Prims.unit -> Prims.bool = fun uu____2355  -> get_indent ()
let initial_fuel: Prims.unit -> Prims.int =
  fun uu____2358  ->
    let uu____2359 = get_initial_fuel () in
    let uu____2360 = get_max_fuel () in Prims.min uu____2359 uu____2360
let initial_ifuel: Prims.unit -> Prims.int =
  fun uu____2363  ->
    let uu____2364 = get_initial_ifuel () in
    let uu____2365 = get_max_ifuel () in Prims.min uu____2364 uu____2365
let interactive: Prims.unit -> Prims.bool =
  fun uu____2368  -> (get_in ()) || (get_ide ())
let lax: Prims.unit -> Prims.bool = fun uu____2371  -> get_lax ()
let legacy_interactive: Prims.unit -> Prims.bool =
  fun uu____2374  -> get_in ()
let log_queries: Prims.unit -> Prims.bool =
  fun uu____2377  -> get_log_queries ()
let log_types: Prims.unit -> Prims.bool = fun uu____2380  -> get_log_types ()
let max_fuel: Prims.unit -> Prims.int = fun uu____2383  -> get_max_fuel ()
let max_ifuel: Prims.unit -> Prims.int = fun uu____2386  -> get_max_ifuel ()
let min_fuel: Prims.unit -> Prims.int = fun uu____2389  -> get_min_fuel ()
let ml_ish: Prims.unit -> Prims.bool = fun uu____2392  -> get_MLish ()
let set_ml_ish: Prims.unit -> Prims.unit =
  fun uu____2395  -> set_option "MLish" (Bool true)
let n_cores: Prims.unit -> Prims.int = fun uu____2398  -> get_n_cores ()
let no_default_includes: Prims.unit -> Prims.bool =
  fun uu____2401  -> get_no_default_includes ()
let no_extract: Prims.string -> Prims.bool =
  fun s  ->
    let uu____2405 = get_no_extract () in
    FStar_All.pipe_right uu____2405 (FStar_List.contains s)
let no_location_info: Prims.unit -> Prims.bool =
  fun uu____2410  -> get_no_location_info ()
let output_dir: Prims.unit -> Prims.string option =
  fun uu____2414  -> get_odir ()
let ugly: Prims.unit -> Prims.bool = fun uu____2417  -> get_ugly ()
let print_bound_var_types: Prims.unit -> Prims.bool =
  fun uu____2420  -> get_print_bound_var_types ()
let print_effect_args: Prims.unit -> Prims.bool =
  fun uu____2423  -> get_print_effect_args ()
let print_fuels: Prims.unit -> Prims.bool =
  fun uu____2426  -> get_print_fuels ()
let print_implicits: Prims.unit -> Prims.bool =
  fun uu____2429  -> get_print_implicits ()
let print_real_names: Prims.unit -> Prims.bool =
  fun uu____2432  -> (get_prn ()) || (get_print_full_names ())
let print_universes: Prims.unit -> Prims.bool =
  fun uu____2435  -> get_print_universes ()
let print_z3_statistics: Prims.unit -> Prims.bool =
  fun uu____2438  -> get_print_z3_statistics ()
let record_hints: Prims.unit -> Prims.bool =
  fun uu____2441  -> get_record_hints ()
let reuse_hint_for: Prims.unit -> Prims.string option =
  fun uu____2445  -> get_reuse_hint_for ()
let silent: Prims.unit -> Prims.bool = fun uu____2448  -> get_silent ()
let smtencoding_elim_box: Prims.unit -> Prims.bool =
  fun uu____2451  -> get_smtencoding_elim_box ()
let smtencoding_nl_arith_native: Prims.unit -> Prims.bool =
  fun uu____2454  ->
    let uu____2455 = get_smtencoding_nl_arith_repr () in
    uu____2455 = "native"
let smtencoding_nl_arith_wrapped: Prims.unit -> Prims.bool =
  fun uu____2458  ->
    let uu____2459 = get_smtencoding_nl_arith_repr () in
    uu____2459 = "wrapped"
let smtencoding_nl_arith_default: Prims.unit -> Prims.bool =
  fun uu____2462  ->
    let uu____2463 = get_smtencoding_nl_arith_repr () in
    uu____2463 = "boxwrap"
let smtencoding_l_arith_native: Prims.unit -> Prims.bool =
  fun uu____2466  ->
    let uu____2467 = get_smtencoding_l_arith_repr () in uu____2467 = "native"
let smtencoding_l_arith_default: Prims.unit -> Prims.bool =
  fun uu____2470  ->
    let uu____2471 = get_smtencoding_l_arith_repr () in
    uu____2471 = "boxwrap"
let split_cases: Prims.unit -> Prims.int =
  fun uu____2474  -> get_split_cases ()
let timing: Prims.unit -> Prims.bool = fun uu____2477  -> get_timing ()
let trace_error: Prims.unit -> Prims.bool =
  fun uu____2480  -> get_trace_error ()
let unthrottle_inductives: Prims.unit -> Prims.bool =
  fun uu____2483  -> get_unthrottle_inductives ()
let use_eq_at_higher_order: Prims.unit -> Prims.bool =
  fun uu____2486  -> get_use_eq_at_higher_order ()
let use_hints: Prims.unit -> Prims.bool = fun uu____2489  -> get_use_hints ()
let use_tactics: Prims.unit -> Prims.bool =
  fun uu____2492  -> get_use_tactics ()
let using_facts_from: Prims.unit -> Prims.string Prims.list option =
  fun uu____2497  -> get_using_facts_from ()
let verify_all: Prims.unit -> Prims.bool =
  fun uu____2500  -> get_verify_all ()
let verify_module: Prims.unit -> Prims.string Prims.list =
  fun uu____2504  -> get_verify_module ()
let warn_default_effects: Prims.unit -> Prims.bool =
  fun uu____2507  -> get_warn_default_effects ()
let z3_exe: Prims.unit -> Prims.string =
  fun uu____2510  ->
    let uu____2511 = get_smt () in
    match uu____2511 with | None  -> FStar_Platform.exe "z3" | Some s -> s
let z3_cliopt: Prims.unit -> Prims.string Prims.list =
  fun uu____2517  -> get_z3cliopt ()
let z3_refresh: Prims.unit -> Prims.bool =
  fun uu____2520  -> get_z3refresh ()
let z3_rlimit: Prims.unit -> Prims.int = fun uu____2523  -> get_z3rlimit ()
let z3_rlimit_factor: Prims.unit -> Prims.int =
  fun uu____2526  -> get_z3rlimit_factor ()
let z3_seed: Prims.unit -> Prims.int = fun uu____2529  -> get_z3seed ()
let z3_timeout: Prims.unit -> Prims.int = fun uu____2532  -> get_z3timeout ()
let no_positivity: Prims.unit -> Prims.bool =
  fun uu____2535  -> get_no_positivity ()
let should_extract: Prims.string -> Prims.bool =
  fun m  ->
    (let uu____2541 = no_extract m in Prims.op_Negation uu____2541) &&
      ((extract_all ()) ||
         (let uu____2544 = get_extract_module () in
          match uu____2544 with
          | [] ->
              let uu____2546 = get_extract_namespace () in
              (match uu____2546 with
=======
         (let uu____2338 = get_debug () in
          FStar_All.pipe_right uu____2338 (FStar_List.contains modul)))
        && (debug_level_geq level)
let dep: Prims.unit -> Prims.string option = fun uu____2345  -> get_dep ()
let detail_errors: Prims.unit -> Prims.bool =
  fun uu____2349  -> get_detail_errors ()
let doc: Prims.unit -> Prims.bool = fun uu____2353  -> get_doc ()
let dump_module: Prims.string -> Prims.bool =
  fun s  ->
    let uu____2358 = get_dump_module () in
    FStar_All.pipe_right uu____2358 (FStar_List.contains s)
let eager_inference: Prims.unit -> Prims.bool =
  fun uu____2364  -> get_eager_inference ()
let explicit_deps: Prims.unit -> Prims.bool =
  fun uu____2368  -> get_explicit_deps ()
let extract_all: Prims.unit -> Prims.bool =
  fun uu____2372  -> get_extract_all ()
let fs_typ_app: Prims.string -> Prims.bool =
  fun filename  ->
    let uu____2377 = FStar_ST.read light_off_files in
    FStar_List.contains filename uu____2377
let full_context_dependency: Prims.unit -> Prims.bool =
  fun uu____2385  -> true
let hide_genident_nums: Prims.unit -> Prims.bool =
  fun uu____2389  -> get_hide_genident_nums ()
let hide_uvar_nums: Prims.unit -> Prims.bool =
  fun uu____2393  -> get_hide_uvar_nums ()
let hint_info: Prims.unit -> Prims.bool = fun uu____2397  -> get_hint_info ()
let ide: Prims.unit -> Prims.bool = fun uu____2401  -> get_ide ()
let indent: Prims.unit -> Prims.bool = fun uu____2405  -> get_indent ()
let initial_fuel: Prims.unit -> Prims.int =
  fun uu____2409  ->
    let uu____2410 = get_initial_fuel () in
    let uu____2411 = get_max_fuel () in Prims.min uu____2410 uu____2411
let initial_ifuel: Prims.unit -> Prims.int =
  fun uu____2415  ->
    let uu____2416 = get_initial_ifuel () in
    let uu____2417 = get_max_ifuel () in Prims.min uu____2416 uu____2417
let interactive: Prims.unit -> Prims.bool =
  fun uu____2421  -> (get_in ()) || (get_ide ())
let lax: Prims.unit -> Prims.bool = fun uu____2425  -> get_lax ()
let load: Prims.unit -> Prims.string option = fun uu____2430  -> get_load ()
let legacy_interactive: Prims.unit -> Prims.bool =
  fun uu____2434  -> get_in ()
let log_queries: Prims.unit -> Prims.bool =
  fun uu____2438  -> get_log_queries ()
let log_types: Prims.unit -> Prims.bool = fun uu____2442  -> get_log_types ()
let max_fuel: Prims.unit -> Prims.int = fun uu____2446  -> get_max_fuel ()
let max_ifuel: Prims.unit -> Prims.int = fun uu____2450  -> get_max_ifuel ()
let min_fuel: Prims.unit -> Prims.int = fun uu____2454  -> get_min_fuel ()
let ml_ish: Prims.unit -> Prims.bool = fun uu____2458  -> get_MLish ()
let set_ml_ish: Prims.unit -> Prims.unit =
  fun uu____2462  -> set_option "MLish" (Bool true)
let n_cores: Prims.unit -> Prims.int = fun uu____2466  -> get_n_cores ()
let no_default_includes: Prims.unit -> Prims.bool =
  fun uu____2470  -> get_no_default_includes ()
let no_extract: Prims.string -> Prims.bool =
  fun s  ->
    let uu____2475 = get_no_extract () in
    FStar_All.pipe_right uu____2475 (FStar_List.contains s)
let no_location_info: Prims.unit -> Prims.bool =
  fun uu____2481  -> get_no_location_info ()
let output_dir: Prims.unit -> Prims.string option =
  fun uu____2486  -> get_odir ()
let ugly: Prims.unit -> Prims.bool = fun uu____2490  -> get_ugly ()
let print_bound_var_types: Prims.unit -> Prims.bool =
  fun uu____2494  -> get_print_bound_var_types ()
let print_effect_args: Prims.unit -> Prims.bool =
  fun uu____2498  -> get_print_effect_args ()
let print_fuels: Prims.unit -> Prims.bool =
  fun uu____2502  -> get_print_fuels ()
let print_implicits: Prims.unit -> Prims.bool =
  fun uu____2506  -> get_print_implicits ()
let print_real_names: Prims.unit -> Prims.bool =
  fun uu____2510  -> (get_prn ()) || (get_print_full_names ())
let print_universes: Prims.unit -> Prims.bool =
  fun uu____2514  -> get_print_universes ()
let print_z3_statistics: Prims.unit -> Prims.bool =
  fun uu____2518  -> get_print_z3_statistics ()
let record_hints: Prims.unit -> Prims.bool =
  fun uu____2522  -> get_record_hints ()
let reuse_hint_for: Prims.unit -> Prims.string option =
  fun uu____2527  -> get_reuse_hint_for ()
let silent: Prims.unit -> Prims.bool = fun uu____2531  -> get_silent ()
let smtencoding_elim_box: Prims.unit -> Prims.bool =
  fun uu____2535  -> get_smtencoding_elim_box ()
let smtencoding_nl_arith_native: Prims.unit -> Prims.bool =
  fun uu____2539  ->
    let uu____2540 = get_smtencoding_nl_arith_repr () in
    uu____2540 = "native"
let smtencoding_nl_arith_wrapped: Prims.unit -> Prims.bool =
  fun uu____2544  ->
    let uu____2545 = get_smtencoding_nl_arith_repr () in
    uu____2545 = "wrapped"
let smtencoding_nl_arith_default: Prims.unit -> Prims.bool =
  fun uu____2549  ->
    let uu____2550 = get_smtencoding_nl_arith_repr () in
    uu____2550 = "boxwrap"
let smtencoding_l_arith_native: Prims.unit -> Prims.bool =
  fun uu____2554  ->
    let uu____2555 = get_smtencoding_l_arith_repr () in uu____2555 = "native"
let smtencoding_l_arith_default: Prims.unit -> Prims.bool =
  fun uu____2559  ->
    let uu____2560 = get_smtencoding_l_arith_repr () in
    uu____2560 = "boxwrap"
let split_cases: Prims.unit -> Prims.int =
  fun uu____2564  -> get_split_cases ()
let timing: Prims.unit -> Prims.bool = fun uu____2568  -> get_timing ()
let trace_error: Prims.unit -> Prims.bool =
  fun uu____2572  -> get_trace_error ()
let unthrottle_inductives: Prims.unit -> Prims.bool =
  fun uu____2576  -> get_unthrottle_inductives ()
let use_eq_at_higher_order: Prims.unit -> Prims.bool =
  fun uu____2580  -> get_use_eq_at_higher_order ()
let use_hints: Prims.unit -> Prims.bool = fun uu____2584  -> get_use_hints ()
let use_tactics: Prims.unit -> Prims.bool =
  fun uu____2588  -> get_use_tactics ()
let using_facts_from: Prims.unit -> Prims.string Prims.list option =
  fun uu____2594  -> get_using_facts_from ()
let verify_all: Prims.unit -> Prims.bool =
  fun uu____2598  -> get_verify_all ()
let verify_module: Prims.unit -> Prims.string Prims.list =
  fun uu____2603  -> get_verify_module ()
let warn_default_effects: Prims.unit -> Prims.bool =
  fun uu____2607  -> get_warn_default_effects ()
let z3_exe: Prims.unit -> Prims.string =
  fun uu____2611  ->
    let uu____2612 = get_smt () in
    match uu____2612 with | None  -> FStar_Platform.exe "z3" | Some s -> s
let z3_cliopt: Prims.unit -> Prims.string Prims.list =
  fun uu____2619  -> get_z3cliopt ()
let z3_refresh: Prims.unit -> Prims.bool =
  fun uu____2623  -> get_z3refresh ()
let z3_rlimit: Prims.unit -> Prims.int = fun uu____2627  -> get_z3rlimit ()
let z3_rlimit_factor: Prims.unit -> Prims.int =
  fun uu____2631  -> get_z3rlimit_factor ()
let z3_seed: Prims.unit -> Prims.int = fun uu____2635  -> get_z3seed ()
let no_positivity: Prims.unit -> Prims.bool =
  fun uu____2639  -> get_no_positivity ()
let should_extract: Prims.string -> Prims.bool =
  fun m  ->
    (let uu____2644 = no_extract m in Prims.op_Negation uu____2644) &&
      ((extract_all ()) ||
         (let uu____2645 = get_extract_module () in
          match uu____2645 with
          | [] ->
              let uu____2647 = get_extract_namespace () in
              (match uu____2647 with
>>>>>>> origin/guido_tactics
               | [] -> true
               | ns ->
                   FStar_Util.for_some
                     (FStar_Util.starts_with (FStar_String.lowercase m)) ns)
          | l -> FStar_List.contains (FStar_String.lowercase m) l))