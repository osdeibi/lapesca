module Dashboard::HotelsHelper
  def yes_no
    [["Si",true],["No",false]]
  end

  def review_score
    [[1,1],[2,2],[3,3],[4,4],[5,5]]
  end

  def hotels_category
    [["Hotel",0],["Casa",1],["Bungalow",2]]
  end
end