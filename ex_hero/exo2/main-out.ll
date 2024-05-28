
; __CLANG_OFFLOAD_BUNDLE____START__ host-riscv64-hero-linux-gnu
; ModuleID = 'main-host.ll'
source_filename = "main.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-hero-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }
%struct.HeroDev = type { i8*, %struct.HeroSubDev*, %struct.HeroSubDev*, [32 x i8], %struct.HeroMboxes_t }
%struct.HeroSubDev = type { i32*, i64, i32, i8*, %struct.HeroSubDev* }
%struct.HeroMboxes_t = type { %struct.ring_buf*, %struct.HeroSubDev, %struct.ring_buf*, %struct.HeroSubDev, %struct.ring_buf*, %struct.HeroSubDev }
%struct.ring_buf = type { i32, i32, i32, i32, i64, i64 }

@.str = private unnamed_addr constant [24 x i8] c"[host] too large for L2\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"[host] allocation error\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"[host] allocated %llx bytes at %llx\0A\0D\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"[host] too large for L3\00", align 1
@.__omp_offloading_801_12a1c02_main_l60.region_id = weak constant i8 0
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.__omp_offloading_801_12a1c02_main_l74.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [3 x i64] [i64 8, i64 8, i64 8]
@.offload_maptypes = private unnamed_addr constant [3 x i64] [i64 33, i64 33, i64 33]
@.omp_offloading.entry_name = internal unnamed_addr constant [38 x i8] c"__omp_offloading_801_12a1c02_main_l60\00"
@.omp_offloading.entry.__omp_offloading_801_12a1c02_main_l60 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_801_12a1c02_main_l60.region_id, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@.omp_offloading.entry_name.4 = internal unnamed_addr constant [38 x i8] c"__omp_offloading_801_12a1c02_main_l74\00"
@.omp_offloading.entry.__omp_offloading_801_12a1c02_main_l74 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_801_12a1c02_main_l74.region_id, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.omp_offloading.entry_name.4, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.requires_reg, i8* null }]

; Function Attrs: nounwind
define dso_local i8* @dev_l2_alloc(i64 noundef %length, i64* noundef %ret_physical_address) local_unnamed_addr #0 {
entry:
  %cmp = icmp ugt i64 %length, 524287
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %conv = trunc i64 %length to i32
  %call1 = tail call i64 @hero_dev_l2_malloc(%struct.HeroDev* noundef null, i32 noundef signext %conv, i64* noundef %ret_physical_address) #4
  %0 = load i64, i64* %ret_physical_address, align 8, !tbaa !7
  %conv2 = trunc i64 %0 to i32
  %1 = add i32 %conv2, -1895825409
  %2 = icmp ult i32 %1, 16777214
  br i1 %2, label %if.end10, label %if.then8

if.then8:                                         ; preds = %if.end
  %call9 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0))
  br label %cleanup

if.end10:                                         ; preds = %if.end
  %3 = inttoptr i64 %call1 to i8*
  %call11 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0), i64 noundef %length, i64 noundef %0)
  br label %cleanup

cleanup:                                          ; preds = %if.end10, %if.then8, %if.then
  %retval.0 = phi i8* [ null, %if.then ], [ %3, %if.end10 ], [ null, %if.then8 ]
  ret i8* %retval.0
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind
declare dso_local noundef signext i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

declare dso_local i64 @hero_dev_l2_malloc(%struct.HeroDev* noundef, i32 noundef signext, i64* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
define dso_local i8* @dev_l3_alloc(i64 noundef %length, i64* noundef %ret_physical_address) local_unnamed_addr #0 {
entry:
  %cmp = icmp ugt i64 %length, 268435456
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0))
  br label %cleanup

if.end:                                           ; preds = %entry
  %conv = trunc i64 %length to i32
  %call1 = tail call i64 @hero_dev_l3_malloc(%struct.HeroDev* noundef null, i32 noundef signext %conv, i64* noundef %ret_physical_address) #4
  %0 = load i64, i64* %ret_physical_address, align 8, !tbaa !7
  %conv2 = trunc i64 %0 to i32
  %1 = add i32 %conv2, 1
  %2 = icmp ult i32 %1, -1073741822
  br i1 %2, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end
  %call9 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0))
  br label %cleanup

if.end10:                                         ; preds = %if.end
  %3 = inttoptr i64 %call1 to i8*
  %call11 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0), i64 noundef %length, i64 noundef %0)
  br label %cleanup

cleanup:                                          ; preds = %if.end10, %if.then8, %if.then
  %retval.0 = phi i8* [ null, %if.then ], [ %3, %if.end10 ], [ null, %if.then8 ]
  ret i8* %retval.0
}

declare dso_local i64 @hero_dev_l3_malloc(%struct.HeroDev* noundef, i32 noundef signext, i64* noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local signext i32 @main(i32 noundef signext %argc, i8** nocapture noundef readnone %argv) local_unnamed_addr #0 {
entry:
  %_A_phys.i = alloca i32, align 4
  %_B_phys.i = alloca i32, align 4
  %_size.i = alloca i32, align 4
  %A_phys = alloca i64, align 8
  %B_phys = alloca i64, align 8
  %size = alloca i64, align 8
  %.offload_baseptrs = alloca [3 x i8*], align 8
  %.offload_ptrs = alloca [3 x i8*], align 8
  %0 = tail call i32 @__tgt_target_mapper(%struct.ident_t* nonnull @1, i64 1, i8* nonnull @.__omp_offloading_801_12a1c02_main_l60.region_id, i32 0, i8** null, i8** null, i64* null, i64* null, i8** null, i8** null)
  %.not = icmp eq i32 %0, 0
  br i1 %.not, label %omp_offload.cont, label %omp_offload.failed

omp_offload.failed:                               ; preds = %entry
  tail call void asm sideeffect "nop", ""() #4, !srcloc !11
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  %1 = bitcast i64* %A_phys to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #4
  %2 = bitcast i64* %B_phys to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #4
  %3 = bitcast i64* %size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  store i64 4096, i64* %size, align 8, !tbaa !7
  %call1.i = call i64 @hero_dev_l2_malloc(%struct.HeroDev* noundef null, i32 noundef signext 4096, i64* noundef nonnull %A_phys) #4
  %4 = load i64, i64* %A_phys, align 8, !tbaa !7
  %conv2.i4 = trunc i64 %4 to i32
  %5 = add i32 %conv2.i4, -1895825409
  %6 = icmp ult i32 %5, 16777214
  br i1 %6, label %if.end10.i, label %if.then8.i

if.then8.i:                                       ; preds = %omp_offload.cont
  %call9.i = call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)) #4
  br label %if.end.i

if.end10.i:                                       ; preds = %omp_offload.cont
  %call11.i = call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0), i64 noundef 4096, i64 noundef %4) #4
  br label %if.end.i

if.end.i:                                         ; preds = %if.end10.i, %if.then8.i
  %call1.i6 = call i64 @hero_dev_l2_malloc(%struct.HeroDev* noundef null, i32 noundef signext 4096, i64* noundef nonnull %B_phys) #4
  %7 = load i64, i64* %B_phys, align 8, !tbaa !7
  %conv2.i7 = trunc i64 %7 to i32
  %8 = add i32 %conv2.i7, -1895825409
  %9 = icmp ult i32 %8, 16777214
  br i1 %9, label %if.end10.i11, label %if.then8.i9

if.then8.i9:                                      ; preds = %if.end.i
  %call9.i8 = call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0)) #4
  br label %dev_l2_alloc.exit13

if.end10.i11:                                     ; preds = %if.end.i
  %call11.i10 = call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0), i64 noundef 4096, i64 noundef %7) #4
  br label %dev_l2_alloc.exit13

dev_l2_alloc.exit13:                              ; preds = %if.end10.i11, %if.then8.i9
  %10 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i64 0, i64 0
  %11 = bitcast [3 x i8*]* %.offload_baseptrs to i64**
  store i64* %A_phys, i64** %11, align 8
  %12 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i64 0, i64 0
  %13 = bitcast [3 x i8*]* %.offload_ptrs to i64**
  store i64* %A_phys, i64** %13, align 8
  %14 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i64 0, i64 1
  %15 = bitcast i8** %14 to i64**
  store i64* %B_phys, i64** %15, align 8
  %16 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i64 0, i64 1
  %17 = bitcast i8** %16 to i64**
  store i64* %B_phys, i64** %17, align 8
  %18 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i64 0, i64 2
  %19 = bitcast i8** %18 to i64**
  store i64* %size, i64** %19, align 8
  %20 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i64 0, i64 2
  %21 = bitcast i8** %20 to i64**
  store i64* %size, i64** %21, align 8
  %22 = call i32 @__tgt_target_mapper(%struct.ident_t* nonnull @1, i64 1, i8* nonnull @.__omp_offloading_801_12a1c02_main_l74.region_id, i32 3, i8** nonnull %10, i8** nonnull %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @.offload_sizes, i64 0, i64 0), i64* getelementptr inbounds ([3 x i64], [3 x i64]* @.offload_maptypes, i64 0, i64 0), i8** null, i8** null)
  %.not3 = icmp eq i32 %22, 0
  br i1 %.not3, label %omp_offload.cont3, label %omp_offload.failed2

omp_offload.failed2:                              ; preds = %dev_l2_alloc.exit13
  %_A_phys.i.0._A_phys.i.0._A_phys.0._A_phys.0._A_phys.0..sroa_cast = bitcast i32* %_A_phys.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_A_phys.i.0._A_phys.i.0._A_phys.0._A_phys.0._A_phys.0..sroa_cast)
  %23 = load i64, i64* %A_phys, align 8, !tbaa !7
  %conv.i = trunc i64 %23 to i32
  store volatile i32 %conv.i, i32* %_A_phys.i, align 4, !tbaa !12
  %_B_phys.i.0._B_phys.i.0._B_phys.0._B_phys.0._B_phys.0..sroa_cast = bitcast i32* %_B_phys.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_B_phys.i.0._B_phys.i.0._B_phys.0._B_phys.0._B_phys.0..sroa_cast)
  %24 = load i64, i64* %B_phys, align 8, !tbaa !7
  %conv1.i = trunc i64 %24 to i32
  store volatile i32 %conv1.i, i32* %_B_phys.i, align 4, !tbaa !12
  %_size.i.0._size.i.0._size.0._size.0._size.0..sroa_cast = bitcast i32* %_size.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_size.i.0._size.i.0._size.0._size.0._size.0..sroa_cast)
  %25 = load i64, i64* %size, align 8, !tbaa !7
  %conv2.i = trunc i64 %25 to i32
  store volatile i32 %conv2.i, i32* %_size.i, align 4, !tbaa !12
  call void asm sideeffect "nop", ""() #4, !srcloc !14
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_size.i.0._size.i.0._size.0._size.0._size.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_B_phys.i.0._B_phys.i.0._B_phys.0._B_phys.0._B_phys.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_A_phys.i.0._A_phys.i.0._A_phys.0._A_phys.0._A_phys.0..sroa_cast)
  br label %omp_offload.cont3

omp_offload.cont3:                                ; preds = %omp_offload.failed2, %dev_l2_alloc.exit13
  call void bitcast (void (...)* @hero_print_timestamp to void ()*)() #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %1) #4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @__tgt_target_mapper(%struct.ident_t*, i64, i8*, i32, i8**, i8**, i64*, i64*, i8**, i8**) local_unnamed_addr #4

