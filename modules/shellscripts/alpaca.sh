#!/usr/bin/env bash

MODEL="llama3.1:8b"

if ! pgrep -x "ollama" > /dev/null; then
    echo "Starting Ollama..."
    ollama serve > /dev/null 2>&1 &
    sleep 3
else
    echo "Ollama is already running."
fi

if ! ollama list | grep -q "^$MODEL "; then
    echo "Model '$MODEL' not found. Pulling it now..."
    ollama pull "$MODEL"
fi

echo "Starting chat with '$MODEL'..."
ollama run "$MODEL"

