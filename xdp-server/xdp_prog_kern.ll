; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.icmphdr_common = type { i8, i8, i16 }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, %union.anon.0, i32, %union.anon.1, %union.anon.2, %union.anon.3, i16, i16, [6 x i8], [6 x i8] }
%union.anon.0 = type { i16 }
%union.anon.1 = type { i32 }
%union.anon.2 = type { [4 x i32] }
%union.anon.3 = type { [4 x i32] }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 6, i32 4, i32 16, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@tx_port = dso_local global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 256, i32 0 }, section "maps", align 4, !dbg !52
@redirect_params = dso_local global %struct.bpf_map_def { i32 1, i32 6, i32 6, i32 1, i32 0 }, section "maps", align 4, !dbg !62
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !64
@llvm.compiler.used = appending global [9 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @redirect_params to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_icmp_echo_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_map_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_router_func to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_icmp_echo_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_icmp_echo" !dbg !140 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !153, metadata !DIExpression()), !dbg !232
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !233
  %4 = load i32, i32* %3, align 4, !dbg !233, !tbaa !234
  %5 = zext i32 %4 to i64, !dbg !239
  %6 = inttoptr i64 %5 to i8*, !dbg !240
  call void @llvm.dbg.value(metadata i8* %6, metadata !154, metadata !DIExpression()), !dbg !232
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !241
  %8 = load i32, i32* %7, align 4, !dbg !241, !tbaa !242
  %9 = zext i32 %8 to i64, !dbg !243
  %10 = inttoptr i64 %9 to i8*, !dbg !244
  call void @llvm.dbg.value(metadata i8* %10, metadata !155, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata i16 0, metadata !222, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !232
  call void @llvm.dbg.value(metadata i32 2, metadata !230, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata i8* %10, metadata !156, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !161, metadata !DIExpression(DW_OP_deref)), !dbg !232
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !245, metadata !DIExpression()) #8, !dbg !254
  call void @llvm.dbg.value(metadata i8* %6, metadata !252, metadata !DIExpression()) #8, !dbg !254
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !253, metadata !DIExpression()) #8, !dbg !254
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !256, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i8* %6, metadata !268, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !269, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !270, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i8* %10, metadata !271, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i32 14, metadata !272, metadata !DIExpression()) #8, !dbg !281
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !283
  %12 = icmp ugt i8* %11, %6, !dbg !285
  br i1 %12, label %88, label %13, !dbg !286

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !271, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i8* %11, metadata !156, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata i8* %11, metadata !273, metadata !DIExpression()) #8, !dbg !281
  %14 = getelementptr inbounds i8, i8* %10, i64 12, !dbg !287
  %15 = bitcast i8* %14 to i16*, !dbg !287
  call void @llvm.dbg.value(metadata i16 undef, metadata !279, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i32 0, metadata !280, metadata !DIExpression()) #8, !dbg !281
  %16 = load i16, i16* %15, align 1, !dbg !281, !tbaa !288
  call void @llvm.dbg.value(metadata i16 %16, metadata !279, metadata !DIExpression()) #8, !dbg !281
  %17 = inttoptr i64 %5 to %struct.vlan_hdr*
  call void @llvm.dbg.value(metadata i16 %16, metadata !290, metadata !DIExpression()) #8, !dbg !295
  %18 = icmp eq i16 %16, 129, !dbg !301
  %19 = icmp eq i16 %16, -22392, !dbg !302
  %20 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %18) #8
  %21 = or i1 %19, %20, !dbg !302
  %22 = xor i1 %21, true, !dbg !303
  %23 = getelementptr i8, i8* %10, i64 18
  %24 = bitcast i8* %23 to %struct.vlan_hdr*
  %25 = icmp ugt %struct.vlan_hdr* %24, %17
  %26 = select i1 %22, i1 true, i1 %25, !dbg !304
  br i1 %26, label %44, label %27, !dbg !304

27:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i16 undef, metadata !279, metadata !DIExpression()) #8, !dbg !281
  %28 = getelementptr i8, i8* %10, i64 16, !dbg !305
  %29 = bitcast i8* %28 to i16*, !dbg !305
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %24, metadata !273, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i32 1, metadata !280, metadata !DIExpression()) #8, !dbg !281
  %30 = load i16, i16* %29, align 1, !dbg !281, !tbaa !288
  call void @llvm.dbg.value(metadata i16 %30, metadata !279, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i16 %30, metadata !290, metadata !DIExpression()) #8, !dbg !295
  %31 = icmp eq i16 %30, 129, !dbg !301
  %32 = icmp eq i16 %30, -22392, !dbg !302
  %33 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %31) #8
  %34 = or i1 %32, %33, !dbg !302
  %35 = xor i1 %34, true, !dbg !303
  %36 = getelementptr i8, i8* %10, i64 22
  %37 = bitcast i8* %36 to %struct.vlan_hdr*
  %38 = icmp ugt %struct.vlan_hdr* %37, %17
  %39 = select i1 %35, i1 true, i1 %38, !dbg !304
  br i1 %39, label %44, label %40, !dbg !304

40:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i16 undef, metadata !279, metadata !DIExpression()) #8, !dbg !281
  %41 = getelementptr i8, i8* %10, i64 20, !dbg !305
  %42 = bitcast i8* %41 to i16*, !dbg !305
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %37, metadata !273, metadata !DIExpression()) #8, !dbg !281
  call void @llvm.dbg.value(metadata i32 2, metadata !280, metadata !DIExpression()) #8, !dbg !281
  %43 = load i16, i16* %42, align 1, !dbg !281, !tbaa !288
  call void @llvm.dbg.value(metadata i16 %43, metadata !279, metadata !DIExpression()) #8, !dbg !281
  br label %44