declare dso_local void @hero_print_timestamp(...) local_unnamed_addr #3

; Function Attrs: nounwind
define internal void @.omp_offloading.requires_reg() #0 section ".text.startup" {
entry:
  tail call void @__tgt_register_requires(i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @__tgt_register_requires(i64) local_unnamed_addr #4

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-save-restore" }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,-save-restore" }
attributes #4 = { nounwind }

!omp_offload.info = !{!0, !1}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}
!nvvm.annotations = !{}

!0 = !{i32 0, i32 2049, i32 19536898, !"main", i32 60, i32 0}
!1 = !{i32 0, i32 2049, i32 19536898, !"main", i32 74, i32 1}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 1, !"target-abi", !"lp64d"}
!4 = !{i32 7, !"openmp", i32 50}
!5 = !{i32 1, !"SmallDataLimit", i32 8}
!6 = !{!"clang version 15.0.0 (git@iis-git.ee.ethz.ch:iis-compilers/llvm-project.git dc4e635bebcc2811b0a07f4f044c766cab3b7ca5)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i64 1813}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !9, i64 0}
!14 = !{i64 2453}

; __CLANG_OFFLOAD_BUNDLE____END__ host-riscv64-hero-linux-gnu

; __CLANG_OFFLOAD_BUNDLE____START__ openmp-riscv32-hero-hero1-elf
; ModuleID = 'main-hero1.TMP.1.ll'
source_filename = "main.c"
target datalayout = "e-m:e-p:32:32-p1:64:32-i64:64-n32-S128-P0-A0"
target triple = "riscv32-hero-hero1-elf"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.__tgt_offload_entry = type { i8*, i8*, i32, i32, i32 }

@.str = private unnamed_addr constant [17 x i8] c"[dev] %x %x %x\0A\0D\00", align 1
@.str.1 = private unnamed_addr constant [66 x i8] c"[dev] 1-core : %u cycles, 8-cores : %u cycles , DMA : %u cycles\0A\0D\00", align 1
@.str.2 = private unnamed_addr constant [61 x i8] c"[dev] DMA error: src (%x) or dst (%x) not in device memory\0A\0D\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"[dev] DMA error: transfer too large (%x)\0A\0D\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"%x (%2x) != %x (%2x)\0A\0D\00", align 1
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.omp_offloading.entry_name = internal unnamed_addr constant [38 x i8] c"__omp_offloading_801_12a1c02_main_l60\00"
@.omp_offloading.entry.__omp_offloading_801_12a1c02_main_l60 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* bitcast (void (i64)* @__omp_offloading_801_12a1c02_main_l60 to i8*), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i32 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@.omp_offloading.entry_name.5 = internal unnamed_addr constant [38 x i8] c"__omp_offloading_801_12a1c02_main_l74\00"
@.omp_offloading.entry.__omp_offloading_801_12a1c02_main_l74 = weak local_unnamed_addr constant %struct.__tgt_offload_entry { i8* bitcast (void (i64)* @__omp_offloading_801_12a1c02_main_l74 to i8*), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.omp_offloading.entry_name.5, i32 0, i32 0), i32 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@llvm.compiler.used = appending global [16 x i8*] [i8* bitcast (i16 (i64)* @hero_load_uint16 to i8*), i8* bitcast (i32 (i64, i16*)* @hero_load_uint16_noblock to i8*), i8* bitcast (i32 (i64)* @hero_load_uint32 to i8*), i8* bitcast (i32 (i64, i32*)* @hero_load_uint32_noblock to i8*), i8* bitcast (i64 (i64)* @hero_load_uint64 to i8*), i8* bitcast (i32 (i64, i64*)* @hero_load_uint64_noblock to i8*), i8* bitcast (i8 (i64)* @hero_load_uint8 to i8*), i8* bitcast (i32 (i64, i8*)* @hero_load_uint8_noblock to i8*), i8* bitcast (void (i64, i16)* @hero_store_uint16 to i8*), i8* bitcast (i32 (i64, i16)* @hero_store_uint16_noblock to i8*), i8* bitcast (void (i64, i32)* @hero_store_uint32 to i8*), i8* bitcast (i32 (i64, i32)* @hero_store_uint32_noblock to i8*), i8* bitcast (void (i64, i64)* @hero_store_uint64 to i8*), i8* bitcast (i32 (i64, i64)* @hero_store_uint64_noblock to i8*), i8* bitcast (void (i64, i8)* @hero_store_uint8 to i8*), i8* bitcast (i32 (i64, i8)* @hero_store_uint8_noblock to i8*)], section "llvm.metadata"

; Function Attrs: alwaysinline convergent norecurse nounwind
define weak void @__wrapped_omp__omp_offloading_801_12a1c02_main_l60() #0 {
entry:
  tail call void asm sideeffect "nop", ""() #8, !srcloc !8
  ret void
}

; Function Attrs: alwaysinline convergent norecurse nounwind
define weak void @__wrapped_omp__omp_offloading_801_12a1c02_main_l74(i32* noundef %A_phys, i32* noundef %B_phys, i32* noundef %size) #0 {
entry:
  %dst.addr.i.i = alloca i8*, align 4
  %src.addr.i.i = alloca i8*, align 4
  %size.addr.i.i = alloca i32, align 4
  %_A_phys = alloca i32, align 4
  %_B_phys = alloca i32, align 4
  %_size = alloca i32, align 4
  %_A_phys.0._A_phys.0._A_phys.0..sroa_cast = bitcast i32* %_A_phys to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_A_phys.0._A_phys.0._A_phys.0..sroa_cast)
  %0 = load i32, i32* %A_phys, align 4, !tbaa !9
  store volatile i32 %0, i32* %_A_phys, align 4, !tbaa !9
  %_B_phys.0._B_phys.0._B_phys.0..sroa_cast = bitcast i32* %_B_phys to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_B_phys.0._B_phys.0._B_phys.0..sroa_cast)
  %1 = load i32, i32* %B_phys, align 4, !tbaa !9
  store volatile i32 %1, i32* %_B_phys, align 4, !tbaa !9
  %_size.0._size.0._size.0..sroa_cast = bitcast i32* %_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_size.0._size.0._size.0..sroa_cast)
  %2 = load i32, i32* %size, align 4, !tbaa !9
  store volatile i32 %2, i32* %_size, align 4, !tbaa !9
  %_B_phys.0._B_phys.0._B_phys.0. = load volatile i32, i32* %_B_phys, align 4, !tbaa !9
  %_A_phys.0._A_phys.0._A_phys.0. = load volatile i32, i32* %_A_phys, align 4, !tbaa !9
  %_size.0._size.0._size.0. = load volatile i32, i32* %_size, align 4, !tbaa !9
  %call.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i32 noundef %1, i32 noundef %0, i32 noundef %2) #8
  %3 = tail call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !13
  %4 = inttoptr i32 %1 to i8*
  %5 = inttoptr i32 %0 to i8*
  %cmp.i.i.i = icmp ugt i8* %4, inttoptr (i32 1895825408 to i8*)
  %cmp1.i.i.i = icmp ult i8* %4, inttoptr (i32 1912602623 to i8*)
  %or.cond.i.i.i = and i1 %cmp.i.i.i, %cmp1.i.i.i
  %cmp2.i.i.i = icmp ugt i8* %5, inttoptr (i32 1895825408 to i8*)
  %or.cond19.i.i.i = and i1 %cmp2.i.i.i, %or.cond.i.i.i
  %cmp4.i.i.i = icmp ult i8* %5, inttoptr (i32 1912602623 to i8*)
  %or.cond21.i.i.i = and i1 %cmp4.i.i.i, %or.cond19.i.i.i
  br i1 %or.cond21.i.i.i, label %if.end.i.i.i, label %land.lhs.true5.i.i.i

land.lhs.true5.i.i.i:                             ; preds = %entry
  %cmp6.i.i.i = icmp ugt i8* %4, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i.i = icmp ne i8* %4, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i.i = and i1 %cmp6.i.i.i, %cmp8.i.i.i
  %cmp10.i.i.i = icmp ugt i8* %5, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i.i = and i1 %cmp10.i.i.i, %or.cond23.i.i.i
  %cmp12.i.i.i = icmp ne i8* %5, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i.i = and i1 %cmp12.i.i.i, %or.cond25.i.i.i
  br i1 %or.cond27.i.i.i, label %if.end.i.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %land.lhs.true5.i.i.i
  %call.i.i.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %4, i8* noundef %5) #8
  br label %dev_single_core_memcpy.internalized.exit.i

if.end.i.i.i:                                     ; preds = %land.lhs.true5.i.i.i, %entry
  %cmp13.i.i.i = icmp ugt i32 %2, 1048576
  br i1 %cmp13.i.i.i, label %if.then14.i.i.i, label %while.cond.preheader.i.i

while.cond.preheader.i.i:                         ; preds = %if.end.i.i.i
  %cmp.not3.i.i = icmp eq i32 %2, 0
  br i1 %cmp.not3.i.i, label %dev_single_core_memcpy.internalized.exit.i, label %while.body.i.i.preheader

while.body.i.i.preheader:                         ; preds = %while.cond.preheader.i.i
  br label %while.body.i.i

if.then14.i.i.i:                                  ; preds = %if.end.i.i.i
  %call15.i.i.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %2) #8
  br label %dev_single_core_memcpy.internalized.exit.i

while.body.i.i:                                   ; preds = %while.body.i.i.preheader, %while.body.i.i
  %size.addr.06.i.i = phi i32 [ %dec.i.i, %while.body.i.i ], [ %2, %while.body.i.i.preheader ]
  %src.addr.05.i.i = phi i8* [ %incdec.ptr.i.i, %while.body.i.i ], [ %5, %while.body.i.i.preheader ]
  %dst.addr.04.i.i = phi i8* [ %incdec.ptr1.i.i, %while.body.i.i ], [ %4, %while.body.i.i.preheader ]
  %dec.i.i = add i32 %size.addr.06.i.i, -1
  %incdec.ptr.i.i = getelementptr inbounds i8, i8* %src.addr.05.i.i, i32 1
  %6 = load i8, i8* %src.addr.05.i.i, align 1, !tbaa !14
  %incdec.ptr1.i.i = getelementptr inbounds i8, i8* %dst.addr.04.i.i, i32 1
  store i8 %6, i8* %dst.addr.04.i.i, align 1, !tbaa !14
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %dev_single_core_memcpy.internalized.exit.i.loopexit, label %while.body.i.i, !llvm.loop !15

dev_single_core_memcpy.internalized.exit.i.loopexit: ; preds = %while.body.i.i
  br label %dev_single_core_memcpy.internalized.exit.i

dev_single_core_memcpy.internalized.exit.i:       ; preds = %dev_single_core_memcpy.internalized.exit.i.loopexit, %if.then14.i.i.i, %while.cond.preheader.i.i, %if.then.i.i.i
  %7 = tail call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !17
  %cmp2.not.i.i = icmp eq i32 %2, 0
  br i1 %cmp2.not.i.i, label %compare.internalized.exit.i, label %for.body.i.i.preheader

