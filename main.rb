require './staff.rb'

class StaffManage
    #Khởi tạo mảng các nhân viên
    @@staffs = [] 

    #Khởi tạo ngẫu nhiên danh sách nhân viên
    def self.import_staff_info()
        departments = ["dev", "qa", "bo", "infra"]
        staff_num = rand(1..100)
        (1..staff_num).each do |i|
           staff_id = i
           staff_name = "Nguyễn Văn A#{i}";
           staff_department = departments.shuffle.first
           hours = rand(1..40)
           if staff_department == "dev" 
               overtime = rand(1..10)
               dev = Dev.new(staff_id, staff_name, hours, overtime)
               @@staffs.push(dev)
           elsif staff_department == "qa"
               overtime = rand(1..10)
               tester = Tester.new(staff_id, staff_name, hours, overtime)
               @@staffs.push(tester)
           else 
                staff = Staff.new(staff_id, staff_name, staff_department, hours)
                @@staffs.push(staff)
           end
        end
    end 
    
    #Xuất ra thông tin nhân viên

    def self.export_staff_info() 
        @@staffs.each_with_index do |staff, index|
            puts "==========THONG TIN NHÂN VIÊN #{index + 1}=========="
            staff.staff_info
        end
    end

    # Lấy ra mã nhân viên có số lương > số lương đuợc chỉ định
    
    def self.getStaffIDWithSalaryGreaterThan(salary_condition) 
        puts "Các nhân viên có lương > #{salary_condition}là: "
        @@staffs.each do |staff|
            if staff.salary_caculate() > salary_condition 
                puts "Mã nhân viên: #{staff.staff_id}"
            end
        end
    end

    # Thêm nhân viên mới 

    def self.addNewMember()
        puts "Nhập tên nhân viên: "
        staff_name = gets.chomp
        puts "Nhập bộ phân làm việc: "
        staff_department = gets.chomp
        while (staff_department != "dev" && staff_department != "qa" && staff_department != "bo" && staff_department != "infra")
            puts "Tên bộ phân làm việc không tồn tại!!! Hãy nhập lại: "
            puts "Nhập bộ phân làm việc: "
            staff_department = gets.chomp
        end
        staff_id = @@staffs.length
        if staff_department == "dev" 
            dev = Dev.new(staff_id, staff_name)
            @@staffs.push(dev)
        elsif staff_department == "qa"
            tester = Tester.new(staff_id, staff_name)
            @@staffs.push(tester)
        elsif staff_department == "bo" || staff_department == "infra" 
             staff = Staff.new(staff_id, staff_name, staff_department)
             @@staffs.push(staff)
        end
    end

end

StaffManage.import_staff_info();
StaffManage.export_staff_info();
