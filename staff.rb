#Class Staff

class Staff
    attr_accessor :staff_name, :staff_id, :staff_department
    # Khởi tạo staff info
    def initialize(staff_name, staff_id, staff_department, staff_hours = 0) 
        @BASIC_SALARY = 3000
        @staff_name = staff_name
        @staff_id = staff_id
        @staff_department = staff_department
        @staff_hours = staff_hours;
    end
    
    # in ra staff info
    def staff_info()
        puts "Mã nhân viên: #{@staff_id}"
        puts "Tên nhân viên: #{@staff_name}" 
        puts "Bộ phân làm việc: #{@staff_department}"
        puts "Thời gian làm việc chính thức: #{@staff_hours}"
        puts "Lương của nhân viên: #{salary_caculate()}"
    end

    # Tính luơng nhân viên
    def salary_caculate() 
        return @BASIC_SALARY * @staff_hours;
    end

    # Thay đổi thời gian làm việc của nhân viên
    def setStaffHours(hours = 0)
        @staff_hours = hours
    end
end

#Class Dev

class Dev < Staff 
    def initialize(dev_name, dev_id, dev_hours = 0, overtime = 0)
        super(dev_name, dev_id, "dev", dev_hours)
        @overtime = overtime
        @SUPORT_SALARY_PERCENT = 0.15
        @OVERTIME_SALARY = 1.5 * @BASIC_SALARY
    end

    def staff_info()
        puts "Mã nhân viên: #{@staff_id}"
        puts "Tên nhân viên: #{@staff_name}" 
        puts "Bộ phân làm việc: #{@staff_department}"
        puts "Thời gian làm việc chính thức: #{@staff_hours}"
        puts "Thời gian làm việc ngoài giờ: #{@overtime}"
        puts "Lương của nhân viên: #{salary_caculate()}"
    end

    def salary_caculate() 
       return @BASIC_SALARY * @staff_hours * (1 + @SUPORT_SALARY_PERCENT) + @overtime * @OVERTIME_SALARY
    end

    def setOvertime(overtime = 0)
        @overtime = overtime
    end
end

#Class Tester

class Tester < Staff 
    def initialize(tester_name, tester_id, tester_hours = 0, overtime = 0)
        super(tester_name, tester_id, "qa", tester_hours)
        @overtime = overtime
        @SUPORT_SALARY_PERCENT = 0.1
        @OVERTIME_SALARY = 1.5 * @BASIC_SALARY
    end
    
    def staff_info()
        puts "Mã nhân viên: #{@staff_id}"
        puts "Tên nhân viên: #{@staff_name}" 
        puts "Bộ phân làm việc: #{@staff_department}"
        puts "Thời gian làm việc chính thức: #{@staff_hours}"
        puts "Thời gian làm việc ngoài giờ: #{@overtime}"
        puts "Lương của nhân viên: #{salary_caculate()}"
    end

    def salary_caculate() 
        return @BASIC_SALARY * @staff_hours * (1 + @SUPORT_SALARY_PERCENT) + @overtime * @OVERTIME_SALARY
    end

    def setOvertime(overtime = 0) 
        @overtime = overtime
    end
end