for.body.i.i.preheader:                           ; preds = %dev_single_core_memcpy.internalized.exit.i
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.preheader, %if.end.i.i
  %i.03.i.i = phi i32 [ %inc.i.i, %if.end.i.i ], [ 0, %for.body.i.i.preheader ]
  %arrayidx.i.i = getelementptr inbounds i8, i8* %4, i32 %i.03.i.i
  %8 = load i8, i8* %arrayidx.i.i, align 1, !tbaa !14
  %arrayidx1.i.i = getelementptr inbounds i8, i8* %5, i32 %i.03.i.i
  %9 = load i8, i8* %arrayidx1.i.i, align 1, !tbaa !14
  %cmp3.not.i.i = icmp eq i8 %8, %9
  br i1 %cmp3.not.i.i, label %if.end.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %for.body.i.i
  %.lcssa6 = phi i8 [ %8, %for.body.i.i ]
  %.lcssa4 = phi i8 [ %9, %for.body.i.i ]
  %conv2.i.i = zext i8 %.lcssa4 to i32
  %conv.i.i = zext i8 %.lcssa6 to i32
  %call.i.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv.i.i, i32 noundef %conv.i.i, i32 noundef %conv2.i.i, i32 noundef %conv2.i.i) #8
  br label %compare.internalized.exit.i

if.end.i.i:                                       ; preds = %for.body.i.i
  store i8 0, i8* %arrayidx.i.i, align 1, !tbaa !14
  %inc.i.i = add nuw i32 %i.03.i.i, 1
  %exitcond.not.i.i = icmp eq i32 %inc.i.i, %2
  br i1 %exitcond.not.i.i, label %compare.internalized.exit.i.loopexit, label %for.body.i.i, !llvm.loop !18

compare.internalized.exit.i.loopexit:             ; preds = %if.end.i.i
  br label %compare.internalized.exit.i

compare.internalized.exit.i:                      ; preds = %compare.internalized.exit.i.loopexit, %if.then.i.i, %dev_single_core_memcpy.internalized.exit.i
  %10 = tail call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !19
  %11 = bitcast i8** %dst.addr.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #6
  %12 = bitcast i8** %src.addr.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #6
  %13 = bitcast i32* %size.addr.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %13) #6
  store i8* %4, i8** %dst.addr.i.i, align 4, !tbaa !20
  store i8* %5, i8** %src.addr.i.i, align 4, !tbaa !20
  store i32 %2, i32* %size.addr.i.i, align 4, !tbaa !9
  br i1 %or.cond21.i.i.i, label %if.end.i.i19.i, label %land.lhs.true5.i.i15.i

land.lhs.true5.i.i15.i:                           ; preds = %compare.internalized.exit.i
  %cmp6.i.i8.i = icmp ugt i8* %4, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i9.i = icmp ne i8* %4, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i10.i = and i1 %cmp6.i.i8.i, %cmp8.i.i9.i
  %cmp10.i.i11.i = icmp ugt i8* %5, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i12.i = and i1 %cmp10.i.i11.i, %or.cond23.i.i10.i
  %cmp12.i.i13.i = icmp ne i8* %5, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i14.i = and i1 %cmp12.i.i13.i, %or.cond25.i.i12.i
  br i1 %or.cond27.i.i14.i, label %if.end.i.i19.i, label %if.then.i.i17.i

if.then.i.i17.i:                                  ; preds = %land.lhs.true5.i.i15.i
  %call.i.i16.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %4, i8* noundef %5) #8
  br label %dev_multi_core_memcpy.internalized.exit.i

if.end.i.i19.i:                                   ; preds = %land.lhs.true5.i.i15.i, %compare.internalized.exit.i
  %cmp13.i.i18.i = icmp ugt i32 %2, 1048576
  br i1 %cmp13.i.i18.i, label %if.then14.i.i21.i, label %if.end.i22.i

if.then14.i.i21.i:                                ; preds = %if.end.i.i19.i
  %call15.i.i20.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %2) #8
  br label %dev_multi_core_memcpy.internalized.exit.i

if.end.i22.i:                                     ; preds = %if.end.i.i19.i
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @2, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i8**, i8**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %size.addr.i.i, i8** nonnull %dst.addr.i.i, i8** nonnull %src.addr.i.i) #6
  br label %dev_multi_core_memcpy.internalized.exit.i

dev_multi_core_memcpy.internalized.exit.i:        ; preds = %if.end.i22.i, %if.then14.i.i21.i, %if.then.i.i17.i
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %13) #6
  %14 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !22
  br i1 %cmp2.not.i.i, label %compare.internalized.exit36.i, label %for.body.i28.i.preheader

for.body.i28.i.preheader:                         ; preds = %dev_multi_core_memcpy.internalized.exit.i
  br label %for.body.i28.i

for.body.i28.i:                                   ; preds = %for.body.i28.i.preheader, %if.end.i35.i
  %i.03.i24.i = phi i32 [ %inc.i33.i, %if.end.i35.i ], [ 0, %for.body.i28.i.preheader ]
  %arrayidx.i25.i = getelementptr inbounds i8, i8* %4, i32 %i.03.i24.i
  %15 = load i8, i8* %arrayidx.i25.i, align 1, !tbaa !14
  %arrayidx1.i26.i = getelementptr inbounds i8, i8* %5, i32 %i.03.i24.i
  %16 = load i8, i8* %arrayidx1.i26.i, align 1, !tbaa !14
  %cmp3.not.i27.i = icmp eq i8 %15, %16
  br i1 %cmp3.not.i27.i, label %if.end.i35.i, label %if.then.i32.i

if.then.i32.i:                                    ; preds = %for.body.i28.i
  %.lcssa2 = phi i8 [ %15, %for.body.i28.i ]
  %.lcssa = phi i8 [ %16, %for.body.i28.i ]
  %conv2.i29.i = zext i8 %.lcssa to i32
  %conv.i30.i = zext i8 %.lcssa2 to i32
  %call.i31.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv.i30.i, i32 noundef %conv.i30.i, i32 noundef %conv2.i29.i, i32 noundef %conv2.i29.i) #8
  br label %compare.internalized.exit36.i

if.end.i35.i:                                     ; preds = %for.body.i28.i
  store i8 0, i8* %arrayidx.i25.i, align 1, !tbaa !14
  %inc.i33.i = add nuw i32 %i.03.i24.i, 1
  %exitcond.not.i34.i = icmp eq i32 %inc.i33.i, %2
  br i1 %exitcond.not.i34.i, label %compare.internalized.exit36.i.loopexit, label %for.body.i28.i, !llvm.loop !18

compare.internalized.exit36.i.loopexit:           ; preds = %if.end.i35.i
  br label %compare.internalized.exit36.i

compare.internalized.exit36.i:                    ; preds = %compare.internalized.exit36.i.loopexit, %if.then.i32.i, %dev_multi_core_memcpy.internalized.exit.i
  %17 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !23
  br i1 %or.cond21.i.i.i, label %if.end.i.i55.i, label %land.lhs.true5.i.i51.i

land.lhs.true5.i.i51.i:                           ; preds = %compare.internalized.exit36.i
  %cmp6.i.i44.i = icmp ugt i8* %4, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i45.i = icmp ne i8* %4, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i46.i = and i1 %cmp6.i.i44.i, %cmp8.i.i45.i
  %cmp10.i.i47.i = icmp ugt i8* %5, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i48.i = and i1 %cmp10.i.i47.i, %or.cond23.i.i46.i
  %cmp12.i.i49.i = icmp ne i8* %5, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i50.i = and i1 %cmp12.i.i49.i, %or.cond25.i.i48.i
  br i1 %or.cond27.i.i50.i, label %if.end.i.i55.i, label %if.then.i.i53.i

if.then.i.i53.i:                                  ; preds = %land.lhs.true5.i.i51.i
  %call.i.i52.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %4, i8* noundef %5) #8
  br label %dev_memcpy.internalized.exit

if.end.i.i55.i:                                   ; preds = %land.lhs.true5.i.i51.i, %compare.internalized.exit36.i
  %cmp13.i.i54.i = icmp ugt i32 %2, 1048576
  br i1 %cmp13.i.i54.i, label %if.then14.i.i57.i, label %if.end.i58.i

if.then14.i.i57.i:                                ; preds = %if.end.i.i55.i
  %call15.i.i56.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %2) #8
  br label %dev_memcpy.internalized.exit

if.end.i58.i:                                     ; preds = %if.end.i.i55.i
  %call1.i.i = call i32 bitcast (i32 (...)* @dm_memcpy_async to i32 (i8*, i8*, i32)*)(i8* noundef %4, i8* noundef %5, i32 noundef %2) #8
  %call2.i.i = call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  br label %dev_memcpy.internalized.exit

dev_memcpy.internalized.exit:                     ; preds = %if.end.i58.i, %if.then14.i.i57.i, %if.then.i.i53.i
  %call9.i = call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  %18 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !24
  %sub.i = sub i32 %7, %3
  %sub12.i = sub i32 %14, %10
  %sub13.i = sub i32 %18, %17
  %call14.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str.1, i32 0, i32 0), i32 noundef %sub.i, i32 noundef %sub12.i, i32 noundef %sub13.i) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_size.0._size.0._size.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_B_phys.0._B_phys.0._B_phys.0..sroa_cast)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_A_phys.0._A_phys.0._A_phys.0..sroa_cast)
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent nounwind
define protected void @dev_memcpy(i32 noundef %dst_phys, i32 noundef %src_phys, i32 noundef %size) local_unnamed_addr #2 {
entry:
  %dst.addr.i = alloca i8*, align 4
  %src.addr.i = alloca i8*, align 4
  %size.addr.i = alloca i32, align 4
  %call = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i32 noundef %dst_phys, i32 noundef %src_phys, i32 noundef %size) #8
  %0 = tail call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !13
  %1 = inttoptr i32 %dst_phys to i8*
  %2 = inttoptr i32 %src_phys to i8*
  %cmp.i.i = icmp ugt i8* %1, inttoptr (i32 1895825408 to i8*)
  %cmp1.i.i = icmp ult i8* %1, inttoptr (i32 1912602623 to i8*)
  %or.cond.i.i = and i1 %cmp.i.i, %cmp1.i.i
  %cmp2.i.i = icmp ugt i8* %2, inttoptr (i32 1895825408 to i8*)
  %or.cond19.i.i = and i1 %or.cond.i.i, %cmp2.i.i
  %cmp4.i.i = icmp ult i8* %2, inttoptr (i32 1912602623 to i8*)
  %or.cond21.i.i = and i1 %cmp4.i.i, %or.cond19.i.i
  br i1 %or.cond21.i.i, label %if.end.i.i, label %land.lhs.true5.i.i

land.lhs.true5.i.i:                               ; preds = %entry
  %cmp6.i.i = icmp ugt i8* %1, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i = icmp ne i8* %1, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i = and i1 %cmp6.i.i, %cmp8.i.i
  %cmp10.i.i = icmp ugt i8* %2, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i = and i1 %or.cond23.i.i, %cmp10.i.i
  %cmp12.i.i = icmp ne i8* %2, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i = and i1 %cmp12.i.i, %or.cond25.i.i
  br i1 %or.cond27.i.i, label %if.end.i.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %land.lhs.true5.i.i
  %call.i.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %1, i8* noundef %2) #8
  br label %dev_single_core_memcpy.exit

