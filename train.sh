# Stage 1
# CUDA_VISIBLE_DEVICES=0,1 python hergen/tools/train_report_generation.py \
#     --model_name cvt2distilgpt2 \
#     --batch_size 16 \
#     --num_devices 2 \
#     --annotation_file /disk1/fywang/CXR_dataset/temporal_CXR/mimic_annotation.json  \
#     --dataset_dir /disk1/fywang/CXR_dataset/mimic_data/2.0.0/files
    
# Stage 2
CUDA_VISIBLE_DEVICES=0,1 python hergen/tools/train_report_generation.py \
    --model_name clgen \
    --batch_size 16 \
    --num_devices 2 \
    --ckpt_path /home/fywang/Documents/HERGen/data/report_generation/cvt2distilgpt2_2026_01_12_22_37_13/ckpts/epoch=14-step=34095.ckpt \
    --annotation_file /disk1/fywang/CXR_dataset/temporal_CXR/mimic_annotation.json  \
    --dataset_dir /disk1/fywang/CXR_dataset/mimic_data/2.0.0/files \
    --encoder_lr 1e-5 

# Stage 3
CUDA_VISIBLE_DEVICES=2,3 python hergen/tools/train_report_generation.py \
    --model_name temporal_decoder \
    --batch_size 4 \
    --num_devices 2 \
    --annotation_file /disk1/fywang/CXR_dataset/temporal_CXR/mimic_annotation.json  \
    --dataset_dir /disk1/fywang/CXR_dataset/mimic_data/2.0.0/files \
    --ckpt_path /home/fywang/Documents/HERGen/data/report_generation/clgen_2026_01_13_08_57_53/ckpts/epoch=4-step=11365.ckpt \
    --encoder_lr 1e-5 