def monthly_sales
  110
end

target_sales = 100

event "monthly sales are suspiciously high" do
  monthly_sales > target_sales
end

event "monthly sales are abysmally low" do
  monthly_sales < target_sales
end
