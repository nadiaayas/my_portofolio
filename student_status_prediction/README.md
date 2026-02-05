# 🎓 Prediksi Keputusan Mahasiswa Melanjutkan Studi Menggunakan Supervised Learning Classifier

## 📌 Latar Belakang
Peluang mahasiswa untuk tetap melanjutkan studi, dropout, atau lulus dipengaruhi oleh berbagai faktor akademik maupun sosial-ekonomi. Model regresi panel konvensional seringkali kurang mampu menangkap kompleksitas hubungan antar variabel. Oleh karena itu, project ini menggunakan pendekatan **Supervised Learning Classifier** untuk membangun model prediktif yang lebih akurat dan informatif.

---

## 🎯 Tujuan Analisis
- Mengembangkan model prediksi keputusan mahasiswa (Dropout, Enrolled, Graduated).  
- Membandingkan performa beberapa algoritma supervised learning.  
- Mengidentifikasi variabel-variabel penting yang paling berpengaruh terhadap keputusan mahasiswa.  

---

## 📑 Deskripsi Data
- **Jumlah data:** 4.424 baris × 47 kolom  
- **Variabel target (Y):**  
  - Dropout = 0  
  - Enrolled = 1  
  - Graduated = 2  
- **Variabel independen (X):**  
  - Karakteristik mahasiswa (status pernikahan, gender, usia, beasiswa, dll.)  
  - Prestasi akademik (nilai, jumlah mata kuliah, evaluasi, dll.)  
  - Faktor eksternal (tingkat pengangguran, inflasi, GDP)  

---

## ⚙️ Metodologi
Tahapan analisis:
1. **Processing Data**
   - Encoding variabel target.  
   - Mengecek dan menangani missing value (hasil: 0%).  
   - Eksplorasi korelasi antar variabel.  
   - Deteksi outlier pada variabel numerik.  
   - Transformasi data dengan *Robust Scaler*, *MinMax Scaler*, dan *Standard Scaler*.  

2. **Pemodelan Prediksi**
   - Split data: 80:20 dan 90:10.  
   - Algoritma yang diuji:  
     - Logistic Regression  
     - Decision Tree  
     - Random Forest  
     - K-Nearest Neighbor (KNN)  
     - Support Vector Machine (SVM)  
   - Evaluasi model dengan metrik: R-Square, MAE, MSE, RMSE, Accuracy.  

3. **Analisis Importance**
   - Mengidentifikasi variabel X yang paling berpengaruh terhadap Y pada model terbaik.  

---

## 🛠️ Perangkat Lunak dan Tools
- **Python Libraries:**  
  - `pandas`, `numpy`, `seaborn`, `matplotlib`  
  - `scikit-learn` (LogisticRegression, KNN, DecisionTree, RandomForest, SVM, preprocessing tools)  

---

## 📌 Hasil Utama
- Tidak ditemukan missing value pada data.  
- Model terbaik: **Decision Tree Regression dengan MinMax Scaler** (split 90:10).  
  - Akurasi: **81%**  
  - R-Square: **61.8%**  
  - RMSE: **0.552**  
- Variabel paling berpengaruh:  
  - Curricular units 2nd sem (approved)  
  - Curricular units 2nd sem (grade)  
  - Curricular units 1st sem (approved)
  - Curricular units 2nd sem (grade)  
  - Admission grade  

---

## 📂 Output Project
- Hasil preprocessing data (encoding, missing value & outlier detection, scaling).  
- Perbandingan performa model supervised learning.  
- Analisis variabel penting berdasarkan skor *feature importance*.  