44:                                               ; preds = %13, %27, %40
  %45 = phi i8* [ %11, %13 ], [ %23, %27 ], [ %36, %40 ], !dbg !281
  %46 = phi i16 [ %16, %13 ], [ %30, %27 ], [ %43, %40 ], !dbg !281
  call void @llvm.dbg.value(metadata i8* %45, metadata !156, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata i16 %46, metadata !170, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !232
  switch i16 %46, label %88 [
    i16 8, label %47
    i16 -8826, label %63
  ], !dbg !306

47:                                               ; preds = %44
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !173, metadata !DIExpression(DW_OP_deref)), !dbg !232
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !307, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.value(metadata i8* %6, metadata !313, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !314, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.value(metadata i8* %45, metadata !315, metadata !DIExpression()), !dbg !317
  %48 = getelementptr inbounds i8, i8* %45, i64 20, !dbg !321
  %49 = icmp ugt i8* %48, %6, !dbg !323
  br i1 %49, label %88, label %50, !dbg !324

50:                                               ; preds = %47
  %51 = load i8, i8* %45, align 4, !dbg !325
  %52 = shl i8 %51, 2, !dbg !326
  %53 = and i8 %52, 60, !dbg !326
  call void @llvm.dbg.value(metadata i8 %53, metadata !316, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !317
  %54 = icmp ult i8 %53, 20, !dbg !327
  br i1 %54, label %88, label %55, !dbg !329

55:                                               ; preds = %50
  %56 = zext i8 %53 to i64
  call void @llvm.dbg.value(metadata i64 %56, metadata !316, metadata !DIExpression()), !dbg !317
  %57 = getelementptr i8, i8* %45, i64 %56, !dbg !330
  %58 = icmp ugt i8* %57, %6, !dbg !332
  br i1 %58, label %88, label %59, !dbg !333

59:                                               ; preds = %55
  call void @llvm.dbg.value(metadata i8* %57, metadata !156, metadata !DIExpression()), !dbg !232
  %60 = getelementptr inbounds i8, i8* %45, i64 9, !dbg !334
  %61 = load i8, i8* %60, align 1, !dbg !334, !tbaa !335
  call void @llvm.dbg.value(metadata i8 %61, metadata !171, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !232
  %62 = icmp eq i8 %61, 1, !dbg !337
  br i1 %62, label %72, label %88, !dbg !339

63:                                               ; preds = %44
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !340, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i8* %6, metadata !346, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !347, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i8* %45, metadata !348, metadata !DIExpression()), !dbg !349
  %64 = getelementptr inbounds i8, i8* %45, i64 40, !dbg !353
  %65 = bitcast i8* %64 to %struct.ipv6hdr*, !dbg !353
  %66 = inttoptr i64 %5 to %struct.ipv6hdr*, !dbg !355
  %67 = icmp ugt %struct.ipv6hdr* %65, %66, !dbg !356
  br i1 %67, label %88, label %68, !dbg !357

68:                                               ; preds = %63
  call void @llvm.dbg.value(metadata i8* %45, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i8* %64, metadata !156, metadata !DIExpression()), !dbg !232
  %69 = getelementptr inbounds i8, i8* %45, i64 6, !dbg !358
  %70 = load i8, i8* %69, align 2, !dbg !358, !tbaa !359
  call void @llvm.dbg.value(metadata i8 %70, metadata !171, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !232
  %71 = icmp eq i8 %70, 58, !dbg !362
  br i1 %71, label %72, label %88, !dbg !364

72:                                               ; preds = %68, %59
  %73 = phi i1 [ true, %59 ], [ false, %68 ]
  %74 = phi i1 [ false, %59 ], [ true, %68 ]
  %75 = phi i8* [ %57, %59 ], [ %64, %68 ], !dbg !365
  call void @llvm.dbg.value(metadata i8* %75, metadata !156, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !366, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.value(metadata i8* %6, metadata !372, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.value(metadata %struct.icmphdr_common** undef, metadata !373, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.value(metadata i8* %75, metadata !374, metadata !DIExpression()), !dbg !375
  %76 = getelementptr inbounds i8, i8* %75, i64 4, !dbg !377
  %77 = bitcast i8* %76 to %struct.icmphdr_common*, !dbg !377
  %78 = inttoptr i64 %5 to %struct.icmphdr_common*, !dbg !379
  %79 = icmp ugt %struct.icmphdr_common* %77, %78, !dbg !380
  br i1 %79, label %88, label %80, !dbg !381

80:                                               ; preds = %72
  call void @llvm.dbg.value(metadata i8* %75, metadata !374, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.value(metadata %struct.icmphdr_common* %77, metadata !156, metadata !DIExpression()), !dbg !232
  %81 = load i8, i8* %75, align 2, !dbg !382, !tbaa !383
  call void @llvm.dbg.value(metadata i8 %81, metadata !172, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !232
  %82 = icmp eq i8 %81, 8
  %83 = select i1 %73, i1 %82, i1 false, !dbg !385
  br i1 %83, label %87, label %84, !dbg !385

84:                                               ; preds = %80
  call void @llvm.dbg.value(metadata i8 %81, metadata !172, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !232
  %85 = icmp eq i8 %81, -128
  %86 = select i1 %74, i1 %85, i1 false, !dbg !387
  br i1 %86, label %87, label %88, !dbg !387

87:                                               ; preds = %84, %80
  call void @llvm.dbg.value(metadata %struct.ethhdr* undef, metadata !161, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.value(metadata i32 3, metadata !230, metadata !DIExpression()), !dbg !232
  br label %88, !dbg !389

88:                                               ; preds = %44, %72, %63, %55, %50, %47, %1, %84, %68, %59, %87
  %89 = phi i32 [ 2, %59 ], [ 3, %87 ], [ 2, %84 ], [ 2, %68 ], [ 2, %1 ], [ 2, %47 ], [ 2, %50 ], [ 2, %55 ], [ 2, %63 ], [ 2, %72 ], [ 2, %44 ], !dbg !232
  call void @llvm.dbg.value(metadata i32 %89, metadata !230, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.label(metadata !231), !dbg !390
  %90 = bitcast i32* %2 to i8*, !dbg !391
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %90), !dbg !391
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #8, !dbg !391
  call void @llvm.dbg.value(metadata i32 %89, metadata !397, metadata !DIExpression()) #8, !dbg !391
  store i32 %89, i32* %2, align 4, !tbaa !406
  call void @llvm.dbg.value(metadata i32* %2, metadata !397, metadata !DIExpression(DW_OP_deref)) #8, !dbg !391
  %91 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* noundef nonnull %90) #8, !dbg !407
  call void @llvm.dbg.value(metadata i8* %91, metadata !398, metadata !DIExpression()) #8, !dbg !391
  %92 = icmp eq i8* %91, null, !dbg !408
  br i1 %92, label %106, label %93, !dbg !410

93:                                               ; preds = %88
  call void @llvm.dbg.value(metadata i8* %91, metadata !398, metadata !DIExpression()) #8, !dbg !391
  %94 = bitcast i8* %91 to i64*, !dbg !411
  %95 = load i64, i64* %94, align 8, !dbg !412, !tbaa !413
  %96 = add i64 %95, 1, !dbg !412
  store i64 %96, i64* %94, align 8, !dbg !412, !tbaa !413
  %97 = load i32, i32* %3, align 4, !dbg !416, !tbaa !234
  %98 = load i32, i32* %7, align 4, !dbg !417, !tbaa !242
  %99 = sub i32 %97, %98, !dbg !418
  %100 = zext i32 %99 to i64, !dbg !419
  %101 = getelementptr inbounds i8, i8* %91, i64 8, !dbg !420
  %102 = bitcast i8* %101 to i64*, !dbg !420
  %103 = load i64, i64* %102, align 8, !dbg !421, !tbaa !422
  %104 = add i64 %103, %100, !dbg !421
  store i64 %104, i64* %102, align 8, !dbg !421, !tbaa !422
  %105 = load i32, i32* %2, align 4, !dbg !423, !tbaa !406
  call void @llvm.dbg.value(metadata i32 %105, metadata !397, metadata !DIExpression()) #8, !dbg !391
  br label %106, !dbg !424

106:                                              ; preds = %88, %93
  %107 = phi i32 [ %105, %93 ], [ 0, %88 ], !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %90), !dbg !425
  ret i32 %107, !dbg !426
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_redirect" !dbg !427 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !429, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 undef, metadata !430, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !437
  call void @llvm.dbg.value(metadata i32 undef, metadata !431, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !437
  call void @llvm.dbg.value(metadata i32 2, metadata !435, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i32 undef, metadata !432, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !437
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !433, metadata !DIExpression(DW_OP_deref)), !dbg !437
  call void @llvm.dbg.value(metadata i32 undef, metadata !434, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.label(metadata !436), !dbg !438
  %3 = bitcast i32* %2 to i8*, !dbg !439
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3), !dbg !439
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #8, !dbg !439
  call void @llvm.dbg.value(metadata i32 2, metadata !397, metadata !DIExpression()) #8, !dbg !439
  store i32 2, i32* %2, align 4, !tbaa !406
  call void @llvm.dbg.value(metadata i32* %2, metadata !397, metadata !DIExpression(DW_OP_deref)) #8, !dbg !439
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* noundef nonnull %3) #8, !dbg !441
  call void @llvm.dbg.value(metadata i8* %4, metadata !398, metadata !DIExpression()) #8, !dbg !439
  %5 = icmp eq i8* %4, null, !dbg !442
  br i1 %5, label %21, label %6, !dbg !443

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !444
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !445
  call void @llvm.dbg.value(metadata i8* %4, metadata !398, metadata !DIExpression()) #8, !dbg !439
  %9 = bitcast i8* %4 to i64*, !dbg !446
  %10 = load i64, i64* %9, align 8, !dbg !447, !tbaa !413
  %11 = add i64 %10, 1, !dbg !447
  store i64 %11, i64* %9, align 8, !dbg !447, !tbaa !413
  %12 = load i32, i32* %8, align 4, !dbg !448, !tbaa !234
  %13 = load i32, i32* %7, align 4, !dbg !449, !tbaa !242
  %14 = sub i32 %12, %13, !dbg !450
  %15 = zext i32 %14 to i64, !dbg !451
  %16 = getelementptr inbounds i8, i8* %4, i64 8, !dbg !452
  %17 = bitcast i8* %16 to i64*, !dbg !452
  %18 = load i64, i64* %17, align 8, !dbg !453, !tbaa !422
  %19 = add i64 %18, %15, !dbg !453
  store i64 %19, i64* %17, align 8, !dbg !453, !tbaa !422
  %20 = load i32, i32* %2, align 4, !dbg !454, !tbaa !406
  call void @llvm.dbg.value(metadata i32 %20, metadata !397, metadata !DIExpression()) #8, !dbg !439
  br label %21, !dbg !455

21:                                               ; preds = %1, %6
  %22 = phi i32 [ %20, %6 ], [ 0, %1 ], !dbg !439
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3), !dbg !456
  ret i32 %22, !dbg !457
}

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_func(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp_redirect_map" !dbg !458 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !460, metadata !DIExpression()), !dbg !470
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !471
  %4 = load i32, i32* %3, align 4, !dbg !471, !tbaa !234
  %5 = zext i32 %4 to i64, !dbg !472
  %6 = inttoptr i64 %5 to i8*, !dbg !473
  call void @llvm.dbg.value(metadata i8* %6, metadata !461, metadata !DIExpression()), !dbg !470
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !474
  %8 = load i32, i32* %7, align 4, !dbg !474, !tbaa !242
  %9 = zext i32 %8 to i64, !dbg !475
  %10 = inttoptr i64 %9 to i8*, !dbg !476
  call void @llvm.dbg.value(metadata i8* %10, metadata !462, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i32 2, metadata !466, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i8* %10, metadata !463, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !245, metadata !DIExpression()) #8, !dbg !477
  call void @llvm.dbg.value(metadata i8* %6, metadata !252, metadata !DIExpression()) #8, !dbg !477
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !253, metadata !DIExpression()) #8, !dbg !477
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !256, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i8* %6, metadata !268, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !269, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !270, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i8* %10, metadata !271, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i32 14, metadata !272, metadata !DIExpression()) #8, !dbg !479
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !481
  %12 = icmp ugt i8* %11, %6, !dbg !482
  br i1 %12, label %18, label %13, !dbg !483

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !271, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i8* %11, metadata !463, metadata !DIExpression()), !dbg !470
  %14 = inttoptr i64 %9 to %struct.ethhdr*, !dbg !484
  call void @llvm.dbg.value(metadata i8* %11, metadata !273, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i16 undef, metadata !279, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i32 0, metadata !280, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata i16 undef, metadata !279, metadata !DIExpression()) #8, !dbg !479
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !463, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i16 undef, metadata !465, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !470
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !464, metadata !DIExpression()), !dbg !470
  %15 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 1, i64 0, !dbg !485
  %16 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @redirect_params to i8*), i8* noundef nonnull %15) #8, !dbg !486
  call void @llvm.dbg.value(metadata i8* %16, metadata !467, metadata !DIExpression()), !dbg !470
  %17 = icmp eq i8* %16, null, !dbg !487
  br i1 %17, label %18, label %20, !dbg !489

18:                                               ; preds = %13, %1
  call void @llvm.dbg.value(metadata i32 %22, metadata !466, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.label(metadata !469), !dbg !490
  %19 = bitcast i32* %2 to i8*, !dbg !491
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19), !dbg !491
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #8, !dbg !491
  call void @llvm.dbg.value(metadata i32 %22, metadata !397, metadata !DIExpression()) #8, !dbg !491
  store i32 2, i32* %2, align 4, !tbaa !406
  br label %25, !dbg !493

20:                                               ; preds = %13
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !464, metadata !DIExpression()), !dbg !470
  %21 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 0, i64 0, !dbg !494
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %21, i8* noundef nonnull align 1 dereferenceable(6) %16, i64 6, i1 false), !dbg !494
  %22 = tail call i32 inttoptr (i64 51 to i32 (i8*, i32, i64)*)(i8* noundef bitcast (%struct.bpf_map_def* @tx_port to i8*), i32 noundef 0, i64 noundef 0) #8, !dbg !495
  call void @llvm.dbg.value(metadata i32 %22, metadata !466, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.label(metadata !469), !dbg !490
  %23 = bitcast i32* %2 to i8*, !dbg !491
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23), !dbg !491
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #8, !dbg !491
  call void @llvm.dbg.value(metadata i32 %22, metadata !397, metadata !DIExpression()) #8, !dbg !491
  store i32 %22, i32* %2, align 4, !tbaa !406
  %24 = icmp ugt i32 %22, 4, !dbg !496
  br i1 %24, label %42, label %25, !dbg !493

