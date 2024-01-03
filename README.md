
https://github.com/ggerganov/whisper.cpp

## TLDR
```
docker compose up
```
or
```
MODEL=large-v2 LANGUAGE=ru docker compose up
```

## Step by step
### 1. Build CUDA image (single run)
```
docker compose build --progress=plain
```

### 2. Download models (single run)
You may want to do it manually in order to see the progress
```
./models/download.sh large-v2 
```
This script is a plain copy of [download-ggml-model.sh](https://github.com/ggerganov/whisper.cpp/blob/master/models/download-ggml-model.sh).
You may find additional information and configurations [here](https://github.com/ggerganov/whisper.cpp/tree/master/models) 

### 3. Prepare your files
Place all the files in the ```./volume/input/``` directory

### 4. Run the docker compose
```
docker compose up
```
Configure defaults
```
MODEL=large-v2 \
LANGUAGE=ru \
    docker compose up
```
| Argument    | Values | Defaults |
| -------- | ------- |------- |
| model  | base, medium, large, [other options](https://github.com/ggerganov/whisper.cpp/blob/master/models/download-ggml-model.sh#L25)   |   large-v3 
| language | rn, ru, fr, etc. (depends on the model)     |  ru

### 5. Result
You can find the result in the ```./volume/output/``` directory
