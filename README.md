
# 🪄 MagicConverter (FFmpeg + ImageMagick)

Ce script permet de convertir facilement des **vidéos** et des **images** en ligne de commande avec des options simples :

- Choix du format de sortie  
- Redimensionnement (pourcentage pour images, résolution pour vidéos)  
- Extraction audio d’une vidéo  

---

## Prérequis

- [ffmpeg](https://ffmpeg.org/)  
- [ImageMagick](https://imagemagick.org/)  

Sur Debian/Ubuntu :  
```bash
sudo apt install ffmpeg imagemagick
```

Sur macOS (avec Homebrew) :  
```bash
brew install ffmpeg imagemagick
```

---

## Utilisation

### Pour les vidéos

- Entrer le chemin de la vidéo  
- Choisir le format de sortie (mp4, mkv, webm, etc.)  
- Choisir si on veut extraire uniquement l’audio  
- Choisir si on veut redimensionner la vidéo  

---

### Pour les images

- Entrer le chemin de l’image  
- Choisir le format de sortie (png, jpg, etc.)  
- Choisir si on veut redimensionner l’image en pourcentage  

---

## Formats supportés

### Vidéos :  
mp4, mkv, avi, mov, flv, webm, ts, m4v, mpeg, mpg, asf, wmv  

### Images :  
jpg, jpeg, png, gif, tiff, bmp, webp  

---

## Exemple

```
Enter video file path: exemple.mov
Do you want to extract audio only? (y/N): n
Choose output format:
1) mp4
2) mkv
3) webm
Do you want to resize the video? (y/N): y
Enter resolution (e.g. 1280x720): 640x360
```
---