25:                                               ; preds = %18, %20
  %26 = bitcast i32* %2 to i8*
  call void @llvm.dbg.value(metadata i32* %2, metadata !397, metadata !DIExpression(DW_OP_deref)) #8, !dbg !491
  %27 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* noundef nonnull %26) #8, !dbg !498
  call void @llvm.dbg.value(metadata i8* %27, metadata !398, metadata !DIExpression()) #8, !dbg !491
  %28 = icmp eq i8* %27, null, !dbg !499
  br i1 %28, label %42, label %29, !dbg !500

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i8* %27, metadata !398, metadata !DIExpression()) #8, !dbg !491
  %30 = bitcast i8* %27 to i64*, !dbg !501
  %31 = load i64, i64* %30, align 8, !dbg !502, !tbaa !413
  %32 = add i64 %31, 1, !dbg !502
  store i64 %32, i64* %30, align 8, !dbg !502, !tbaa !413
  %33 = load i32, i32* %3, align 4, !dbg !503, !tbaa !234
  %34 = load i32, i32* %7, align 4, !dbg !504, !tbaa !242
  %35 = sub i32 %33, %34, !dbg !505
  %36 = zext i32 %35 to i64, !dbg !506
  %37 = getelementptr inbounds i8, i8* %27, i64 8, !dbg !507
  %38 = bitcast i8* %37 to i64*, !dbg !507
  %39 = load i64, i64* %38, align 8, !dbg !508, !tbaa !422
  %40 = add i64 %39, %36, !dbg !508
  store i64 %40, i64* %38, align 8, !dbg !508, !tbaa !422
  %41 = load i32, i32* %2, align 4, !dbg !509, !tbaa !406
  call void @llvm.dbg.value(metadata i32 %41, metadata !397, metadata !DIExpression()) #8, !dbg !491
  br label %42, !dbg !510

42:                                               ; preds = %20, %25, %29
  %43 = phi i32 [ 0, %20 ], [ %41, %29 ], [ 0, %25 ], !dbg !491
  %44 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %44), !dbg !511
  ret i32 %43, !dbg !512
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
define dso_local i32 @xdp_router_func(%struct.xdp_md* noundef %0) #0 section "xdp_router" !dbg !513 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.bpf_fib_lookup, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !515, metadata !DIExpression()), !dbg !527
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !528
  %5 = load i32, i32* %4, align 4, !dbg !528, !tbaa !234
  %6 = zext i32 %5 to i64, !dbg !529
  %7 = inttoptr i64 %6 to i8*, !dbg !530
  call void @llvm.dbg.value(metadata i8* %7, metadata !516, metadata !DIExpression()), !dbg !527
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !531
  %9 = load i32, i32* %8, align 4, !dbg !531, !tbaa !242
  %10 = zext i32 %9 to i64, !dbg !532
  %11 = inttoptr i64 %10 to i8*, !dbg !533
  call void @llvm.dbg.value(metadata i8* %11, metadata !517, metadata !DIExpression()), !dbg !527
  %12 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 0, !dbg !534
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %12) #8, !dbg !534
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %3, metadata !518, metadata !DIExpression()), !dbg !535
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(64) %12, i8 0, i64 64, i1 false), !dbg !535
  call void @llvm.dbg.value(metadata i8* %11, metadata !519, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.value(metadata i32 2, metadata !525, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.value(metadata i64 14, metadata !523, metadata !DIExpression()), !dbg !527
  %13 = getelementptr i8, i8* %11, i64 14, !dbg !536
  %14 = icmp ugt i8* %13, %7, !dbg !538
  br i1 %14, label %62, label %15, !dbg !539

15:                                               ; preds = %1
  %16 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !540
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !519, metadata !DIExpression()), !dbg !527
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %16, i64 0, i32 2, !dbg !541
  %18 = load i16, i16* %17, align 1, !dbg !541, !tbaa !542
  call void @llvm.dbg.value(metadata i16 %18, metadata !522, metadata !DIExpression()), !dbg !527
  %19 = icmp eq i16 %18, 8, !dbg !544
  br i1 %19, label %20, label %30, !dbg !546

20:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i8* %13, metadata !521, metadata !DIExpression()), !dbg !527
  %21 = getelementptr i8, i8* %11, i64 34, !dbg !547
  %22 = bitcast i8* %21 to %struct.iphdr*, !dbg !547
  %23 = inttoptr i64 %6 to %struct.iphdr*, !dbg !550
  %24 = icmp ugt %struct.iphdr* %22, %23, !dbg !551
  br i1 %24, label %62, label %25, !dbg !552

25:                                               ; preds = %20
  %26 = bitcast i8* %13 to %struct.iphdr*, !dbg !553
  call void @llvm.dbg.value(metadata %struct.iphdr* %26, metadata !521, metadata !DIExpression()), !dbg !527
  %27 = getelementptr i8, i8* %11, i64 22, !dbg !554
  %28 = load i8, i8* %27, align 4, !dbg !554, !tbaa !556
  %29 = icmp ult i8 %28, 2, !dbg !557
  br i1 %29, label %62, label %42, !dbg !558

30:                                               ; preds = %15
  %31 = icmp eq i16 %18, -8826, !dbg !559
  br i1 %31, label %32, label %62, !dbg !561

32:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i8* %13, metadata !520, metadata !DIExpression()), !dbg !527
  %33 = getelementptr i8, i8* %11, i64 54, !dbg !562
  %34 = bitcast i8* %33 to %struct.ipv6hdr*, !dbg !562
  %35 = inttoptr i64 %6 to %struct.ipv6hdr*, !dbg !565
  %36 = icmp ugt %struct.ipv6hdr* %34, %35, !dbg !566
  br i1 %36, label %62, label %37, !dbg !567

37:                                               ; preds = %32
  %38 = bitcast i8* %13 to %struct.ipv6hdr*, !dbg !568
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %38, metadata !520, metadata !DIExpression()), !dbg !527
  %39 = getelementptr i8, i8* %11, i64 21, !dbg !569
  %40 = load i8, i8* %39, align 1, !dbg !569, !tbaa !571
  %41 = icmp ult i8 %40, 2, !dbg !572
  br i1 %41, label %62, label %42, !dbg !573

42:                                               ; preds = %37, %25
  %43 = phi %struct.iphdr* [ %26, %25 ], [ undef, %37 ]
  %44 = phi %struct.ipv6hdr* [ undef, %25 ], [ %38, %37 ]
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %44, metadata !520, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.value(metadata %struct.iphdr* %43, metadata !521, metadata !DIExpression()), !dbg !527
  %45 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 3, !dbg !574
  %46 = load i32, i32* %45, align 4, !dbg !574, !tbaa !575
  %47 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 5, !dbg !576
  store i32 %46, i32* %47, align 4, !dbg !577, !tbaa !578
  %48 = bitcast %struct.xdp_md* %0 to i8*, !dbg !580
  %49 = call i32 inttoptr (i64 69 to i32 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* noundef %48, %struct.bpf_fib_lookup* noundef nonnull %3, i32 noundef 64, i32 noundef 0) #8, !dbg !581
  call void @llvm.dbg.value(metadata i32 %49, metadata !524, metadata !DIExpression()), !dbg !527
  switch i32 %49, label %62 [
    i32 0, label %50
    i32 1, label %61
    i32 2, label %61
    i32 3, label %61
  ], !dbg !582

50:                                               ; preds = %42
  br i1 %19, label %51, label %55, !dbg !583

51:                                               ; preds = %50
  call void @llvm.dbg.value(metadata %struct.iphdr* %43, metadata !585, metadata !DIExpression()), !dbg !590
  %52 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %43, i64 0, i32 5, !dbg !593
  %53 = load i8, i8* %52, align 4, !dbg !594, !tbaa !556
  %54 = add i8 %53, -1, !dbg !594
  store i8 %54, i8* %52, align 4, !dbg !594, !tbaa !556
  br label %62, !dbg !595

