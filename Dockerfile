# Menggunakan image dasar Go untuk kompilasi
FROM golang:1.21-alpine AS builder

# Atur direktori kerja di dalam container
WORKDIR /app

# Salin file Go
COPY main.go .

# Kompilasi aplikasi Golang
RUN go mod init example/hello
RUN go mod tidy
RUN go build -o main .

# Gunakan image yang lebih kecil untuk menjalankan aplikasi
FROM alpine:latest

# Atur direktori kerja lagi
WORKDIR /root/

# Salin file yang sudah dikompilasi dari tahap 'builder'
COPY --from=builder /app/main .

# Definisikan port yang akan diekspos
EXPOSE 8080

# Jalankan aplikasi saat container dimulai
CMD ["./main"]
