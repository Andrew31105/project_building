# 🏢 Building Management System

> **Role:** Full-stack Developer (Solo Project)  
> **Architecture:** MVC Pattern (Model-View-Controller)  
> **Status:** Completed

---

##(Overview)

**Building Management System** là giải pháp phần mềm toàn diện giúp số hóa quy trình quản lý tòa nhà. Dự án cung cấp các công cụ cho phép quản trị viên theo dõi thông tin tòa nhà, quản lý hồ sơ nhân viên, khách thuê và xử lý các dịch vụ đi kèm một cách chính xác và hiệu quả.

Dự án này được tôi **phát triển độc lập (100% contribution)** từ khâu thiết kế cơ sở dữ liệu, xây dựng Backend theo mô hình MVC đến hoàn thiện giao diện Frontend.

---

## (Tech Stack)

Để đảm bảo hiệu năng và tính bảo trì của hệ thống, tôi đã lựa chọn các công nghệ sau:

* **Backend:** Java (Servlet/JSP), JDBC để kết nối cơ sở dữ liệu.
* **Database:** MySQL - Thiết kế và tối ưu hóa schema.
* **Frontend:** HTML5, CSS3, JavaScript (Vanilla) - Xử lý logic phía client và validate dữ liệu.
* **Design Pattern:** MVC (Model-View-Controller) - Tách biệt rõ ràng giữa xử lý logic, dữ liệu và giao diện.
* **Tools:** Maven (Quản lý thư viện), Git/GitHub (Quản lý phiên bản).

---

##  (Key Features)

Dự án tập trung vào các nghiệp vụ cốt lõi của quản lý tòa nhà:

1.  **Quản lý Tòa nhà:** CRUD (Thêm, Sửa, Xóa, Xem) thông tin chi tiết (Tên, địa chỉ, diện tích, kết cấu).
2.  **Quản lý Con người:** Hệ thống hồ sơ điện tử cho **Nhân viên** và **Khách thuê**.
3.  **Tìm kiếm & Báo cáo:**
    * Công cụ tìm kiếm nâng cao theo nhiều tiêu chí (Filter).
    * Tối ưu hóa hiển thị danh sách lớn bằng kỹ thuật **Phân trang (Pagination)**.
4.  **Bảo mật & Validate:**
    * Cơ chế kiểm tra dữ liệu đầu vào chặt chẽ (Server-side & Client-side Validation).
    * Xử lý ngoại lệ (Exception Handling) để tránh lỗi hệ thống.

---

##  (My Responsibilities)

Là người duy nhất phát triển dự án, tôi đảm nhiệm toàn bộ vòng đời phát triển phần mềm (SDLC):

### 1. Phân tích & Thiết kế (Analysis & Design)
* Phân tích yêu cầu nghiệp vụ quản lý tòa nhà thực tế.
* Thiết kế ERD (Entity Relationship Diagram) và lược đồ CSDL MySQL đảm bảo tính toàn vẹn dữ liệu (Primary Key, Foreign Key, Constraints).
* Xây dựng kiến trúc dự án theo chuẩn MVC để dễ dàng mở rộng sau này.

### 2. Backend Development
* Xây dựng tầng **DAO (Data Access Object)** để giao tiếp với Database qua JDBC.
* Phát triển các **Service** để xử lý logic nghiệp vụ phức tạp.
* Viết các **Controller (Servlet)** để điều hướng luồng dữ liệu giữa Client và Server.
* Tối ưu hóa các câu truy vấn SQL (Query optimization).

### 3. Frontend Development
* Thiết kế giao diện người dùng (UI) thân thiện, dễ sử dụng.
* Sử dụng JavaScript để xử lý các sự kiện động (Dynamic actions) và Binding dữ liệu từ Backend.

---

## (Installation)

Nếu bạn muốn chạy thử dự án này trên máy cục bộ:

1.  **Clone repository:**
    ```bash
    git clone [https://github.com/Andrew31105/project_building.git](https://github.com/Andrew31105/project_building.git)
    ```
2.  **Cài đặt Database:**
    * Import file `.sql` trong thư mục `database/` vào MySQL Workbench hoặc Navicat.
    * Cập nhật thông tin kết nối (URL, User, Pass) trong file cấu hình Database của project.
3.  **Chạy ứng dụng:**
    * Mở project bằng IDE (IntelliJ IDEA / Eclipse).
    * Build project với Maven và chạy trên Tomcat Server.