55:                                               ; preds = %50
  %56 = icmp eq i16 %18, -8826, !dbg !596
  br i1 %56, label %57, label %62, !dbg !598

57:                                               ; preds = %55
  %58 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %44, i64 0, i32 4, !dbg !599
  %59 = load i8, i8* %58, align 1, !dbg !600, !tbaa !571
  %60 = add i8 %59, -1, !dbg !600
  store i8 %60, i8* %58, align 1, !dbg !600, !tbaa !571
  br label %62, !dbg !601

61:                                               ; preds = %42, %42, %42
  call void @llvm.dbg.value(metadata i32 1, metadata !525, metadata !DIExpression()), !dbg !527
  br label %62, !dbg !602

62:                                               ; preds = %32, %20, %1, %61, %42, %55, %57, %51, %30, %37, %25
  %63 = phi i32 [ 2, %25 ], [ 2, %42 ], [ 1, %61 ], [ 2, %51 ], [ 2, %57 ], [ 2, %55 ], [ 2, %37 ], [ 2, %30 ], [ 1, %1 ], [ 1, %20 ], [ 1, %32 ], !dbg !527
  call void @llvm.dbg.value(metadata i32 %63, metadata !525, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.label(metadata !526), !dbg !603
  %64 = bitcast i32* %2 to i8*, !dbg !604
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %64), !dbg !604
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #8, !dbg !604
  call void @llvm.dbg.value(metadata i32 %63, metadata !397, metadata !DIExpression()) #8, !dbg !604
  store i32 %63, i32* %2, align 4, !tbaa !406
  call void @llvm.dbg.value(metadata i32* %2, metadata !397, metadata !DIExpression(DW_OP_deref)) #8, !dbg !604
  %65 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* noundef nonnull %64) #8, !dbg !606
  call void @llvm.dbg.value(metadata i8* %65, metadata !398, metadata !DIExpression()) #8, !dbg !604
  %66 = icmp eq i8* %65, null, !dbg !607
  br i1 %66, label %80, label %67, !dbg !608

67:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i8* %65, metadata !398, metadata !DIExpression()) #8, !dbg !604
  %68 = bitcast i8* %65 to i64*, !dbg !609
  %69 = load i64, i64* %68, align 8, !dbg !610, !tbaa !413
  %70 = add i64 %69, 1, !dbg !610
  store i64 %70, i64* %68, align 8, !dbg !610, !tbaa !413
  %71 = load i32, i32* %4, align 4, !dbg !611, !tbaa !234
  %72 = load i32, i32* %8, align 4, !dbg !612, !tbaa !242
  %73 = sub i32 %71, %72, !dbg !613
  %74 = zext i32 %73 to i64, !dbg !614
  %75 = getelementptr inbounds i8, i8* %65, i64 8, !dbg !615
  %76 = bitcast i8* %75 to i64*, !dbg !615
  %77 = load i64, i64* %76, align 8, !dbg !616, !tbaa !422
  %78 = add i64 %77, %74, !dbg !616
  store i64 %78, i64* %76, align 8, !dbg !616, !tbaa !422
  %79 = load i32, i32* %2, align 4, !dbg !617, !tbaa !406
  call void @llvm.dbg.value(metadata i32 %79, metadata !397, metadata !DIExpression()) #8, !dbg !604
  br label %80, !dbg !618

80:                                               ; preds = %62, %67
  %81 = phi i32 [ %79, %67 ], [ 0, %62 ], !dbg !604
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %64), !dbg !619
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %12) #8, !dbg !620
  ret i32 %81, !dbg !621
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define dso_local i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone %0) #5 section "xdp_pass" !dbg !622 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !624, metadata !DIExpression()), !dbg !625
  ret i32 2, !dbg !626
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #6