if.end.i.i:                                       ; preds = %land.lhs.true5.i.i, %entry
  %cmp13.i.i = icmp ugt i32 %size, 1048576
  br i1 %cmp13.i.i, label %if.then14.i.i, label %while.cond.preheader.i

while.cond.preheader.i:                           ; preds = %if.end.i.i
  %cmp.not7.i = icmp eq i32 %size, 0
  br i1 %cmp.not7.i, label %dev_single_core_memcpy.exit, label %while.body.i.preheader

while.body.i.preheader:                           ; preds = %while.cond.preheader.i
  br label %while.body.i

if.then14.i.i:                                    ; preds = %if.end.i.i
  %call15.i.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %dev_single_core_memcpy.exit

while.body.i:                                     ; preds = %while.body.i.preheader, %while.body.i
  %size.addr.010.i = phi i32 [ %dec.i, %while.body.i ], [ %size, %while.body.i.preheader ]
  %src.addr.09.i = phi i8* [ %incdec.ptr.i, %while.body.i ], [ %2, %while.body.i.preheader ]
  %dst.addr.08.i = phi i8* [ %incdec.ptr1.i, %while.body.i ], [ %1, %while.body.i.preheader ]
  %dec.i = add i32 %size.addr.010.i, -1
  %incdec.ptr.i = getelementptr inbounds i8, i8* %src.addr.09.i, i32 1
  %3 = load i8, i8* %src.addr.09.i, align 1, !tbaa !14
  %incdec.ptr1.i = getelementptr inbounds i8, i8* %dst.addr.08.i, i32 1
  store i8 %3, i8* %dst.addr.08.i, align 1, !tbaa !14
  %cmp.not.i = icmp eq i32 %dec.i, 0
  br i1 %cmp.not.i, label %dev_single_core_memcpy.exit.loopexit, label %while.body.i, !llvm.loop !15

dev_single_core_memcpy.exit.loopexit:             ; preds = %while.body.i
  br label %dev_single_core_memcpy.exit

dev_single_core_memcpy.exit:                      ; preds = %dev_single_core_memcpy.exit.loopexit, %if.then14.i.i, %while.cond.preheader.i, %if.then.i.i
  %4 = tail call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !17
  %cmp29.not.i = icmp eq i32 %size, 0
  br i1 %cmp29.not.i, label %compare.exit, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %dev_single_core_memcpy.exit
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %if.end.i
  %i.030.i = phi i32 [ %inc.i, %if.end.i ], [ 0, %for.body.i.preheader ]
  %arrayidx.i = getelementptr inbounds i8, i8* %1, i32 %i.030.i
  %5 = load i8, i8* %arrayidx.i, align 1, !tbaa !14
  %arrayidx1.i = getelementptr inbounds i8, i8* %2, i32 %i.030.i
  %6 = load i8, i8* %arrayidx1.i, align 1, !tbaa !14
  %cmp3.not.i = icmp eq i8 %5, %6
  br i1 %cmp3.not.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %.lcssa6 = phi i8 [ %5, %for.body.i ]
  %.lcssa4 = phi i8 [ %6, %for.body.i ]
  %conv2.i = zext i8 %.lcssa4 to i32
  %conv.i = zext i8 %.lcssa6 to i32
  %call.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv.i, i32 noundef %conv.i, i32 noundef %conv2.i, i32 noundef %conv2.i) #8
  br label %compare.exit

if.end.i:                                         ; preds = %for.body.i
  store i8 0, i8* %arrayidx.i, align 1, !tbaa !14
  %inc.i = add nuw i32 %i.030.i, 1
  %exitcond.not.i = icmp eq i32 %inc.i, %size
  br i1 %exitcond.not.i, label %compare.exit.loopexit, label %for.body.i, !llvm.loop !18

compare.exit.loopexit:                            ; preds = %if.end.i
  br label %compare.exit

compare.exit:                                     ; preds = %compare.exit.loopexit, %if.then.i, %dev_single_core_memcpy.exit
  %7 = tail call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !19
  %8 = bitcast i8** %dst.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8)
  %9 = bitcast i8** %src.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9)
  %10 = bitcast i32* %size.addr.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10)
  store i8* %1, i8** %dst.addr.i, align 4, !tbaa !20
  store i8* %2, i8** %src.addr.i, align 4, !tbaa !20
  store i32 %size, i32* %size.addr.i, align 4, !tbaa !9
  br i1 %or.cond21.i.i, label %if.end.i.i60, label %land.lhs.true5.i.i56

land.lhs.true5.i.i56:                             ; preds = %compare.exit
  %cmp6.i.i49 = icmp ugt i8* %1, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i50 = icmp ne i8* %1, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i51 = and i1 %cmp6.i.i49, %cmp8.i.i50
  %cmp10.i.i52 = icmp ugt i8* %2, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i53 = and i1 %or.cond23.i.i51, %cmp10.i.i52
  %cmp12.i.i54 = icmp ne i8* %2, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i55 = and i1 %cmp12.i.i54, %or.cond25.i.i53
  br i1 %or.cond27.i.i55, label %if.end.i.i60, label %if.then.i.i58

if.then.i.i58:                                    ; preds = %land.lhs.true5.i.i56
  %call.i.i57 = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %1, i8* noundef %2) #8
  br label %dev_multi_core_memcpy.exit

if.end.i.i60:                                     ; preds = %land.lhs.true5.i.i56, %compare.exit
  %cmp13.i.i59 = icmp ugt i32 %size, 1048576
  br i1 %cmp13.i.i59, label %if.then14.i.i62, label %if.end.i63

if.then14.i.i62:                                  ; preds = %if.end.i.i60
  %call15.i.i61 = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %dev_multi_core_memcpy.exit

if.end.i63:                                       ; preds = %if.end.i.i60
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @2, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i8**, i8**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %size.addr.i, i8** nonnull %dst.addr.i, i8** nonnull %src.addr.i) #6
  br label %dev_multi_core_memcpy.exit

dev_multi_core_memcpy.exit:                       ; preds = %if.end.i63, %if.then14.i.i62, %if.then.i.i58
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10)
  %11 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !22
  br i1 %cmp29.not.i, label %compare.exit77, label %for.body.i69.preheader

for.body.i69.preheader:                           ; preds = %dev_multi_core_memcpy.exit
  br label %for.body.i69

for.body.i69:                                     ; preds = %for.body.i69.preheader, %if.end.i76
  %i.030.i65 = phi i32 [ %inc.i74, %if.end.i76 ], [ 0, %for.body.i69.preheader ]
  %arrayidx.i66 = getelementptr inbounds i8, i8* %1, i32 %i.030.i65
  %12 = load i8, i8* %arrayidx.i66, align 1, !tbaa !14
  %arrayidx1.i67 = getelementptr inbounds i8, i8* %2, i32 %i.030.i65
  %13 = load i8, i8* %arrayidx1.i67, align 1, !tbaa !14
  %cmp3.not.i68 = icmp eq i8 %12, %13
  br i1 %cmp3.not.i68, label %if.end.i76, label %if.then.i73

if.then.i73:                                      ; preds = %for.body.i69
  %.lcssa2 = phi i8 [ %12, %for.body.i69 ]
  %.lcssa = phi i8 [ %13, %for.body.i69 ]
  %conv2.i70 = zext i8 %.lcssa to i32
  %conv.i71 = zext i8 %.lcssa2 to i32
  %call.i72 = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv.i71, i32 noundef %conv.i71, i32 noundef %conv2.i70, i32 noundef %conv2.i70) #8
  br label %compare.exit77

if.end.i76:                                       ; preds = %for.body.i69
  store i8 0, i8* %arrayidx.i66, align 1, !tbaa !14
  %inc.i74 = add nuw i32 %i.030.i65, 1
  %exitcond.not.i75 = icmp eq i32 %inc.i74, %size
  br i1 %exitcond.not.i75, label %compare.exit77.loopexit, label %for.body.i69, !llvm.loop !18

compare.exit77.loopexit:                          ; preds = %if.end.i76
  br label %compare.exit77

compare.exit77:                                   ; preds = %compare.exit77.loopexit, %if.then.i73, %dev_multi_core_memcpy.exit
  %14 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !23
  br i1 %or.cond21.i.i, label %if.end.i.i96, label %land.lhs.true5.i.i92

land.lhs.true5.i.i92:                             ; preds = %compare.exit77
  %cmp6.i.i85 = icmp ugt i8* %1, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i86 = icmp ne i8* %1, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i87 = and i1 %cmp6.i.i85, %cmp8.i.i86
  %cmp10.i.i88 = icmp ugt i8* %2, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i89 = and i1 %or.cond23.i.i87, %cmp10.i.i88
  %cmp12.i.i90 = icmp ne i8* %2, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i91 = and i1 %cmp12.i.i90, %or.cond25.i.i89
  br i1 %or.cond27.i.i91, label %if.end.i.i96, label %if.then.i.i94

if.then.i.i94:                                    ; preds = %land.lhs.true5.i.i92
  %call.i.i93 = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %1, i8* noundef %2) #8
  br label %dev_dma_memcpy.exit

if.end.i.i96:                                     ; preds = %land.lhs.true5.i.i92, %compare.exit77
  %cmp13.i.i95 = icmp ugt i32 %size, 1048576
  br i1 %cmp13.i.i95, label %if.then14.i.i98, label %if.end.i99

if.then14.i.i98:                                  ; preds = %if.end.i.i96
  %call15.i.i97 = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %dev_dma_memcpy.exit

if.end.i99:                                       ; preds = %if.end.i.i96
  %call1.i = call i32 bitcast (i32 (...)* @dm_memcpy_async to i32 (i8*, i8*, i32)*)(i8* noundef %1, i8* noundef %2, i32 noundef %size) #8
  %call2.i = call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  br label %dev_dma_memcpy.exit

