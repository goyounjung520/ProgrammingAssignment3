# Tải thư viện cần thiết
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

# 0. Thiết lập thư mục làm việc (Chạy dòng này nếu bạn chưa setwd)
# setwd("D:/DSR/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

print("Đang bắt đầu xử lý dữ liệu...")

# --- BƯỚC 1: ĐỌC VÀ GỘP DỮ LIỆU (MERGING) ---
# Đọc danh sách đặc trưng và nhãn hoạt động
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# Đọc tập dữ liệu TRAINING
x_train       <- read.table("train/X_train.txt")
y_train       <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Đọc tập dữ liệu TEST
x_test        <- read.table("test/X_test.txt")
y_test        <- read.table("test/y_test.txt")
subject_test  <- read.table("test/subject_test.txt")

# Gộp tập Train và Test lại với nhau
x_data       <- rbind(x_train, x_test)
y_data       <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)


# --- BƯỚC 2: TRÍCH XUẤT MEAN VÀ STD (EXTRACTION) ---
# Lọc ra các cột tên có chứa "-mean()" hoặc "-std()"
mean_std_indices <- grep("-(mean|std)\\(\\)", features[, 2])

# Chỉ giữ lại các cột đó trong x_data
x_data <- x_data[, mean_std_indices]

# Đặt tên cột dựa trên file features
names(x_data) <- features[mean_std_indices, 2]


# --- BƯỚC 3: ĐẶT TÊN HOẠT ĐỘNG (DESCRIPTIVE NAMES) ---
# Thay thế mã số (1, 2, 3...) bằng tên hoạt động (WALKING, SITTING...)
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"


# --- BƯỚC 4: GÁN NHÃN BIẾN (LABELING) ---
names(subject_data) <- "subject"

# Gộp tất cả thành một bảng dữ liệu duy nhất
all_combined <- cbind(subject_data, y_data, x_data)

# Làm sạch tên các cột cho dễ đọc hơn
names(all_combined) <- gsub("^t", "Time", names(all_combined))
names(all_combined) <- gsub("^f", "Frequency", names(all_combined))
names(all_combined) <- gsub("Acc", "Accelerometer", names(all_combined))
names(all_combined) <- gsub("Gyro", "Gyroscope", names(all_combined))
names(all_combined) <- gsub("Mag", "Magnitude", names(all_combined))
names(all_combined) <- gsub("BodyBody", "Body", names(all_combined))


# --- BƯỚC 5: TẠO DỮ LIỆU TIDY ĐỘC LẬP (TIDY DATA SET) ---
# Nhóm theo subject và activity, sau đó tính trung bình cho từng biến
tidy_data <- all_combined %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Xuất kết quả ra file .txt
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)

print("HOÀN THÀNH! File 'tidy_data.txt' đã được tạo trong thư mục của bạn.")
