# 📊 Analisis Kemiskinan di Jawa Barat Menggunakan Geographically Weighted Panel Regression (GWPR) 2017–2022

## 🌍 Latar Belakang
Kemiskinan merupakan permasalahan sosial ekonomi yang memiliki variasi antar wilayah dan waktu. Model regresi panel konvensional cenderung mengasumsikan hubungan yang homogen di seluruh lokasi, sehingga berpotensi mengabaikan perbedaan karakteristik lokal. Project ini menerapkan **Geographically Weighted Panel Regression (GWPR)** untuk menganalisis kemiskinan di Jawa Barat dengan mempertimbangkan heterogenitas spasial.

---

## 🎯 Tujuan Analisis
- Menganalisis pola kemiskinan di Provinsi Jawa Barat menggunakan data panel periode 2017–2022.  
- Membandingkan hasil regresi panel global dengan model GWPR.  
- Mengidentifikasi variasi hubungan antara tingkat kemiskinan dan variabel penjelas di setiap wilayah.  

---

## 📑 Deskripsi Data
- **Jenis data:** Data panel (Kab/Kota × Tahun)  
- **Wilayah:** Provinsi Jawa Barat  
- **Periode waktu:** 2017–2022  
- **Variabel:**
  - Dependen: Persentase Penduduk Miskin (Y)  
  - Independen:
    | Variabel | Keterangan |
    |----------|------------|
    | X1 | Persentase Tingkat Pengangguran Terbuka |
    | X2 | Pengeluaran per Kapita |
    | X3 | Rata-rata Lama Sekolah |
    | X4 | Jumlah Penduduk yang Bekerja |
    | X5 | Persentase Tingkat Partisipasi Angkatan Kerja |

---

## ⚙️ Metodologi
Tahapan analisis yang dilakukan meliputi:
1. Analisis deskriptif dan eksplorasi data.  
2. Estimasi model regresi panel global sebagai model pembanding.  
3. Penentuan bandwidth optimal menggunakan metode cross-validation.  
4. Estimasi model **GWPR** dengan fungsi pembobot *bisquare*.  
5. Evaluasi dan interpretasi koefisien regresi lokal serta perbandingan performa model.  

---

## 🛠️ Perangkat Lunak dan Tools
- **R Packages:**  
  - `plm`  
  - `spdep`  
  - `GWmodel`  
  - `ggplot2`  

---

## 📌 Hasil Utama
- Model GWPR mampu menangkap heterogenitas spasial yang tidak terlihat pada model regresi panel global.  
- Hubungan antara tingkat kemiskinan dan variabel penjelas bervariasi antar wilayah.  
- Pendekatan GWPR memberikan wawasan yang lebih lokal terkait karakteristik kemiskinan di Jawa Barat.  

---

## 📂 Output Project
- Hasil estimasi model regresi panel global dan GWPR  
- Analisis koefisien regresi lokal  
- Ringkasan perbandingan model global dan lokal  