dev_dma_memcpy.exit:                              ; preds = %if.end.i99, %if.then14.i.i98, %if.then.i.i94
  %call9 = call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  %15 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !24
  %sub = sub i32 %4, %0
  %sub12 = sub i32 %11, %7
  %sub13 = sub i32 %15, %14
  %call14 = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str.1, i32 0, i32 0), i32 noundef %sub, i32 noundef %sub12, i32 noundef %sub13) #8
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_load_uint32_noblock(i64 noundef %addr, i32* nocapture noundef writeonly %val) #3 {
entry:
  %shr.i = lshr i64 %addr, 32
  %conv.i = trunc i64 %shr.i to i32
  %conv.i8 = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i8 to i32*
  %1 = tail call { i32, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lw $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i, i32* %0, i32 undef) #8, !srcloc !25
  %asmresult = extractvalue { i32, i32 } %1, 0
  store i32 %asmresult, i32* %val, align 4, !tbaa !9
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_load_uint32(i64 noundef %addr) #3 {
entry:
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i8.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i8.i to i32*
  %1 = tail call { i32, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lw $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i, i32* %0, i32 undef) #8, !srcloc !25
  %asmresult.i = extractvalue { i32, i32 } %1, 0
  ret i32 %asmresult.i
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_store_uint32_noblock(i64 noundef %addr, i32 noundef %val) #3 {
entry:
  %shr.i = lshr i64 %addr, 32
  %conv.i = trunc i64 %shr.i to i32
  %conv.i6 = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6 to i32*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sw $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i, i32 %val, i32* %0, i32 undef) #8, !srcloc !26
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal void @hero_store_uint32(i64 noundef %addr, i32 noundef %val) #3 {
entry:
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i6.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6.i to i32*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sw $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i, i32 %val, i32* %0, i32 undef) #8, !srcloc !26
  ret void
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_load_uint16_noblock(i64 noundef %addr, i16* nocapture noundef writeonly %val) #3 {
entry:
  %shr.i = lshr i64 %addr, 32
  %conv.i = trunc i64 %shr.i to i32
  %conv.i8 = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i8 to i16*
  %1 = tail call { i16, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lhu $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i, i16* %0, i32 undef) #8, !srcloc !27
  %asmresult = extractvalue { i16, i32 } %1, 0
  store i16 %asmresult, i16* %val, align 2, !tbaa !28
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal zeroext i16 @hero_load_uint16(i64 noundef %addr) #3 {
entry:
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i8.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i8.i to i16*
  %1 = tail call { i16, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lhu $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i, i16* %0, i32 undef) #8, !srcloc !27
  %asmresult.i = extractvalue { i16, i32 } %1, 0
  ret i16 %asmresult.i
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_store_uint16_noblock(i64 noundef %addr, i16 noundef zeroext %val) #3 {
entry:
  %shr.i = lshr i64 %addr, 32
  %conv.i = trunc i64 %shr.i to i32
  %conv.i6 = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6 to i16*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sh $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i, i16 %val, i16* %0, i32 undef) #8, !srcloc !30
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal void @hero_store_uint16(i64 noundef %addr, i16 noundef zeroext %val) #3 {
entry:
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i6.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6.i to i16*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sh $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i, i16 %val, i16* %0, i32 undef) #8, !srcloc !30
  ret void
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_load_uint8_noblock(i64 noundef %addr, i8* nocapture noundef writeonly %val) #3 {
entry:
  %shr.i = lshr i64 %addr, 32
  %conv.i = trunc i64 %shr.i to i32
  %conv.i7 = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i7 to i8*
  %1 = tail call { i8, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lbu $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i, i8* %0, i32 undef) #8, !srcloc !31
  %asmresult = extractvalue { i8, i32 } %1, 0
  store i8 %asmresult, i8* %val, align 1, !tbaa !14
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal zeroext i8 @hero_load_uint8(i64 noundef %addr) #3 {
entry:
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i7.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i7.i to i8*
  %1 = tail call { i8, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lbu $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i, i8* %0, i32 undef) #8, !srcloc !31
  %asmresult.i = extractvalue { i8, i32 } %1, 0
  ret i8 %asmresult.i
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_store_uint8_noblock(i64 noundef %addr, i8 noundef zeroext %val) #3 {
entry:
  %shr.i = lshr i64 %addr, 32
  %conv.i = trunc i64 %shr.i to i32
  %conv.i6 = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6 to i8*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sb $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i, i8 %val, i8* %0, i32 undef) #8, !srcloc !32
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal void @hero_store_uint8(i64 noundef %addr, i8 noundef zeroext %val) #3 {
entry:
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i6.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6.i to i8*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sb $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i, i8 %val, i8* %0, i32 undef) #8, !srcloc !32
  ret void
}

; Function Attrs: convergent inlinehint nounwind
define internal i64 @hero_load_uint64(i64 noundef %addr) #3 {
entry:
  %shr.i.i.i = lshr i64 %addr, 32
  %conv.i.i.i = trunc i64 %shr.i.i.i to i32
  %conv.i8.i.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i8.i.i to i32*
  %1 = tail call { i32, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lw $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i.i, i32* %0, i32 undef) #8, !srcloc !25
  %asmresult.i.i = extractvalue { i32, i32 } %1, 0
  %add = add i64 %addr, 4
  %shr.i.i.i7 = lshr i64 %add, 32
  %conv.i.i.i8 = trunc i64 %shr.i.i.i7 to i32
  %conv.i8.i.i9 = trunc i64 %add to i32
  %2 = inttoptr i32 %conv.i8.i.i9 to i32*
  %3 = tail call { i32, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lw $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i.i8, i32* %2, i32 undef) #8, !srcloc !25
  %asmresult.i.i10 = extractvalue { i32, i32 } %3, 0
  %conv = zext i32 %asmresult.i.i10 to i64
  %shl = shl nuw i64 %conv, 32
  %conv2 = zext i32 %asmresult.i.i to i64
  %or = or i64 %shl, %conv2
  ret i64 %or
}

; Function Attrs: convergent inlinehint nounwind
define internal void @hero_store_uint64(i64 noundef %addr, i64 noundef %val) #3 {
entry:
  %conv = trunc i64 %val to i32
  %shr.i.i.i = lshr i64 %addr, 32
  %conv.i.i.i = trunc i64 %shr.i.i.i to i32
  %conv.i6.i.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6.i.i to i32*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sw $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i.i, i32 %conv, i32* %0, i32 undef) #8, !srcloc !26
  %shr = lshr i64 %val, 32
  %conv1 = trunc i64 %shr to i32
  %add = add i64 %addr, 4
  %shr.i.i.i6 = lshr i64 %add, 32
  %conv.i.i.i7 = trunc i64 %shr.i.i.i6 to i32
  %conv.i6.i.i8 = trunc i64 %add to i32
  %2 = inttoptr i32 %conv.i6.i.i8 to i32*
  %3 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sw $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i.i7, i32 %conv1, i32* %2, i32 undef) #8, !srcloc !26
  ret void
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_load_uint64_noblock(i64 noundef %addr, i64* nocapture noundef writeonly %val) #3 {
entry:
  %0 = bitcast i64* %val to i32*
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i8.i = trunc i64 %addr to i32
  %1 = inttoptr i32 %conv.i8.i to i32*
  %2 = tail call { i32, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lw $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i, i32* %1, i32 undef) #8, !srcloc !25
  %asmresult.i = extractvalue { i32, i32 } %2, 0
  store i32 %asmresult.i, i32* %0, align 4, !tbaa !9
  %add.ptr = getelementptr inbounds i32, i32* %0, i32 1
  %add = add i64 %addr, 4
  %shr.i.i8 = lshr i64 %add, 32
  %conv.i.i9 = trunc i64 %shr.i.i8 to i32
  %conv.i8.i10 = trunc i64 %add to i32
  %3 = inttoptr i32 %conv.i8.i10 to i32*
  %4 = tail call { i32, i32 } asm sideeffect "csrrci $1, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09lw $0, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $1", "=&r,=&r,r,r,1,~{memory}"(i32 %conv.i.i9, i32* %3, i32 undef) #8, !srcloc !25
  %asmresult.i11 = extractvalue { i32, i32 } %4, 0
  store i32 %asmresult.i11, i32* %add.ptr, align 4, !tbaa !9
  ret i32 0
}

; Function Attrs: convergent inlinehint nounwind
define internal i32 @hero_store_uint64_noblock(i64 noundef %addr, i64 noundef %val) #3 {
entry:
  %conv = trunc i64 %val to i32
  %shr.i.i = lshr i64 %addr, 32
  %conv.i.i = trunc i64 %shr.i.i to i32
  %conv.i6.i = trunc i64 %addr to i32
  %0 = inttoptr i32 %conv.i6.i to i32*
  %1 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sw $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i, i32 %conv, i32* %0, i32 undef) #8, !srcloc !26
  %shr = lshr i64 %val, 32
  %conv1 = trunc i64 %shr to i32
  %add = add i64 %addr, 4
  %shr.i.i9 = lshr i64 %add, 32
  %conv.i.i10 = trunc i64 %shr.i.i9 to i32
  %conv.i6.i11 = trunc i64 %add to i32
  %2 = inttoptr i32 %conv.i6.i11 to i32*
  %3 = tail call i32 asm sideeffect "csrrci $0, 0x300, 3\0A\09csrw 0xbc0, zero\0A\09sw $2, 0($3)\0A\09csrw 0xbc0, zero\0A\09csrrw x0, 0x300, $0", "=&r,r,r,r,0,~{memory}"(i32 %conv.i.i10, i32 %conv1, i32* %2, i32 undef) #8, !srcloc !26
  ret i32 0
}

; Function Attrs: convergent
declare dso_local i32 @snrt_printf(...) local_unnamed_addr #4

; Function Attrs: convergent nounwind
define protected void @dev_single_core_memcpy(i8* noundef %dst, i8* noundef %src, i32 noundef %size) local_unnamed_addr #2 {
entry:
  %cmp.i = icmp ugt i8* %dst, inttoptr (i32 1895825408 to i8*)
  %cmp1.i = icmp ult i8* %dst, inttoptr (i32 1912602623 to i8*)
  %or.cond.i = and i1 %cmp.i, %cmp1.i
  %cmp2.i = icmp ugt i8* %src, inttoptr (i32 1895825408 to i8*)
  %or.cond19.i = and i1 %or.cond.i, %cmp2.i
  %cmp4.i = icmp ult i8* %src, inttoptr (i32 1912602623 to i8*)
  %or.cond21.i = and i1 %cmp4.i, %or.cond19.i
  br i1 %or.cond21.i, label %if.end.i, label %land.lhs.true5.i

land.lhs.true5.i:                                 ; preds = %entry
  %cmp6.i = icmp ugt i8* %dst, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i = icmp ne i8* %dst, inttoptr (i32 -1 to i8*)
  %or.cond23.i = and i1 %cmp6.i, %cmp8.i
  %cmp10.i = icmp ugt i8* %src, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i = and i1 %or.cond23.i, %cmp10.i
  %cmp12.i = icmp ne i8* %src, inttoptr (i32 -1 to i8*)
  %or.cond27.i = and i1 %cmp12.i, %or.cond25.i
  br i1 %or.cond27.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %land.lhs.true5.i
  %call.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %dst, i8* noundef %src) #8
  br label %while.end

if.end.i:                                         ; preds = %land.lhs.true5.i, %entry
  %cmp13.i = icmp ugt i32 %size, 1048576
  br i1 %cmp13.i, label %if.then14.i, label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.end.i
  %cmp.not7 = icmp eq i32 %size, 0
  br i1 %cmp.not7, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %while.cond.preheader
  br label %while.body

if.then14.i:                                      ; preds = %if.end.i
  %call15.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %while.end

while.body:                                       ; preds = %while.body.preheader, %while.body
  %size.addr.010 = phi i32 [ %dec, %while.body ], [ %size, %while.body.preheader ]
  %src.addr.09 = phi i8* [ %incdec.ptr, %while.body ], [ %src, %while.body.preheader ]
  %dst.addr.08 = phi i8* [ %incdec.ptr1, %while.body ], [ %dst, %while.body.preheader ]
  %dec = add i32 %size.addr.010, -1
  %incdec.ptr = getelementptr inbounds i8, i8* %src.addr.09, i32 1
  %0 = load i8, i8* %src.addr.09, align 1, !tbaa !14
  %incdec.ptr1 = getelementptr inbounds i8, i8* %dst.addr.08, i32 1
  store i8 %0, i8* %dst.addr.08, align 1, !tbaa !14
  %cmp.not = icmp eq i32 %dec, 0
  br i1 %cmp.not, label %while.end.loopexit, label %while.body, !llvm.loop !15

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.then14.i, %while.cond.preheader, %if.then.i
  ret void
}

