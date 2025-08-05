RECOVER_NAME="kali-recovered"
ORPHAN_ID=$(ls ~/.udocker/containers | grep -E "^[0-9a-f\-]{36}$")

if [ -z "$ORPHAN_ID" ]; then
  echo "❌ No orphaned container found."
  exit 1
fi

echo "🛠️ Found orphan container: $ORPHAN_ID"

# Rename folder
mv ~/.udocker/containers/$ORPHAN_ID ~/.udocker/containers/$RECOVER_NAME

# Update container.json
sed -i "s/$ORPHAN_ID/$RECOVER_NAME/g" ~/.udocker/containers/$RECOVER_NAME/container.json

echo "✅ Renamed to $RECOVER_NAME and patched config."

# Test run
echo "🚀 Trying to run the container..."
udocker run $RECOVER_NAME
