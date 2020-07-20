class Genre < ApplicationRecord

	enum is_active_status: {
        無効: 0,
        有効: 1,
    }
end
