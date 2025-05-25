#!/bin/bash

read -p "Enter image or video path: " file

if [[ $file =~ \.(jpg|jpeg|png|gif|tiff|bmp|webp)$ ]]; then
  echo "$file is a valid image."

  # Choix du format de sortie
  echo "Choose output format:"
  select format in png jpg jpeg tiff bmp webp; do
    if [[ -n $format ]]; then
      output="${file%.*}.$format"

      # Redimensionnement en pourcentage
      read -p "Do you want to resize the image (percentage)? (y/N): " resize_choice
      resize_choice=$(echo "$resize_choice" | tr '[:upper:]' '[:lower:]') # minuscule

      if [[ $resize_choice == "y" ]]; then
        read -p "Enter percentage (e.g. 50 for 50%): " percent
        resize_option="-resize ${percent}%"
      else
        resize_option=""
      fi

      # Exécuter avec ImageMagick
      if command -v magick >/dev/null 2>&1; then
        magick "$file" $resize_option "$output"
      else
        magick "$file" $resize_option "$output"
      fi

      clear

      echo "✅ Image converted to $output"
      break
    else
      echo "❌ Invalid choice. Try again."
    fi
  done

fi

if [[ $file =~ \.(mp4|mkv|avi|mov|flv|webm|ts|m4v|mpeg|mpg|asf|wmv)$ ]]; then
  echo "$file is a valid video."

  # Option : extraire seulement l'audio
  read -p "Do you want to extract audio only? (y/N): " audio_only
  audio_only=$(echo "$audio_only" | tr '[:upper:]' '[:lower:]')
  if [[ $audio_only == "y" ]]; then
    read -p "Choose audio format (mp3, aac, wav): " audio_format
    output="${file%.*}.$audio_format"
    ffmpeg -i "$file" -vn -acodec libmp3lame "$output"
    echo "✅ Audio extracted to $output"
    exit 0
  fi

  # Choix du format vidéo de sortie
  echo "Choose output format:"
  select format in mp4 mkv webm avi mov flv; do
    if [[ -n $format ]]; then
      output="${file%.*}.$format"

      # Option : redimensionner
      read -p "Do you want to resize the video? (y/N): " resize_choice
      resize_choice=$(echo "$resize_choice" | tr '[:upper:]' '[:lower:]')

      if [[ $resize_choice == "y" ]]; then
        read -p "Enter resolution (e.g. 1280x720): " resolution
        ffmpeg -i "$file" -vf scale=$resolution -c:v libx264 -c:a copy "$output"
      else
        ffmpeg -i "$file" -c:v copy -c:a copy "$output"
      fi

      clear
      echo "✅ Video converted to $output"
      break
    else
      echo "❌ Invalid choice. Try again."
    fi
  done
fi
