ś<
ë
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
8
Const
output"dtype"
valuetensor"
dtypetype

Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
H
ShardedFilename
basename	
shard

num_shards
filename
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.13.12unknownń+
b
ConstConst*
dtype0*
_output_shapes

:*%
valueB"˙˙˙˙˙˙˙˙˙˙˙˙
u
a
VariableV2*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name 

a/AssignAssignaConst*
use_locking(*
_output_shapes

:*
T0*
validate_shape(*
_class

loc:@a
T
a/readIdentitya*
_output_shapes

:*
T0*
_class

loc:@a
d
Const_1Const*%
valueB"˙˙˙˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes

:
u
b
VariableV2*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name 

b/AssignAssignbConst_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(*
_class

loc:@b
T
b/readIdentityb*
_output_shapes

:*
T0*
_class

loc:@b
J

multipliedMula/readb/read*
T0*
_output_shapes

:
b
	Fill/dimsConst*%
valueB"   (   (   
   *
dtype0*
_output_shapes
:
O

Fill/valueConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
FillFill	Fill/dims
Fill/value*
T0*

index_type0*&
_output_shapes
:((

d
Fill_1/dimsConst*%
valueB"      
   d   *
dtype0*
_output_shapes
:
Q
Fill_1/valueConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
l
Fill_1FillFill_1/dimsFill_1/value*&
_output_shapes
:
d*
T0*

index_type0
Ů
	expensiveConv2DFillFill_1*
T0*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*&
_output_shapes
:((d*
paddingSAME*
	dilations

Q
Const_2Const*
valueB: *
dtype0*
_output_shapes
:
w
global_step
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name 
 
global_step/AssignAssignglobal_stepConst_2*
T0*
validate_shape(*
_class
loc:@global_step*
use_locking(*
_output_shapes
:
n
global_step/readIdentityglobal_step*
T0*
_class
loc:@global_step*
_output_shapes
:
\
PlaceholderPlaceholder*
shape
:*
dtype0*
_output_shapes

:

AssignAssignaPlaceholder*
T0*
validate_shape(*
_class

loc:@a*
use_locking( *
_output_shapes

:

Assign_1AssignbPlaceholder*
validate_shape(*
_class

loc:@b*
use_locking( *
_output_shapes

:*
T0
7
initNoOp	^a/Assign	^b/Assign^global_step/Assign
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0*
_output_shapes
: 
e

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0*
_output_shapes
: 

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_20e796c5611547e3b0cf9f869c02244b/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*&
valueBBaBbBglobal_step
x
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueBB B B *
dtype0*
_output_shapes
:

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesabglobal_step"/device:CPU:0*
dtypes
2
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
Ź
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*
N*
_output_shapes
:*

axis 

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 

save/RestoreV2/tensor_namesConst"/device:CPU:0*&
valueBBaBbBglobal_step*
dtype0*
_output_shapes
:
{
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueBB B B *
dtype0*
_output_shapes
:
Š
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2* 
_output_shapes
:::

save/AssignAssignasave/RestoreV2*
T0*
validate_shape(*
_class

loc:@a*
use_locking(*
_output_shapes

:

save/Assign_1Assignbsave/RestoreV2:1*
validate_shape(*
_class

loc:@b*
use_locking(*
_output_shapes

:*
T0
¤
save/Assign_2Assignglobal_stepsave/RestoreV2:2*
T0*
validate_shape(*
_class
loc:@global_step*
use_locking(*
_output_shapes
:
H
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"Ľ
	variables
$
a:0a/Assigna/read:02Const:08
&
b:0b/Assignb/read:02	Const_1:08
D
global_step:0global_step/Assignglobal_step/read:02	Const_2:08"Ż
trainable_variables
$
a:0a/Assigna/read:02Const:08
&
b:0b/Assignb/read:02	Const_1:08
D
global_step:0global_step/Assignglobal_step/read:02	Const_2:08*
serving_default

B
b:0g

A
a:0g(

MULTIPLIED
multiplied:0.
	expensive!
expensive:0((d