; Function Attrs: convergent nounwind
define protected void @compare(i8* nocapture noundef %dst, i8* nocapture noundef readonly %src, i32 noundef %size) local_unnamed_addr #2 {
entry:
  %cmp29.not = icmp eq i32 %size, 0
  br i1 %cmp29.not, label %cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %i.030 = phi i32 [ %inc, %if.end ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, i8* %dst, i32 %i.030
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !14
  %arrayidx1 = getelementptr inbounds i8, i8* %src, i32 %i.030
  %1 = load i8, i8* %arrayidx1, align 1, !tbaa !14
  %cmp3.not = icmp eq i8 %0, %1
  br i1 %cmp3.not, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %.lcssa2 = phi i8 [ %0, %for.body ]
  %.lcssa = phi i8 [ %1, %for.body ]
  %conv2 = zext i8 %.lcssa to i32
  %conv = zext i8 %.lcssa2 to i32
  %call = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv, i32 noundef %conv, i32 noundef %conv2, i32 noundef %conv2) #8
  br label %cleanup

if.end:                                           ; preds = %for.body
  store i8 0, i8* %arrayidx, align 1, !tbaa !14
  %inc = add nuw i32 %i.030, 1
  %exitcond.not = icmp eq i32 %inc, %size
  br i1 %exitcond.not, label %cleanup.loopexit, label %for.body, !llvm.loop !18

cleanup.loopexit:                                 ; preds = %if.end
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %if.then, %entry
  ret void
}

; Function Attrs: convergent nounwind
define protected void @dev_multi_core_memcpy(i8* noundef %dst, i8* noundef %src, i32 noundef %size) local_unnamed_addr #2 {
entry:
  %dst.addr = alloca i8*, align 4
  %src.addr = alloca i8*, align 4
  %size.addr = alloca i32, align 4
  store i8* %dst, i8** %dst.addr, align 4, !tbaa !20
  store i8* %src, i8** %src.addr, align 4, !tbaa !20
  store i32 %size, i32* %size.addr, align 4, !tbaa !9
  %cmp.i = icmp ugt i8* %dst, inttoptr (i32 1895825408 to i8*)
  %cmp1.i = icmp ult i8* %dst, inttoptr (i32 1912602623 to i8*)
  %or.cond.i = and i1 %cmp.i, %cmp1.i
  %cmp2.i = icmp ugt i8* %src, inttoptr (i32 1895825408 to i8*)
  %or.cond19.i = and i1 %or.cond.i, %cmp2.i
  %cmp4.i = icmp ult i8* %src, inttoptr (i32 1912602623 to i8*)
  %or.cond21.i = and i1 %cmp4.i, %or.cond19.i
  br i1 %or.cond21.i, label %if.end.i, label %land.lhs.true5.i

land.lhs.true5.i:                                 ; preds = %entry
  %cmp6.i = icmp ugt i8* %dst, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i = icmp ne i8* %dst, inttoptr (i32 -1 to i8*)
  %or.cond23.i = and i1 %cmp6.i, %cmp8.i
  %cmp10.i = icmp ugt i8* %src, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i = and i1 %or.cond23.i, %cmp10.i
  %cmp12.i = icmp ne i8* %src, inttoptr (i32 -1 to i8*)
  %or.cond27.i = and i1 %cmp12.i, %or.cond25.i
  br i1 %or.cond27.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %land.lhs.true5.i
  %call.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %dst, i8* noundef %src) #8
  br label %return

if.end.i:                                         ; preds = %land.lhs.true5.i, %entry
  %cmp13.i = icmp ugt i32 %size, 1048576
  br i1 %cmp13.i, label %if.then14.i, label %if.end

if.then14.i:                                      ; preds = %if.end.i
  %call15.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %return

if.end:                                           ; preds = %if.end.i
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @2, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i8**, i8**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %size.addr, i8** nonnull %dst.addr, i8** nonnull %src.addr)
  br label %return

return:                                           ; preds = %if.end, %if.then14.i, %if.then.i
  ret void
}

; Function Attrs: convergent nounwind
define protected void @dev_dma_memcpy(i8* noundef %dst, i8* noundef %src, i32 noundef %size) local_unnamed_addr #2 {
entry:
  %cmp.i = icmp ugt i8* %dst, inttoptr (i32 1895825408 to i8*)
  %cmp1.i = icmp ult i8* %dst, inttoptr (i32 1912602623 to i8*)
  %or.cond.i = and i1 %cmp.i, %cmp1.i
  %cmp2.i = icmp ugt i8* %src, inttoptr (i32 1895825408 to i8*)
  %or.cond19.i = and i1 %or.cond.i, %cmp2.i
  %cmp4.i = icmp ult i8* %src, inttoptr (i32 1912602623 to i8*)
  %or.cond21.i = and i1 %cmp4.i, %or.cond19.i
  br i1 %or.cond21.i, label %if.end.i, label %land.lhs.true5.i

land.lhs.true5.i:                                 ; preds = %entry
  %cmp6.i = icmp ugt i8* %dst, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i = icmp ne i8* %dst, inttoptr (i32 -1 to i8*)
  %or.cond23.i = and i1 %cmp6.i, %cmp8.i
  %cmp10.i = icmp ugt i8* %src, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i = and i1 %or.cond23.i, %cmp10.i
  %cmp12.i = icmp ne i8* %src, inttoptr (i32 -1 to i8*)
  %or.cond27.i = and i1 %cmp12.i, %or.cond25.i
  br i1 %or.cond27.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %land.lhs.true5.i
  %call.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %dst, i8* noundef %src) #8
  br label %return

if.end.i:                                         ; preds = %land.lhs.true5.i, %entry
  %cmp13.i = icmp ugt i32 %size, 1048576
  br i1 %cmp13.i, label %if.then14.i, label %if.end

if.then14.i:                                      ; preds = %if.end.i
  %call15.i = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %return

if.end:                                           ; preds = %if.end.i
  %call1 = tail call i32 bitcast (i32 (...)* @dm_memcpy_async to i32 (i8*, i8*, i32)*)(i8* noundef %dst, i8* noundef %src, i32 noundef %size) #8
  %call2 = tail call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  br label %return

return:                                           ; preds = %if.end, %if.then14.i, %if.then.i
  ret void
}

; Function Attrs: convergent
declare dso_local i32 @dm_wait(...) local_unnamed_addr #4

; Function Attrs: convergent nounwind
define protected i32 @dev_check_transfer(i8* noundef %dst, i8* noundef %src, i32 noundef %size) local_unnamed_addr #2 {
entry:
  %cmp = icmp ugt i8* %dst, inttoptr (i32 1895825408 to i8*)
  %cmp1 = icmp ult i8* %dst, inttoptr (i32 1912602623 to i8*)
  %or.cond = and i1 %cmp, %cmp1
  %cmp2 = icmp ugt i8* %src, inttoptr (i32 1895825408 to i8*)
  %or.cond19 = and i1 %or.cond, %cmp2
  %cmp4 = icmp ult i8* %src, inttoptr (i32 1912602623 to i8*)
  %or.cond21 = and i1 %cmp4, %or.cond19
  br i1 %or.cond21, label %if.end, label %land.lhs.true5

land.lhs.true5:                                   ; preds = %entry
  %cmp6 = icmp ugt i8* %dst, inttoptr (i32 -1073741824 to i8*)
  %cmp8 = icmp ne i8* %dst, inttoptr (i32 -1 to i8*)
  %or.cond23 = and i1 %cmp6, %cmp8
  %cmp10 = icmp ugt i8* %src, inttoptr (i32 -1073741824 to i8*)
  %or.cond25 = and i1 %or.cond23, %cmp10
  %cmp12 = icmp ne i8* %src, inttoptr (i32 -1 to i8*)
  %or.cond27 = and i1 %cmp12, %or.cond25
  br i1 %or.cond27, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true5
  %call = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %dst, i8* noundef %src) #8
  br label %return

if.end:                                           ; preds = %land.lhs.true5, %entry
  %cmp13 = icmp ugt i32 %size, 1048576
  br i1 %cmp13, label %if.then14, label %return

if.then14:                                        ; preds = %if.end
  %call15 = tail call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %size) #8
  br label %return

return:                                           ; preds = %if.then14, %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then14 ], [ 1, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: alwaysinline norecurse nounwind
define internal void @.omp_outlined.(i32* noalias nocapture noundef readonly %.global_tid., i32* noalias nocapture noundef readnone %.bound_tid., i32* nocapture noundef readonly %size, i8** nocapture noundef readonly %dst, i8** nocapture noundef readonly %src) #5 {
entry:
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %0 = load i32, i32* %size, align 4, !tbaa !9
  %cmp.not = icmp eq i32 %0, 0
  br i1 %cmp.not, label %omp.precond.end, label %omp.precond.then

omp.precond.then:                                 ; preds = %entry
  %sub2 = add i32 %0, -1
  %1 = bitcast i32* %.omp.lb to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #6
  store i32 0, i32* %.omp.lb, align 4, !tbaa !9
  %2 = bitcast i32* %.omp.ub to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #6
  store i32 %sub2, i32* %.omp.ub, align 4, !tbaa !9
  %3 = bitcast i32* %.omp.stride to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #6
  store i32 1, i32* %.omp.stride, align 4, !tbaa !9
  %4 = bitcast i32* %.omp.is_last to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #6
  store i32 0, i32* %.omp.is_last, align 4, !tbaa !9
  %5 = load i32, i32* %.global_tid., align 4, !tbaa !9
  call void @__kmpc_for_static_init_4u(%struct.ident_t* nonnull @1, i32 %5, i32 34, i32* nonnull %.omp.is_last, i32* nonnull %.omp.lb, i32* nonnull %.omp.ub, i32* nonnull %.omp.stride, i32 1, i32 1) #6
  %6 = load i32, i32* %.omp.ub, align 4, !tbaa !9
  %7 = call i32 @llvm.umin.i32(i32 %6, i32 %sub2), !range !33
  store i32 %7, i32* %.omp.ub, align 4, !tbaa !9
  %8 = load i32, i32* %.omp.lb, align 4, !tbaa !9
  %cmp522.not = icmp ugt i32 %8, %7
  br i1 %cmp522.not, label %omp.loop.exit, label %omp.inner.for.body.preheader

omp.inner.for.body.preheader:                     ; preds = %omp.precond.then
  br label %omp.inner.for.body

omp.inner.for.body:                               ; preds = %omp.inner.for.body.preheader, %omp.inner.for.body
  %.omp.iv.023 = phi i32 [ %add8, %omp.inner.for.body ], [ %8, %omp.inner.for.body.preheader ]
  %9 = load i8*, i8** %src, align 4, !tbaa !20
  %add.ptr = getelementptr inbounds i8, i8* %9, i32 %.omp.iv.023
  %10 = load i8, i8* %add.ptr, align 1, !tbaa !14
  %11 = load i8*, i8** %dst, align 4, !tbaa !20
  %add.ptr7 = getelementptr inbounds i8, i8* %11, i32 %.omp.iv.023
  store i8 %10, i8* %add.ptr7, align 1, !tbaa !14
  %add8 = add nuw i32 %.omp.iv.023, 1
  %12 = load i32, i32* %.omp.ub, align 4, !tbaa !9
  %add = add i32 %12, 1
  %cmp5 = icmp ult i32 %add8, %add
  br i1 %cmp5, label %omp.inner.for.body, label %omp.loop.exit.loopexit

omp.loop.exit.loopexit:                           ; preds = %omp.inner.for.body
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.loop.exit.loopexit, %omp.precond.then
  call void @__kmpc_for_static_fini(%struct.ident_t* nonnull @1, i32 %5)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #6
  br label %omp.precond.end

omp.precond.end:                                  ; preds = %omp.loop.exit, %entry
  ret void
}