; Function Attrs: nounwind readnone
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #7

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { mustprogress nofree norecurse nosync nounwind readnone willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!135, !136, !137, !138}
!llvm.ident = !{!139}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !134, line: 16, type: !54, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !45, globals: !51, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/andrzej/projects/xdp-client-server/xdp-server", checksumkind: CSK_MD5, checksum: "0ed10982c98a6be906b9501dcd2fb687")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5431, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "5ad8bc925dae1ec87bbb04b3148b183b")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "9a7f04155c254fef1b7ada5eb82c984c")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!41 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!42 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!43 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!45 = !{!46, !47, !48}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !49, line: 24, baseType: !50)
!49 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !{!0, !52, !62, !64, !70, !78, !87}
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 18, type: !54, isLocal: false, isDefinition: true)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !55, line: 33, size: 160, elements: !56)
!55 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/andrzej/projects/xdp-client-server/xdp-server", checksumkind: CSK_MD5, checksum: "9e37b5f46a8fb7f5ed35ab69309bf15d")
!56 = !{!57, !58, !59, !60, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !54, file: !55, line: 34, baseType: !7, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !54, file: !55, line: 35, baseType: !7, size: 32, offset: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !54, file: !55, line: 36, baseType: !7, size: 32, offset: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !54, file: !55, line: 37, baseType: !7, size: 32, offset: 96)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !54, file: !55, line: 38, baseType: !7, size: 32, offset: 128)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "redirect_params", scope: !2, file: !3, line: 25, type: !54, isLocal: false, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 275, type: !66, isLocal: false, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 32, elements: !68)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !{!69}
!69 = !DISubrange(count: 4)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !72, line: 33, type: !73, isLocal: true, isDefinition: true)
!72 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/andrzej/projects/xdp-client-server/xdp-server", checksumkind: CSK_MD5, checksum: "2601bcf9d7985cb46bfbd904b60f5aaf")
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DISubroutineType(types: !75)
!75 = !{!46, !46, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !72, line: 1254, type: !80, isLocal: true, isDefinition: true)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !46, !84, !85}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !49, line: 27, baseType: !7)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !49, line: 31, baseType: !86)
!86 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !72, line: 1764, type: !89, isLocal: true, isDefinition: true)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DISubroutineType(types: !91)
!91 = !{!83, !46, !92, !83, !84}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !6, line: 6052, size: 512, elements: !94)
!94 = !{!95, !98, !99, !102, !103, !108, !109, !116, !122, !127, !128, !129, !133}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !93, file: !6, line: 6056, baseType: !96, size: 8)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !49, line: 21, baseType: !97)
!97 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !93, file: !6, line: 6059, baseType: !96, size: 8, offset: 8)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !93, file: !6, line: 6060, baseType: !100, size: 16, offset: 16)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !101, line: 25, baseType: !48)
!101 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!102 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !93, file: !6, line: 6061, baseType: !100, size: 16, offset: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, scope: !93, file: !6, line: 6063, baseType: !104, size: 16, offset: 48)
!104 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !93, file: !6, line: 6063, size: 16, elements: !105)
!105 = !{!106, !107}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !104, file: !6, line: 6065, baseType: !48, size: 16)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "mtu_result", scope: !104, file: !6, line: 6068, baseType: !48, size: 16)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !93, file: !6, line: 6073, baseType: !84, size: 32, offset: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, scope: !93, file: !6, line: 6075, baseType: !110, size: 32, offset: 96)
!110 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !93, file: !6, line: 6075, size: 32, elements: !111)
!111 = !{!112, !113, !115}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !110, file: !6, line: 6077, baseType: !96, size: 8)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !110, file: !6, line: 6078, baseType: !114, size: 32)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !101, line: 27, baseType: !84)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !110, file: !6, line: 6081, baseType: !84, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, scope: !93, file: !6, line: 6084, baseType: !117, size: 128, offset: 128)
!117 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !93, file: !6, line: 6084, size: 128, elements: !118)
!118 = !{!119, !120}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !117, file: !6, line: 6085, baseType: !114, size: 32)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !117, file: !6, line: 6086, baseType: !121, size: 128)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 128, elements: !68)
!122 = !DIDerivedType(tag: DW_TAG_member, scope: !93, file: !6, line: 6093, baseType: !123, size: 128, offset: 256)
!123 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !93, file: !6, line: 6093, size: 128, elements: !124)
!124 = !{!125, !126}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !123, file: !6, line: 6094, baseType: !114, size: 32)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !123, file: !6, line: 6095, baseType: !121, size: 128)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !93, file: !6, line: 6099, baseType: !100, size: 16, offset: 384)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !93, file: !6, line: 6100, baseType: !100, size: 16, offset: 400)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !93, file: !6, line: 6101, baseType: !130, size: 48, offset: 416)
!130 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 48, elements: !131)
!131 = !{!132}
!132 = !DISubrange(count: 6)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !93, file: !6, line: 6102, baseType: !130, size: 48, offset: 464)
!134 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/andrzej/projects/xdp-client-server/xdp-server", checksumkind: CSK_MD5, checksum: "0f65d57b07088eec24d5031993b90668")
!135 = !{i32 7, !"Dwarf Version", i32 5}
!136 = !{i32 2, !"Debug Info Version", i32 3}
!137 = !{i32 1, !"wchar_size", i32 4}
!138 = !{i32 7, !"frame-pointer", i32 2}
!139 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!140 = distinct !DISubprogram(name: "xdp_icmp_echo_func", scope: !3, file: !3, line: 49, type: !141, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !152)
!141 = !DISubroutineType(types: !142)
!142 = !{!83, !143}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5442, size: 192, elements: !145)
!145 = !{!146, !147, !148, !149, !150, !151}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !144, file: !6, line: 5443, baseType: !84, size: 32)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !144, file: !6, line: 5444, baseType: !84, size: 32, offset: 32)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !144, file: !6, line: 5445, baseType: !84, size: 32, offset: 64)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !144, file: !6, line: 5447, baseType: !84, size: 32, offset: 96)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !144, file: !6, line: 5448, baseType: !84, size: 32, offset: 128)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !144, file: !6, line: 5450, baseType: !84, size: 32, offset: 160)
!152 = !{!153, !154, !155, !156, !161, !170, !171, !172, !173, !190, !222, !223, !230, !231}
!153 = !DILocalVariable(name: "ctx", arg: 1, scope: !140, file: !3, line: 49, type: !143)
!154 = !DILocalVariable(name: "data_end", scope: !140, file: !3, line: 51, type: !46)
!155 = !DILocalVariable(name: "data", scope: !140, file: !3, line: 52, type: !46)
!156 = !DILocalVariable(name: "nh", scope: !140, file: !3, line: 53, type: !157)
!157 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !158, line: 33, size: 64, elements: !159)
!158 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/andrzej/projects/xdp-client-server/xdp-server", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!159 = !{!160}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !157, file: !158, line: 34, baseType: !46, size: 64)
!161 = !DILocalVariable(name: "eth", scope: !140, file: !3, line: 54, type: !162)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !164, line: 168, size: 112, elements: !165)
!164 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!165 = !{!166, !168, !169}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !163, file: !164, line: 169, baseType: !167, size: 48)
!167 = !DICompositeType(tag: DW_TAG_array_type, baseType: !97, size: 48, elements: !131)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !163, file: !164, line: 170, baseType: !167, size: 48, offset: 48)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !163, file: !164, line: 171, baseType: !100, size: 16, offset: 96)
!170 = !DILocalVariable(name: "eth_type", scope: !140, file: !3, line: 55, type: !83)
!171 = !DILocalVariable(name: "ip_type", scope: !140, file: !3, line: 56, type: !83)
!172 = !DILocalVariable(name: "icmp_type", scope: !140, file: !3, line: 57, type: !83)
!173 = !DILocalVariable(name: "iphdr", scope: !140, file: !3, line: 58, type: !174)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !176, line: 86, size: 160, elements: !177)
!176 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "8776158f5e307e9a8189f0dae4b43df4")
!177 = !{!178, !179, !180, !181, !182, !183, !184, !185, !186, !188, !189}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !175, file: !176, line: 88, baseType: !96, size: 4, flags: DIFlagBitField, extraData: i64 0)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !175, file: !176, line: 89, baseType: !96, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !175, file: !176, line: 96, baseType: !96, size: 8, offset: 8)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !175, file: !176, line: 97, baseType: !100, size: 16, offset: 16)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !175, file: !176, line: 98, baseType: !100, size: 16, offset: 32)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !175, file: !176, line: 99, baseType: !100, size: 16, offset: 48)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !175, file: !176, line: 100, baseType: !96, size: 8, offset: 64)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !175, file: !176, line: 101, baseType: !96, size: 8, offset: 72)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !175, file: !176, line: 102, baseType: !187, size: 16, offset: 80)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !101, line: 31, baseType: !48)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !175, file: !176, line: 103, baseType: !114, size: 32, offset: 96)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !175, file: !176, line: 104, baseType: !114, size: 32, offset: 128)
!190 = !DILocalVariable(name: "ipv6hdr", scope: !140, file: !3, line: 59, type: !191)
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !193, line: 117, size: 320, elements: !194)
!193 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "d13a9e1225644902b024ce986c8e059d")
!194 = !{!195, !196, !197, !201, !202, !203, !204, !221}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !192, file: !193, line: 119, baseType: !96, size: 4, flags: DIFlagBitField, extraData: i64 0)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !192, file: !193, line: 120, baseType: !96, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !192, file: !193, line: 127, baseType: !198, size: 24, offset: 8)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 24, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 3)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !192, file: !193, line: 129, baseType: !100, size: 16, offset: 32)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !192, file: !193, line: 130, baseType: !96, size: 8, offset: 48)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !192, file: !193, line: 131, baseType: !96, size: 8, offset: 56)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !192, file: !193, line: 133, baseType: !205, size: 128, offset: 64)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !206, line: 33, size: 128, elements: !207)
!206 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!207 = !{!208}
!208 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !205, file: !206, line: 40, baseType: !209, size: 128)
!209 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !205, file: !206, line: 34, size: 128, elements: !210)
!210 = !{!211, !215, !219}
!211 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !209, file: !206, line: 35, baseType: !212, size: 128)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 128, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 16)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !209, file: !206, line: 37, baseType: !216, size: 128)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 128, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 8)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !209, file: !206, line: 38, baseType: !220, size: 128)
!220 = !DICompositeType(tag: DW_TAG_array_type, baseType: !114, size: 128, elements: !68)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !192, file: !193, line: 134, baseType: !205, size: 128, offset: 192)
!222 = !DILocalVariable(name: "echo_reply", scope: !140, file: !3, line: 60, type: !48)
!223 = !DILocalVariable(name: "icmphdr", scope: !140, file: !3, line: 62, type: !224)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr_common", file: !158, line: 51, size: 32, elements: !226)
!226 = !{!227, !228, !229}
!227 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !225, file: !158, line: 52, baseType: !96, size: 8)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !225, file: !158, line: 53, baseType: !96, size: 8, offset: 8)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "cksum", scope: !225, file: !158, line: 54, baseType: !187, size: 16, offset: 16)
!230 = !DILocalVariable(name: "action", scope: !140, file: !3, line: 63, type: !84)
!231 = !DILabel(scope: !140, name: "out", file: !3, line: 110)
!232 = !DILocation(line: 0, scope: !140)
!233 = !DILocation(line: 51, column: 38, scope: !140)
!234 = !{!235, !236, i64 4}
!235 = !{!"xdp_md", !236, i64 0, !236, i64 4, !236, i64 8, !236, i64 12, !236, i64 16, !236, i64 20}
!236 = !{!"int", !237, i64 0}
!237 = !{!"omnipotent char", !238, i64 0}
!238 = !{!"Simple C/C++ TBAA"}
!239 = !DILocation(line: 51, column: 27, scope: !140)
!240 = !DILocation(line: 51, column: 19, scope: !140)
!241 = !DILocation(line: 52, column: 34, scope: !140)
!242 = !{!235, !236, i64 0}
!243 = !DILocation(line: 52, column: 23, scope: !140)
!244 = !DILocation(line: 52, column: 15, scope: !140)
!245 = !DILocalVariable(name: "nh", arg: 1, scope: !246, file: !158, line: 124, type: !249)
!246 = distinct !DISubprogram(name: "parse_ethhdr", scope: !158, file: !158, line: 124, type: !247, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !251)
!247 = !DISubroutineType(types: !248)
!248 = !{!83, !249, !46, !250}
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!251 = !{!245, !252, !253}
!252 = !DILocalVariable(name: "data_end", arg: 2, scope: !246, file: !158, line: 125, type: !46)
!253 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !246, file: !158, line: 126, type: !250)
!254 = !DILocation(line: 0, scope: !246, inlinedAt: !255)
!255 = distinct !DILocation(line: 69, column: 13, scope: !140)
!256 = !DILocalVariable(name: "nh", arg: 1, scope: !257, file: !158, line: 79, type: !249)
!257 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !158, file: !158, line: 79, type: !258, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !267)
!258 = !DISubroutineType(types: !259)
!259 = !{!83, !249, !46, !250, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!261 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !158, line: 64, size: 32, elements: !262)
!262 = !{!263}
!263 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !261, file: !158, line: 65, baseType: !264, size: 32)
!264 = !DICompositeType(tag: DW_TAG_array_type, baseType: !48, size: 32, elements: !265)
!265 = !{!266}
!266 = !DISubrange(count: 2)
!267 = !{!256, !268, !269, !270, !271, !272, !273, !279, !280}
!268 = !DILocalVariable(name: "data_end", arg: 2, scope: !257, file: !158, line: 80, type: !46)
!269 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !257, file: !158, line: 81, type: !250)
!270 = !DILocalVariable(name: "vlans", arg: 4, scope: !257, file: !158, line: 82, type: !260)
!271 = !DILocalVariable(name: "eth", scope: !257, file: !158, line: 84, type: !162)
!272 = !DILocalVariable(name: "hdrsize", scope: !257, file: !158, line: 85, type: !83)
!273 = !DILocalVariable(name: "vlh", scope: !257, file: !158, line: 86, type: !274)
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !275, size: 64)
!275 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !158, line: 42, size: 32, elements: !276)
!276 = !{!277, !278}
!277 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !275, file: !158, line: 43, baseType: !100, size: 16)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !275, file: !158, line: 44, baseType: !100, size: 16, offset: 16)
!279 = !DILocalVariable(name: "h_proto", scope: !257, file: !158, line: 87, type: !48)
!280 = !DILocalVariable(name: "i", scope: !257, file: !158, line: 88, type: !83)
!281 = !DILocation(line: 0, scope: !257, inlinedAt: !282)
!282 = distinct !DILocation(line: 129, column: 9, scope: !246, inlinedAt: !255)
!283 = !DILocation(line: 93, column: 14, scope: !284, inlinedAt: !282)
!284 = distinct !DILexicalBlock(scope: !257, file: !158, line: 93, column: 6)
!285 = !DILocation(line: 93, column: 24, scope: !284, inlinedAt: !282)
!286 = !DILocation(line: 93, column: 6, scope: !257, inlinedAt: !282)
!287 = !DILocation(line: 99, column: 17, scope: !257, inlinedAt: !282)
!288 = !{!289, !289, i64 0}
!289 = !{!"short", !237, i64 0}
!290 = !DILocalVariable(name: "h_proto", arg: 1, scope: !291, file: !158, line: 68, type: !48)
!291 = distinct !DISubprogram(name: "proto_is_vlan", scope: !158, file: !158, line: 68, type: !292, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !294)
!292 = !DISubroutineType(types: !293)
!293 = !{!83, !48}
!294 = !{!290}
!295 = !DILocation(line: 0, scope: !291, inlinedAt: !296)
!296 = distinct !DILocation(line: 106, column: 8, scope: !297, inlinedAt: !282)
!297 = distinct !DILexicalBlock(scope: !298, file: !158, line: 106, column: 7)
!298 = distinct !DILexicalBlock(scope: !299, file: !158, line: 105, column: 39)
!299 = distinct !DILexicalBlock(scope: !300, file: !158, line: 105, column: 2)
!300 = distinct !DILexicalBlock(scope: !257, file: !158, line: 105, column: 2)
!301 = !DILocation(line: 70, column: 20, scope: !291, inlinedAt: !296)
!302 = !DILocation(line: 70, column: 46, scope: !291, inlinedAt: !296)
!303 = !DILocation(line: 106, column: 8, scope: !297, inlinedAt: !282)
!304 = !DILocation(line: 106, column: 7, scope: !298, inlinedAt: !282)
!305 = !DILocation(line: 112, column: 18, scope: !298, inlinedAt: !282)
!306 = !DILocation(line: 70, column: 6, scope: !140)
!307 = !DILocalVariable(name: "nh", arg: 1, scope: !308, file: !158, line: 151, type: !249)
!308 = distinct !DISubprogram(name: "parse_iphdr", scope: !158, file: !158, line: 151, type: !309, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !312)
!309 = !DISubroutineType(types: !310)
!310 = !{!83, !249, !46, !311}
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!312 = !{!307, !313, !314, !315, !316}
!313 = !DILocalVariable(name: "data_end", arg: 2, scope: !308, file: !158, line: 152, type: !46)
!314 = !DILocalVariable(name: "iphdr", arg: 3, scope: !308, file: !158, line: 153, type: !311)
!315 = !DILocalVariable(name: "iph", scope: !308, file: !158, line: 155, type: !174)
!316 = !DILocalVariable(name: "hdrsize", scope: !308, file: !158, line: 156, type: !83)
!317 = !DILocation(line: 0, scope: !308, inlinedAt: !318)
!318 = distinct !DILocation(line: 71, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !320, file: !3, line: 70, column: 39)
!320 = distinct !DILexicalBlock(scope: !140, file: !3, line: 70, column: 6)
!321 = !DILocation(line: 158, column: 10, scope: !322, inlinedAt: !318)
!322 = distinct !DILexicalBlock(scope: !308, file: !158, line: 158, column: 6)
!323 = !DILocation(line: 158, column: 14, scope: !322, inlinedAt: !318)
!324 = !DILocation(line: 158, column: 6, scope: !308, inlinedAt: !318)
!325 = !DILocation(line: 161, column: 17, scope: !308, inlinedAt: !318)
!326 = !DILocation(line: 161, column: 21, scope: !308, inlinedAt: !318)
!327 = !DILocation(line: 163, column: 13, scope: !328, inlinedAt: !318)
!328 = distinct !DILexicalBlock(scope: !308, file: !158, line: 163, column: 5)
!329 = !DILocation(line: 163, column: 5, scope: !308, inlinedAt: !318)
!330 = !DILocation(line: 167, column: 14, scope: !331, inlinedAt: !318)
!331 = distinct !DILexicalBlock(scope: !308, file: !158, line: 167, column: 6)
!332 = !DILocation(line: 167, column: 24, scope: !331, inlinedAt: !318)
!333 = !DILocation(line: 167, column: 6, scope: !308, inlinedAt: !318)
!334 = !DILocation(line: 173, column: 14, scope: !308, inlinedAt: !318)
!335 = !{!336, !237, i64 9}
!336 = !{!"iphdr", !237, i64 0, !237, i64 0, !237, i64 1, !289, i64 2, !289, i64 4, !289, i64 6, !237, i64 8, !237, i64 9, !289, i64 10, !236, i64 12, !236, i64 16}
!337 = !DILocation(line: 72, column: 15, scope: !338)
!338 = distinct !DILexicalBlock(scope: !319, file: !3, line: 72, column: 7)
!339 = !DILocation(line: 72, column: 7, scope: !319)
!340 = !DILocalVariable(name: "nh", arg: 1, scope: !341, file: !158, line: 132, type: !249)
!341 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !158, file: !158, line: 132, type: !342, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !345)
!342 = !DISubroutineType(types: !343)
!343 = !{!83, !249, !46, !344}
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!345 = !{!340, !346, !347, !348}
!346 = !DILocalVariable(name: "data_end", arg: 2, scope: !341, file: !158, line: 133, type: !46)
!347 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !341, file: !158, line: 134, type: !344)
!348 = !DILocalVariable(name: "ip6h", scope: !341, file: !158, line: 136, type: !191)
!349 = !DILocation(line: 0, scope: !341, inlinedAt: !350)
!350 = distinct !DILocation(line: 75, column: 13, scope: !351)
!351 = distinct !DILexicalBlock(scope: !352, file: !3, line: 74, column: 48)
!352 = distinct !DILexicalBlock(scope: !320, file: !3, line: 74, column: 13)
!353 = !DILocation(line: 142, column: 11, scope: !354, inlinedAt: !350)
!354 = distinct !DILexicalBlock(scope: !341, file: !158, line: 142, column: 6)
!355 = !DILocation(line: 142, column: 17, scope: !354, inlinedAt: !350)
!356 = !DILocation(line: 142, column: 15, scope: !354, inlinedAt: !350)
!357 = !DILocation(line: 142, column: 6, scope: !341, inlinedAt: !350)
!358 = !DILocation(line: 148, column: 15, scope: !341, inlinedAt: !350)
!359 = !{!360, !237, i64 6}
!360 = !{!"ipv6hdr", !237, i64 0, !237, i64 0, !237, i64 1, !289, i64 4, !237, i64 6, !237, i64 7, !361, i64 8, !361, i64 24}
!361 = !{!"in6_addr", !237, i64 0}
!362 = !DILocation(line: 76, column: 15, scope: !363)
!363 = distinct !DILexicalBlock(scope: !351, file: !3, line: 76, column: 7)
!364 = !DILocation(line: 76, column: 7, scope: !351)
!365 = !DILocation(line: 66, column: 9, scope: !140)
!366 = !DILocalVariable(name: "nh", arg: 1, scope: !367, file: !158, line: 206, type: !249)
!367 = distinct !DISubprogram(name: "parse_icmphdr_common", scope: !158, file: !158, line: 206, type: !368, scopeLine: 209, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !371)
!368 = !DISubroutineType(types: !369)
!369 = !{!83, !249, !46, !370}
!370 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64)
!371 = !{!366, !372, !373, !374}
!372 = !DILocalVariable(name: "data_end", arg: 2, scope: !367, file: !158, line: 207, type: !46)
!373 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !367, file: !158, line: 208, type: !370)
!374 = !DILocalVariable(name: "h", scope: !367, file: !158, line: 210, type: !224)
!375 = !DILocation(line: 0, scope: !367, inlinedAt: !376)
!376 = distinct !DILocation(line: 88, column: 14, scope: !140)
!377 = !DILocation(line: 212, column: 8, scope: !378, inlinedAt: !376)
!378 = distinct !DILexicalBlock(scope: !367, file: !158, line: 212, column: 6)
!379 = !DILocation(line: 212, column: 14, scope: !378, inlinedAt: !376)
!380 = !DILocation(line: 212, column: 12, scope: !378, inlinedAt: !376)
!381 = !DILocation(line: 212, column: 6, scope: !367, inlinedAt: !376)
!382 = !DILocation(line: 218, column: 12, scope: !367, inlinedAt: !376)
!383 = !{!384, !237, i64 0}
!384 = !{!"icmphdr_common", !237, i64 0, !237, i64 1, !289, i64 2}
!385 = !DILocation(line: 89, column: 38, scope: !386)
!386 = distinct !DILexicalBlock(scope: !140, file: !3, line: 89, column: 6)
!387 = !DILocation(line: 94, column: 6, scope: !388)
!388 = distinct !DILexicalBlock(scope: !386, file: !3, line: 93, column: 13)
!389 = !DILocation(line: 108, column: 2, scope: !140)
!390 = !DILocation(line: 110, column: 1, scope: !140)
!391 = !DILocation(line: 0, scope: !392, inlinedAt: !405)
!392 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !134, file: !134, line: 24, type: !393, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !395)
!393 = !DISubroutineType(types: !394)
!394 = !{!84, !143, !84}
!395 = !{!396, !397, !398}
!396 = !DILocalVariable(name: "ctx", arg: 1, scope: !392, file: !134, line: 24, type: !143)
!397 = !DILocalVariable(name: "action", arg: 2, scope: !392, file: !134, line: 24, type: !84)
!398 = !DILocalVariable(name: "rec", scope: !392, file: !134, line: 30, type: !399)
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !400, size: 64)
!400 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !401, line: 10, size: 128, elements: !402)
!401 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/andrzej/projects/xdp-client-server/xdp-server", checksumkind: CSK_MD5, checksum: "96c2435685fa7da2d24f219444d8659d")
!402 = !{!403, !404}
!403 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !400, file: !401, line: 11, baseType: !85, size: 64)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !400, file: !401, line: 12, baseType: !85, size: 64, offset: 64)
!405 = distinct !DILocation(line: 111, column: 9, scope: !140)
!406 = !{!236, !236, i64 0}
!407 = !DILocation(line: 30, column: 24, scope: !392, inlinedAt: !405)
!408 = !DILocation(line: 31, column: 7, scope: !409, inlinedAt: !405)
!409 = distinct !DILexicalBlock(scope: !392, file: !134, line: 31, column: 6)
!410 = !DILocation(line: 31, column: 6, scope: !392, inlinedAt: !405)
!411 = !DILocation(line: 38, column: 7, scope: !392, inlinedAt: !405)
!412 = !DILocation(line: 38, column: 17, scope: !392, inlinedAt: !405)
!413 = !{!414, !415, i64 0}
!414 = !{!"datarec", !415, i64 0, !415, i64 8}
!415 = !{!"long long", !237, i64 0}
!416 = !DILocation(line: 39, column: 25, scope: !392, inlinedAt: !405)
!417 = !DILocation(line: 39, column: 41, scope: !392, inlinedAt: !405)
!418 = !DILocation(line: 39, column: 34, scope: !392, inlinedAt: !405)
!419 = !DILocation(line: 39, column: 19, scope: !392, inlinedAt: !405)
!420 = !DILocation(line: 39, column: 7, scope: !392, inlinedAt: !405)
!421 = !DILocation(line: 39, column: 16, scope: !392, inlinedAt: !405)
!422 = !{!414, !415, i64 8}
!423 = !DILocation(line: 41, column: 9, scope: !392, inlinedAt: !405)
!424 = !DILocation(line: 41, column: 2, scope: !392, inlinedAt: !405)
!425 = !DILocation(line: 42, column: 1, scope: !392, inlinedAt: !405)
!426 = !DILocation(line: 111, column: 2, scope: !140)
!427 = distinct !DISubprogram(name: "xdp_redirect_func", scope: !3, file: !3, line: 116, type: !141, scopeLine: 117, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !428)
!428 = !{!429, !430, !431, !432, !433, !434, !435, !436}
!429 = !DILocalVariable(name: "ctx", arg: 1, scope: !427, file: !3, line: 116, type: !143)
!430 = !DILocalVariable(name: "data_end", scope: !427, file: !3, line: 118, type: !46)
!431 = !DILocalVariable(name: "data", scope: !427, file: !3, line: 119, type: !46)
!432 = !DILocalVariable(name: "nh", scope: !427, file: !3, line: 120, type: !157)
!433 = !DILocalVariable(name: "eth", scope: !427, file: !3, line: 121, type: !162)
!434 = !DILocalVariable(name: "eth_type", scope: !427, file: !3, line: 122, type: !83)
!435 = !DILocalVariable(name: "action", scope: !427, file: !3, line: 123, type: !83)
!436 = !DILabel(scope: !427, name: "out", file: !3, line: 138)
!437 = !DILocation(line: 0, scope: !427)
!438 = !DILocation(line: 138, column: 1, scope: !427)
!439 = !DILocation(line: 0, scope: !392, inlinedAt: !440)
!440 = distinct !DILocation(line: 139, column: 9, scope: !427)
!441 = !DILocation(line: 30, column: 24, scope: !392, inlinedAt: !440)
!442 = !DILocation(line: 31, column: 7, scope: !409, inlinedAt: !440)
!443 = !DILocation(line: 31, column: 6, scope: !392, inlinedAt: !440)
!444 = !DILocation(line: 119, column: 34, scope: !427)
!445 = !DILocation(line: 118, column: 38, scope: !427)
!446 = !DILocation(line: 38, column: 7, scope: !392, inlinedAt: !440)
!447 = !DILocation(line: 38, column: 17, scope: !392, inlinedAt: !440)
!448 = !DILocation(line: 39, column: 25, scope: !392, inlinedAt: !440)
!449 = !DILocation(line: 39, column: 41, scope: !392, inlinedAt: !440)
!450 = !DILocation(line: 39, column: 34, scope: !392, inlinedAt: !440)
!451 = !DILocation(line: 39, column: 19, scope: !392, inlinedAt: !440)
!452 = !DILocation(line: 39, column: 7, scope: !392, inlinedAt: !440)
!453 = !DILocation(line: 39, column: 16, scope: !392, inlinedAt: !440)
!454 = !DILocation(line: 41, column: 9, scope: !392, inlinedAt: !440)
!455 = !DILocation(line: 41, column: 2, scope: !392, inlinedAt: !440)
!456 = !DILocation(line: 42, column: 1, scope: !392, inlinedAt: !440)
!457 = !DILocation(line: 139, column: 2, scope: !427)
!458 = distinct !DISubprogram(name: "xdp_redirect_map_func", scope: !3, file: !3, line: 144, type: !141, scopeLine: 145, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !459)
!459 = !{!460, !461, !462, !463, !464, !465, !466, !467, !469}
!460 = !DILocalVariable(name: "ctx", arg: 1, scope: !458, file: !3, line: 144, type: !143)
!461 = !DILocalVariable(name: "data_end", scope: !458, file: !3, line: 146, type: !46)
!462 = !DILocalVariable(name: "data", scope: !458, file: !3, line: 147, type: !46)
!463 = !DILocalVariable(name: "nh", scope: !458, file: !3, line: 148, type: !157)
!464 = !DILocalVariable(name: "eth", scope: !458, file: !3, line: 149, type: !162)
!465 = !DILocalVariable(name: "eth_type", scope: !458, file: !3, line: 150, type: !83)
!466 = !DILocalVariable(name: "action", scope: !458, file: !3, line: 151, type: !83)
!467 = !DILocalVariable(name: "dst", scope: !458, file: !3, line: 152, type: !468)
!468 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!469 = !DILabel(scope: !458, name: "out", file: !3, line: 171)
!470 = !DILocation(line: 0, scope: !458)
!471 = !DILocation(line: 146, column: 38, scope: !458)
!472 = !DILocation(line: 146, column: 27, scope: !458)
!473 = !DILocation(line: 146, column: 19, scope: !458)
!474 = !DILocation(line: 147, column: 34, scope: !458)
!475 = !DILocation(line: 147, column: 23, scope: !458)
!476 = !DILocation(line: 147, column: 15, scope: !458)
!477 = !DILocation(line: 0, scope: !246, inlinedAt: !478)
!478 = distinct !DILocation(line: 158, column: 13, scope: !458)
!479 = !DILocation(line: 0, scope: !257, inlinedAt: !480)
!480 = distinct !DILocation(line: 129, column: 9, scope: !246, inlinedAt: !478)
!481 = !DILocation(line: 93, column: 14, scope: !284, inlinedAt: !480)
!482 = !DILocation(line: 93, column: 24, scope: !284, inlinedAt: !480)
!483 = !DILocation(line: 93, column: 6, scope: !257, inlinedAt: !480)
!484 = !DILocation(line: 97, column: 10, scope: !257, inlinedAt: !480)
!485 = !DILocation(line: 163, column: 46, scope: !458)
!486 = !DILocation(line: 163, column: 8, scope: !458)
!487 = !DILocation(line: 164, column: 7, scope: !488)
!488 = distinct !DILexicalBlock(scope: !458, file: !3, line: 164, column: 6)
!489 = !DILocation(line: 164, column: 6, scope: !458)
!490 = !DILocation(line: 171, column: 1, scope: !458)
!491 = !DILocation(line: 0, scope: !392, inlinedAt: !492)
!492 = distinct !DILocation(line: 172, column: 9, scope: !458)
!493 = !DILocation(line: 26, column: 6, scope: !392, inlinedAt: !492)
!494 = !DILocation(line: 168, column: 2, scope: !458)
!495 = !DILocation(line: 169, column: 11, scope: !458)
!496 = !DILocation(line: 26, column: 13, scope: !497, inlinedAt: !492)
!497 = distinct !DILexicalBlock(scope: !392, file: !134, line: 26, column: 6)
!498 = !DILocation(line: 30, column: 24, scope: !392, inlinedAt: !492)
!499 = !DILocation(line: 31, column: 7, scope: !409, inlinedAt: !492)
!500 = !DILocation(line: 31, column: 6, scope: !392, inlinedAt: !492)
!501 = !DILocation(line: 38, column: 7, scope: !392, inlinedAt: !492)
!502 = !DILocation(line: 38, column: 17, scope: !392, inlinedAt: !492)
!503 = !DILocation(line: 39, column: 25, scope: !392, inlinedAt: !492)
!504 = !DILocation(line: 39, column: 41, scope: !392, inlinedAt: !492)
!505 = !DILocation(line: 39, column: 34, scope: !392, inlinedAt: !492)
!506 = !DILocation(line: 39, column: 19, scope: !392, inlinedAt: !492)
!507 = !DILocation(line: 39, column: 7, scope: !392, inlinedAt: !492)
!508 = !DILocation(line: 39, column: 16, scope: !392, inlinedAt: !492)
!509 = !DILocation(line: 41, column: 9, scope: !392, inlinedAt: !492)
!510 = !DILocation(line: 41, column: 2, scope: !392, inlinedAt: !492)
!511 = !DILocation(line: 42, column: 1, scope: !392, inlinedAt: !492)
!512 = !DILocation(line: 172, column: 2, scope: !458)
!513 = distinct !DISubprogram(name: "xdp_router_func", scope: !3, file: !3, line: 184, type: !141, scopeLine: 185, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !514)
!514 = !{!515, !516, !517, !518, !519, !520, !521, !522, !523, !524, !525, !526}
!515 = !DILocalVariable(name: "ctx", arg: 1, scope: !513, file: !3, line: 184, type: !143)
!516 = !DILocalVariable(name: "data_end", scope: !513, file: !3, line: 186, type: !46)
!517 = !DILocalVariable(name: "data", scope: !513, file: !3, line: 187, type: !46)
!518 = !DILocalVariable(name: "fib_params", scope: !513, file: !3, line: 188, type: !93)
!519 = !DILocalVariable(name: "eth", scope: !513, file: !3, line: 189, type: !162)
!520 = !DILocalVariable(name: "ip6h", scope: !513, file: !3, line: 190, type: !191)
!521 = !DILocalVariable(name: "iph", scope: !513, file: !3, line: 191, type: !174)
!522 = !DILocalVariable(name: "h_proto", scope: !513, file: !3, line: 192, type: !48)
!523 = !DILocalVariable(name: "nh_off", scope: !513, file: !3, line: 193, type: !85)
!524 = !DILocalVariable(name: "rc", scope: !513, file: !3, line: 194, type: !83)
!525 = !DILocalVariable(name: "action", scope: !513, file: !3, line: 195, type: !83)
!526 = !DILabel(scope: !513, name: "out", file: !3, line: 265)
!527 = !DILocation(line: 0, scope: !513)
!528 = !DILocation(line: 186, column: 38, scope: !513)
!529 = !DILocation(line: 186, column: 27, scope: !513)
!530 = !DILocation(line: 186, column: 19, scope: !513)
!531 = !DILocation(line: 187, column: 34, scope: !513)
!532 = !DILocation(line: 187, column: 23, scope: !513)
!533 = !DILocation(line: 187, column: 15, scope: !513)
!534 = !DILocation(line: 188, column: 2, scope: !513)
!535 = !DILocation(line: 188, column: 24, scope: !513)
!536 = !DILocation(line: 198, column: 11, scope: !537)
!537 = distinct !DILexicalBlock(scope: !513, file: !3, line: 198, column: 6)
!538 = !DILocation(line: 198, column: 20, scope: !537)
!539 = !DILocation(line: 198, column: 6, scope: !513)
!540 = !DILocation(line: 189, column: 23, scope: !513)
!541 = !DILocation(line: 203, column: 17, scope: !513)
!542 = !{!543, !289, i64 12}
!543 = !{!"ethhdr", !237, i64 0, !237, i64 6, !289, i64 12}
!544 = !DILocation(line: 204, column: 14, scope: !545)
!545 = distinct !DILexicalBlock(scope: !513, file: !3, line: 204, column: 6)
!546 = !DILocation(line: 204, column: 6, scope: !513)
!547 = !DILocation(line: 207, column: 11, scope: !548)
!548 = distinct !DILexicalBlock(scope: !549, file: !3, line: 207, column: 7)
!549 = distinct !DILexicalBlock(scope: !545, file: !3, line: 204, column: 38)
!550 = !DILocation(line: 207, column: 17, scope: !548)
!551 = !DILocation(line: 207, column: 15, scope: !548)
!552 = !DILocation(line: 207, column: 7, scope: !549)
!553 = !DILocation(line: 205, column: 9, scope: !549)
!554 = !DILocation(line: 212, column: 12, scope: !555)
!555 = distinct !DILexicalBlock(scope: !549, file: !3, line: 212, column: 7)
!556 = !{!336, !237, i64 8}
!557 = !DILocation(line: 212, column: 16, scope: !555)
!558 = !DILocation(line: 212, column: 7, scope: !549)
!559 = !DILocation(line: 216, column: 21, scope: !560)
!560 = distinct !DILexicalBlock(scope: !545, file: !3, line: 216, column: 13)
!561 = !DILocation(line: 216, column: 13, scope: !545)
!562 = !DILocation(line: 222, column: 12, scope: !563)
!563 = distinct !DILexicalBlock(scope: !564, file: !3, line: 222, column: 7)
!564 = distinct !DILexicalBlock(scope: !560, file: !3, line: 216, column: 47)
!565 = !DILocation(line: 222, column: 18, scope: !563)
!566 = !DILocation(line: 222, column: 16, scope: !563)
!567 = !DILocation(line: 222, column: 7, scope: !564)
!568 = !DILocation(line: 221, column: 10, scope: !564)
!569 = !DILocation(line: 227, column: 13, scope: !570)
!570 = distinct !DILexicalBlock(scope: !564, file: !3, line: 227, column: 7)
!571 = !{!360, !237, i64 7}
!572 = !DILocation(line: 227, column: 23, scope: !570)
!573 = !DILocation(line: 227, column: 7, scope: !564)
!574 = !DILocation(line: 235, column: 28, scope: !513)
!575 = !{!235, !236, i64 12}
!576 = !DILocation(line: 235, column: 13, scope: !513)
!577 = !DILocation(line: 235, column: 21, scope: !513)
!578 = !{!579, !236, i64 8}
!579 = !{!"bpf_fib_lookup", !237, i64 0, !237, i64 1, !289, i64 2, !289, i64 4, !237, i64 6, !236, i64 8, !237, i64 12, !237, i64 16, !237, i64 32, !289, i64 48, !289, i64 50, !237, i64 52, !237, i64 58}
!580 = !DILocation(line: 237, column: 22, scope: !513)
!581 = !DILocation(line: 237, column: 7, scope: !513)
!582 = !DILocation(line: 238, column: 2, scope: !513)
!583 = !DILocation(line: 240, column: 7, scope: !584)
!584 = distinct !DILexicalBlock(scope: !513, file: !3, line: 238, column: 14)
!585 = !DILocalVariable(name: "iph", arg: 1, scope: !586, file: !3, line: 176, type: !174)
!586 = distinct !DISubprogram(name: "ip_decrease_ttl", scope: !3, file: !3, line: 176, type: !587, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !589)
!587 = !DISubroutineType(types: !588)
!588 = !{!83, !174}
!589 = !{!585}
!590 = !DILocation(line: 0, scope: !586, inlinedAt: !591)
!591 = distinct !DILocation(line: 241, column: 4, scope: !592)
!592 = distinct !DILexicalBlock(scope: !584, file: !3, line: 240, column: 7)
!593 = !DILocation(line: 179, column: 16, scope: !586, inlinedAt: !591)
!594 = !DILocation(line: 179, column: 9, scope: !586, inlinedAt: !591)
!595 = !DILocation(line: 241, column: 4, scope: !592)
!596 = !DILocation(line: 242, column: 20, scope: !597)
!597 = distinct !DILexicalBlock(scope: !592, file: !3, line: 242, column: 12)
!598 = !DILocation(line: 242, column: 12, scope: !592)
!599 = !DILocation(line: 243, column: 10, scope: !597)
!600 = !DILocation(line: 243, column: 19, scope: !597)
!601 = !DILocation(line: 243, column: 4, scope: !597)
!602 = !DILocation(line: 255, column: 3, scope: !584)
!603 = !DILocation(line: 265, column: 1, scope: !513)
!604 = !DILocation(line: 0, scope: !392, inlinedAt: !605)
!605 = distinct !DILocation(line: 266, column: 9, scope: !513)
!606 = !DILocation(line: 30, column: 24, scope: !392, inlinedAt: !605)
!607 = !DILocation(line: 31, column: 7, scope: !409, inlinedAt: !605)
!608 = !DILocation(line: 31, column: 6, scope: !392, inlinedAt: !605)
!609 = !DILocation(line: 38, column: 7, scope: !392, inlinedAt: !605)
!610 = !DILocation(line: 38, column: 17, scope: !392, inlinedAt: !605)
!611 = !DILocation(line: 39, column: 25, scope: !392, inlinedAt: !605)
!612 = !DILocation(line: 39, column: 41, scope: !392, inlinedAt: !605)
!613 = !DILocation(line: 39, column: 34, scope: !392, inlinedAt: !605)
!614 = !DILocation(line: 39, column: 19, scope: !392, inlinedAt: !605)
!615 = !DILocation(line: 39, column: 7, scope: !392, inlinedAt: !605)
!616 = !DILocation(line: 39, column: 16, scope: !392, inlinedAt: !605)
!617 = !DILocation(line: 41, column: 9, scope: !392, inlinedAt: !605)
!618 = !DILocation(line: 41, column: 2, scope: !392, inlinedAt: !605)
!619 = !DILocation(line: 42, column: 1, scope: !392, inlinedAt: !605)
!620 = !DILocation(line: 267, column: 1, scope: !513)
!621 = !DILocation(line: 266, column: 2, scope: !513)
!622 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 270, type: !141, scopeLine: 271, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !623)
!623 = !{!624}
!624 = !DILocalVariable(name: "ctx", arg: 1, scope: !622, file: !3, line: 270, type: !143)
!625 = !DILocation(line: 0, scope: !622)
!626 = !DILocation(line: 272, column: 2, scope: !622)
