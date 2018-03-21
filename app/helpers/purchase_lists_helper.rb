module PurchaseListsHelper
  def params_is_number?(string)
    true if Float(string) rescue false
  end
end
