# Supabase Migration Guide

## 📋 Danh sách các bước để chạy migration lên Supabase

### Step 1: Tạo Project Supabase

1. Truy cập [https://supabase.com/](https://supabase.com/)
2. Đăng nhập hoặc đăng ký tài khoản
3. Click "New Project"
4. Chọn Organization, đặt tên project, chọn region gần nhất
5. Lưu password database Supabase (cần dùng sau)

### Step 2: Lấy Connection String

1. Vào dashboard project vừa tạo
2. Nhấn **Settings** (biểu tượng gear)
3. Chọn **Database**
4. Tìm "Connection string" section
5. Copy URI string (SQLAlchemy format hoặc URI)
6. Format: `postgresql://postgres:[password]@[host]:[port]/postgres?schema=public`

### Step 3: Update Database URL Local

Mở file `.env` backend và update:

```env
DATABASE_URL=postgresql://postgres:[your-password]@db.oohiagwdedaazeryxzok.supabase.co:5432/postgres?schema=public
```

Ví dụ cụ thể:

```env
DATABASE_URL=postgresql://postgres:Gyt#9r6)2I8*!a6^@db.oohiagwdedaazeryxzok.supabase.co:5432/postgres?schema=public
```

### Step 4: Chạy Migration lên Supabase

```bash
cd jft-backend

# Chạy migration (sẽ tạo tất cả tables từ migration history)
npx prisma migrate deploy

# Hoặc nếu cần reset schema (delete + recreate):
# npx prisma migrate reset --force
```

### Step 5: Seed Data (Tùy chọn)

Nếu bạn có seed script:

```bash
# Chạy seed data
npm run seed

# Hoặc nếu chỉ có file seed-test-exam.ts:
# npx tsx prisma/seed-test-exam.ts
```

### Step 6: Kiểm tra Schema trên Supabase

1. Vào Dashboard Supabase
2. Chọn **SQL Editor**
3. Chạy query để kiểm tra tables:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
```

Nếu thấy các bảng như `User`, `ExamSession`, `Question`, v.v → Thành công! ✅

---

## 🚨 Troubleshooting

### Lỗi: "Column does not exist"

- Có thể một số migration chưa chạy đúng
- Chạy: `npx prisma migrate resolve --rolled-back [migration-name]` rồi `npx prisma migrate deploy`

### Lỗi: "connection refused"

- Kiểm tra CONNECTION STRING có chính xác không
- Kiểm tra password có ký tự đặc biệt không (cần escape trong URL)

### Lỗi: "password authentication failed"

- Kiểm tra password Supabase có đúng không
- Lưu ý: password có thể chứa ký tự đặc biệt như `!@#$%^&*` cần encode trong URL

---

## 📝 Khi Deploy lên Render

Sau khi migrate thành công local:

1. **Tạo server Render**: https://render.com/
2. **Tạo PostgreSQL**: Hoặc dùng Supabase (khuyến nghị)
3. **Set Environment Variable Render**:
   - Key: `DATABASE_URL`
   - Value: Supabase connection string

4. **Deploy Backend**:
   - Link GitHub repo
   - Render sẽ auto chạy migrations khi deploy

---

## ✅ Kiểm tra sau migrate

Chạy backend local:

```bash
npm run start:dev
```

Kiểm tra logs:

- Nếu thấy `Listening on port 3000` → Backend connect đúng database ✅

Test API:

```bash
curl http://localhost:3000/health
```

---

## 📚 Tài liệu liên quan

- [Prisma Migrate Documentation](https://www.prisma.io/docs/orm/prisma-migrate)
- [Supabase PostgreSQL Docs](https://supabase.com/docs/guides/database)
- [Render Deployments](https://render.com/docs)
