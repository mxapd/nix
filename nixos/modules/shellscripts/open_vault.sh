if [[ -z "$OBSIDIAN_VAULT" ]]; then
  echo "Error: OBSIDIAN_VAULT is not set. Please set the system variable."
  #exit 1
fi

cd "$OBSIDIAN_VAULT" || {
  echo "Error: Unable to change directory to $OBSIDIAN_VAULT. Check if the folder exists."
  #exit 1
}

echo "Now in directory: $(pwd)"