; Function Attrs: nounwind
declare dso_local void @__kmpc_for_static_init_4u(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32) local_unnamed_addr #6

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) local_unnamed_addr #6

; Function Attrs: nounwind
declare !callback !34 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) local_unnamed_addr #6

; Function Attrs: convergent
declare dso_local i32 @dm_memcpy_async(...) local_unnamed_addr #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #7

define weak void @__omp_offloading_801_12a1c02_main_l60(i64 %0) {
entry:
  call void asm sideeffect "nop", ""() #8, !srcloc !8
  ret void
}

define weak void @__omp_offloading_801_12a1c02_main_l74(i64 %0) {
entry:
  %dst.addr.i.i.i = alloca i8*, align 4
  %src.addr.i.i.i = alloca i8*, align 4
  %size.addr.i.i.i = alloca i32, align 4
  %_A_phys.i = alloca i32, align 4
  %_B_phys.i = alloca i32, align 4
  %_size.i = alloca i32, align 4
  %1 = inttoptr i64 %0 to i64 addrspace(1)*
  %2 = call i32 @hero_load_uint32(i64 %0)
  %3 = inttoptr i32 %2 to i32*
  %4 = getelementptr i64, i64 addrspace(1)* %1, i64 1
  %5 = ptrtoint i64 addrspace(1)* %4 to i64
  %6 = call i32 @hero_load_uint32(i64 %5)
  %7 = inttoptr i32 %6 to i32*
  %8 = getelementptr i64, i64 addrspace(1)* %1, i64 2
  %9 = ptrtoint i64 addrspace(1)* %8 to i64
  %10 = call i32 @hero_load_uint32(i64 %9)
  %11 = inttoptr i32 %10 to i32*
  %_A_phys.0._A_phys.0._A_phys.0..sroa_cast.i = bitcast i32* %_A_phys.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_A_phys.0._A_phys.0._A_phys.0..sroa_cast.i) #6
  %12 = load i32, i32* %3, align 4, !tbaa !9
  store volatile i32 %12, i32* %_A_phys.i, align 4, !tbaa !9
  %_B_phys.0._B_phys.0._B_phys.0..sroa_cast.i = bitcast i32* %_B_phys.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_B_phys.0._B_phys.0._B_phys.0..sroa_cast.i) #6
  %13 = load i32, i32* %7, align 4, !tbaa !9
  store volatile i32 %13, i32* %_B_phys.i, align 4, !tbaa !9
  %_size.0._size.0._size.0..sroa_cast.i = bitcast i32* %_size.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %_size.0._size.0._size.0..sroa_cast.i) #6
  %14 = load i32, i32* %11, align 4, !tbaa !9
  store volatile i32 %14, i32* %_size.i, align 4, !tbaa !9
  %_B_phys.0._B_phys.0._B_phys.0..i = load volatile i32, i32* %_B_phys.i, align 4, !tbaa !9
  %_A_phys.0._A_phys.0._A_phys.0..i = load volatile i32, i32* %_A_phys.i, align 4, !tbaa !9
  %_size.0._size.0._size.0..i = load volatile i32, i32* %_size.i, align 4, !tbaa !9
  %call.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i32 noundef %13, i32 noundef %12, i32 noundef %14) #8
  %15 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !13
  %16 = inttoptr i32 %13 to i8*
  %17 = inttoptr i32 %12 to i8*
  %cmp.i.i.i.i = icmp ugt i8* %16, inttoptr (i32 1895825408 to i8*)
  %cmp1.i.i.i.i = icmp ult i8* %16, inttoptr (i32 1912602623 to i8*)
  %or.cond.i.i.i.i = and i1 %cmp.i.i.i.i, %cmp1.i.i.i.i
  %cmp2.i.i.i.i = icmp ugt i8* %17, inttoptr (i32 1895825408 to i8*)
  %or.cond19.i.i.i.i = and i1 %cmp2.i.i.i.i, %or.cond.i.i.i.i
  %cmp4.i.i.i.i = icmp ult i8* %17, inttoptr (i32 1912602623 to i8*)
  %or.cond21.i.i.i.i = and i1 %cmp4.i.i.i.i, %or.cond19.i.i.i.i
  br i1 %or.cond21.i.i.i.i, label %if.end.i.i.i.i, label %land.lhs.true5.i.i.i.i

land.lhs.true5.i.i.i.i:                           ; preds = %entry
  %cmp6.i.i.i.i = icmp ugt i8* %16, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i.i.i = icmp ne i8* %16, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i.i.i = and i1 %cmp6.i.i.i.i, %cmp8.i.i.i.i
  %cmp10.i.i.i.i = icmp ugt i8* %17, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i.i.i = and i1 %cmp10.i.i.i.i, %or.cond23.i.i.i.i
  %cmp12.i.i.i.i = icmp ne i8* %17, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i.i.i = and i1 %cmp12.i.i.i.i, %or.cond25.i.i.i.i
  br i1 %or.cond27.i.i.i.i, label %if.end.i.i.i.i, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %land.lhs.true5.i.i.i.i
  %call.i.i.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %16, i8* noundef %17) #8
  br label %dev_single_core_memcpy.internalized.exit.i.i

if.end.i.i.i.i:                                   ; preds = %land.lhs.true5.i.i.i.i, %entry
  %cmp13.i.i.i.i = icmp ugt i32 %14, 1048576
  br i1 %cmp13.i.i.i.i, label %if.then14.i.i.i.i, label %while.cond.preheader.i.i.i

while.cond.preheader.i.i.i:                       ; preds = %if.end.i.i.i.i
  %cmp.not3.i.i.i = icmp eq i32 %14, 0
  br i1 %cmp.not3.i.i.i, label %dev_single_core_memcpy.internalized.exit.i.i, label %while.body.i.i.i.preheader

while.body.i.i.i.preheader:                       ; preds = %while.cond.preheader.i.i.i
  br label %while.body.i.i.i

if.then14.i.i.i.i:                                ; preds = %if.end.i.i.i.i
  %call15.i.i.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %14) #8
  br label %dev_single_core_memcpy.internalized.exit.i.i

while.body.i.i.i:                                 ; preds = %while.body.i.i.i.preheader, %while.body.i.i.i
  %size.addr.06.i.i.i = phi i32 [ %dec.i.i.i, %while.body.i.i.i ], [ %14, %while.body.i.i.i.preheader ]
  %src.addr.05.i.i.i = phi i8* [ %incdec.ptr.i.i.i, %while.body.i.i.i ], [ %17, %while.body.i.i.i.preheader ]
  %dst.addr.04.i.i.i = phi i8* [ %incdec.ptr1.i.i.i, %while.body.i.i.i ], [ %16, %while.body.i.i.i.preheader ]
  %dec.i.i.i = add i32 %size.addr.06.i.i.i, -1
  %incdec.ptr.i.i.i = getelementptr inbounds i8, i8* %src.addr.05.i.i.i, i32 1
  %18 = load i8, i8* %src.addr.05.i.i.i, align 1, !tbaa !14
  %incdec.ptr1.i.i.i = getelementptr inbounds i8, i8* %dst.addr.04.i.i.i, i32 1
  store i8 %18, i8* %dst.addr.04.i.i.i, align 1, !tbaa !14
  %cmp.not.i.i.i = icmp eq i32 %dec.i.i.i, 0
  br i1 %cmp.not.i.i.i, label %dev_single_core_memcpy.internalized.exit.i.i.loopexit, label %while.body.i.i.i, !llvm.loop !15

dev_single_core_memcpy.internalized.exit.i.i.loopexit: ; preds = %while.body.i.i.i
  br label %dev_single_core_memcpy.internalized.exit.i.i

dev_single_core_memcpy.internalized.exit.i.i:     ; preds = %dev_single_core_memcpy.internalized.exit.i.i.loopexit, %if.then14.i.i.i.i, %while.cond.preheader.i.i.i, %if.then.i.i.i.i
  %19 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !17
  %cmp2.not.i.i.i = icmp eq i32 %14, 0
  br i1 %cmp2.not.i.i.i, label %compare.internalized.exit.i.i, label %for.body.i.i.i.preheader

for.body.i.i.i.preheader:                         ; preds = %dev_single_core_memcpy.internalized.exit.i.i
  br label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %for.body.i.i.i.preheader, %if.end.i.i.i
  %i.03.i.i.i = phi i32 [ %inc.i.i.i, %if.end.i.i.i ], [ 0, %for.body.i.i.i.preheader ]
  %arrayidx.i.i.i = getelementptr inbounds i8, i8* %16, i32 %i.03.i.i.i
  %20 = load i8, i8* %arrayidx.i.i.i, align 1, !tbaa !14
  %arrayidx1.i.i.i = getelementptr inbounds i8, i8* %17, i32 %i.03.i.i.i
  %21 = load i8, i8* %arrayidx1.i.i.i, align 1, !tbaa !14
  %cmp3.not.i.i.i = icmp eq i8 %20, %21
  br i1 %cmp3.not.i.i.i, label %if.end.i.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %for.body.i.i.i
  %.lcssa6 = phi i8 [ %20, %for.body.i.i.i ]
  %.lcssa4 = phi i8 [ %21, %for.body.i.i.i ]
  %conv2.i.i.i = zext i8 %.lcssa4 to i32
  %conv.i.i.i = zext i8 %.lcssa6 to i32
  %call.i.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv.i.i.i, i32 noundef %conv.i.i.i, i32 noundef %conv2.i.i.i, i32 noundef %conv2.i.i.i) #8
  br label %compare.internalized.exit.i.i

if.end.i.i.i:                                     ; preds = %for.body.i.i.i
  store i8 0, i8* %arrayidx.i.i.i, align 1, !tbaa !14
  %inc.i.i.i = add nuw i32 %i.03.i.i.i, 1
  %exitcond.not.i.i.i = icmp eq i32 %inc.i.i.i, %14
  br i1 %exitcond.not.i.i.i, label %compare.internalized.exit.i.i.loopexit, label %for.body.i.i.i, !llvm.loop !18

compare.internalized.exit.i.i.loopexit:           ; preds = %if.end.i.i.i
  br label %compare.internalized.exit.i.i

compare.internalized.exit.i.i:                    ; preds = %compare.internalized.exit.i.i.loopexit, %if.then.i.i.i, %dev_single_core_memcpy.internalized.exit.i.i
  %22 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !19
  %23 = bitcast i8** %dst.addr.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23) #6
  %24 = bitcast i8** %src.addr.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %24) #6
  %25 = bitcast i32* %size.addr.i.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %25) #6
  store i8* %16, i8** %dst.addr.i.i.i, align 4, !tbaa !20
  store i8* %17, i8** %src.addr.i.i.i, align 4, !tbaa !20
  store i32 %14, i32* %size.addr.i.i.i, align 4, !tbaa !9
  br i1 %or.cond21.i.i.i.i, label %if.end.i.i19.i.i, label %land.lhs.true5.i.i15.i.i

land.lhs.true5.i.i15.i.i:                         ; preds = %compare.internalized.exit.i.i
  %cmp6.i.i8.i.i = icmp ugt i8* %16, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i9.i.i = icmp ne i8* %16, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i10.i.i = and i1 %cmp6.i.i8.i.i, %cmp8.i.i9.i.i
  %cmp10.i.i11.i.i = icmp ugt i8* %17, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i12.i.i = and i1 %cmp10.i.i11.i.i, %or.cond23.i.i10.i.i
  %cmp12.i.i13.i.i = icmp ne i8* %17, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i14.i.i = and i1 %cmp12.i.i13.i.i, %or.cond25.i.i12.i.i
  br i1 %or.cond27.i.i14.i.i, label %if.end.i.i19.i.i, label %if.then.i.i17.i.i

if.then.i.i17.i.i:                                ; preds = %land.lhs.true5.i.i15.i.i
  %call.i.i16.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %16, i8* noundef %17) #8
  br label %dev_multi_core_memcpy.internalized.exit.i.i

if.end.i.i19.i.i:                                 ; preds = %land.lhs.true5.i.i15.i.i, %compare.internalized.exit.i.i
  %cmp13.i.i18.i.i = icmp ugt i32 %14, 1048576
  br i1 %cmp13.i.i18.i.i, label %if.then14.i.i21.i.i, label %if.end.i22.i.i

if.then14.i.i21.i.i:                              ; preds = %if.end.i.i19.i.i
  %call15.i.i20.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %14) #8
  br label %dev_multi_core_memcpy.internalized.exit.i.i

if.end.i22.i.i:                                   ; preds = %if.end.i.i19.i.i
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* nonnull @2, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i8**, i8**)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* nonnull %size.addr.i.i.i, i8** nonnull %dst.addr.i.i.i, i8** nonnull %src.addr.i.i.i) #6
  br label %dev_multi_core_memcpy.internalized.exit.i.i

dev_multi_core_memcpy.internalized.exit.i.i:      ; preds = %if.end.i22.i.i, %if.then14.i.i21.i.i, %if.then.i.i17.i.i
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %23) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %24) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %25) #6
  %26 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !22
  br i1 %cmp2.not.i.i.i, label %compare.internalized.exit36.i.i, label %for.body.i28.i.i.preheader

for.body.i28.i.i.preheader:                       ; preds = %dev_multi_core_memcpy.internalized.exit.i.i
  br label %for.body.i28.i.i

for.body.i28.i.i:                                 ; preds = %for.body.i28.i.i.preheader, %if.end.i35.i.i
  %i.03.i24.i.i = phi i32 [ %inc.i33.i.i, %if.end.i35.i.i ], [ 0, %for.body.i28.i.i.preheader ]
  %arrayidx.i25.i.i = getelementptr inbounds i8, i8* %16, i32 %i.03.i24.i.i
  %27 = load i8, i8* %arrayidx.i25.i.i, align 1, !tbaa !14
  %arrayidx1.i26.i.i = getelementptr inbounds i8, i8* %17, i32 %i.03.i24.i.i
  %28 = load i8, i8* %arrayidx1.i26.i.i, align 1, !tbaa !14
  %cmp3.not.i27.i.i = icmp eq i8 %27, %28
  br i1 %cmp3.not.i27.i.i, label %if.end.i35.i.i, label %if.then.i32.i.i

if.then.i32.i.i:                                  ; preds = %for.body.i28.i.i
  %.lcssa2 = phi i8 [ %27, %for.body.i28.i.i ]
  %.lcssa = phi i8 [ %28, %for.body.i28.i.i ]
  %conv2.i29.i.i = zext i8 %.lcssa to i32
  %conv.i30.i.i = zext i8 %.lcssa2 to i32
  %call.i31.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i32 noundef %conv.i30.i.i, i32 noundef %conv.i30.i.i, i32 noundef %conv2.i29.i.i, i32 noundef %conv2.i29.i.i) #8
  br label %compare.internalized.exit36.i.i

if.end.i35.i.i:                                   ; preds = %for.body.i28.i.i
  store i8 0, i8* %arrayidx.i25.i.i, align 1, !tbaa !14
  %inc.i33.i.i = add nuw i32 %i.03.i24.i.i, 1
  %exitcond.not.i34.i.i = icmp eq i32 %inc.i33.i.i, %14
  br i1 %exitcond.not.i34.i.i, label %compare.internalized.exit36.i.i.loopexit, label %for.body.i28.i.i, !llvm.loop !18

compare.internalized.exit36.i.i.loopexit:         ; preds = %if.end.i35.i.i
  br label %compare.internalized.exit36.i.i

compare.internalized.exit36.i.i:                  ; preds = %compare.internalized.exit36.i.i.loopexit, %if.then.i32.i.i, %dev_multi_core_memcpy.internalized.exit.i.i
  %29 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !23
  br i1 %or.cond21.i.i.i.i, label %if.end.i.i55.i.i, label %land.lhs.true5.i.i51.i.i

land.lhs.true5.i.i51.i.i:                         ; preds = %compare.internalized.exit36.i.i
  %cmp6.i.i44.i.i = icmp ugt i8* %16, inttoptr (i32 -1073741824 to i8*)
  %cmp8.i.i45.i.i = icmp ne i8* %16, inttoptr (i32 -1 to i8*)
  %or.cond23.i.i46.i.i = and i1 %cmp6.i.i44.i.i, %cmp8.i.i45.i.i
  %cmp10.i.i47.i.i = icmp ugt i8* %17, inttoptr (i32 -1073741824 to i8*)
  %or.cond25.i.i48.i.i = and i1 %cmp10.i.i47.i.i, %or.cond23.i.i46.i.i
  %cmp12.i.i49.i.i = icmp ne i8* %17, inttoptr (i32 -1 to i8*)
  %or.cond27.i.i50.i.i = and i1 %cmp12.i.i49.i.i, %or.cond25.i.i48.i.i
  br i1 %or.cond27.i.i50.i.i, label %if.end.i.i55.i.i, label %if.then.i.i53.i.i

if.then.i.i53.i.i:                                ; preds = %land.lhs.true5.i.i51.i.i
  %call.i.i52.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i8*, i8*)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @.str.2, i32 0, i32 0), i8* noundef %16, i8* noundef %17) #8
  br label %__wrapped_omp__omp_offloading_801_12a1c02_main_l74.exit

if.end.i.i55.i.i:                                 ; preds = %land.lhs.true5.i.i51.i.i, %compare.internalized.exit36.i.i
  %cmp13.i.i54.i.i = icmp ugt i32 %14, 1048576
  br i1 %cmp13.i.i54.i.i, label %if.then14.i.i57.i.i, label %if.end.i58.i.i

if.then14.i.i57.i.i:                              ; preds = %if.end.i.i55.i.i
  %call15.i.i56.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32)*)(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0), i32 noundef %14) #8
  br label %__wrapped_omp__omp_offloading_801_12a1c02_main_l74.exit

if.end.i58.i.i:                                   ; preds = %if.end.i.i55.i.i
  %call1.i.i.i = call i32 bitcast (i32 (...)* @dm_memcpy_async to i32 (i8*, i8*, i32)*)(i8* noundef %16, i8* noundef %17, i32 noundef %14) #8
  %call2.i.i.i = call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  br label %__wrapped_omp__omp_offloading_801_12a1c02_main_l74.exit

__wrapped_omp__omp_offloading_801_12a1c02_main_l74.exit: ; preds = %if.end.i58.i.i, %if.then14.i.i57.i.i, %if.then.i.i53.i.i
  %call9.i.i = call i32 bitcast (i32 (...)* @dm_wait to i32 ()*)() #8
  %30 = call i32 asm sideeffect "csrr $0, mcycle", "=r"() #8, !srcloc !24
  %sub.i.i = sub i32 %19, %15
  %sub12.i.i = sub i32 %26, %22
  %sub13.i.i = sub i32 %30, %29
  %call14.i.i = call i32 bitcast (i32 (...)* @snrt_printf to i32 (i8*, i32, i32, i32)*)(i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str.1, i32 0, i32 0), i32 noundef %sub.i.i, i32 noundef %sub12.i.i, i32 noundef %sub13.i.i) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_size.0._size.0._size.0..sroa_cast.i) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_B_phys.0._B_phys.0._B_phys.0..sroa_cast.i) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %_A_phys.0._A_phys.0._A_phys.0..sroa_cast.i) #6
  ret void
}

attributes #0 = { alwaysinline convergent norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+d,+f,+m,+relax,+xdma,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { convergent nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+d,+f,+m,+relax,+xdma,-save-restore" }
attributes #3 = { convergent inlinehint nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+d,+f,+m,+relax,+xdma,-save-restore" }
attributes #4 = { convergent "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+d,+f,+m,+relax,+xdma,-save-restore" }
attributes #5 = { alwaysinline norecurse nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+d,+f,+m,+relax,+xdma,-save-restore" }
attributes #6 = { nounwind }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { convergent nounwind }

!omp_offload.info = !{!0, !1}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!nvvm.annotations = !{}

!0 = !{i32 0, i32 2049, i32 19536898, !"main", i32 60, i32 0}
!1 = !{i32 0, i32 2049, i32 19536898, !"main", i32 74, i32 1}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 1, !"target-abi", !"ilp32d"}
!4 = !{i32 7, !"openmp", i32 50}
!5 = !{i32 7, !"openmp-device", i32 50}
!6 = !{i32 1, !"SmallDataLimit", i32 8}
!7 = !{!"clang version 15.0.0 (git@iis-git.ee.ethz.ch:iis-compilers/llvm-project.git dc4e635bebcc2811b0a07f4f044c766cab3b7ca5)"}
!8 = !{i64 1813}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{i64 2147615488}
!14 = !{!11, !11, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{i64 2147615586}
!18 = distinct !{!18, !16}
!19 = !{i64 2147615684}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !11, i64 0}
!22 = !{i64 2147615782}
!23 = !{i64 2147615880}
!24 = !{i64 2147615978}
!25 = !{i64 2147796962, i64 2147795898, i64 2147796012, i64 2147796184, i64 2147796238}
!26 = !{i64 2147798614, i64 2147797711, i64 2147797825, i64 2147797996, i64 2147798051}
!27 = !{i64 2147800505, i64 2147799441, i64 2147799555, i64 2147799727, i64 2147799781}
!28 = !{!29, !29, i64 0}
!29 = !{!"short", !11, i64 0}
!30 = !{i64 2147802220, i64 2147801317, i64 2147801431, i64 2147801602, i64 2147801657}
!31 = !{i64 2147804153, i64 2147803100, i64 2147803214, i64 2147803386, i64 2147803440}
!32 = !{i64 2147805847, i64 2147804953, i64 2147805067, i64 2147805238, i64 2147805293}
!33 = !{i32 0, i32 -1}
!34 = !{!35}
!35 = !{i64 2, i64 -1, i64 -1, i1 true}

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-riscv32-hero-hero1-elf