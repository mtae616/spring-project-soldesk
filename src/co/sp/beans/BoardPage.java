package co.sp.beans;

public class BoardPage {
	private int min;
	private int max;
	private int prevPage;
	private int nextPage;
	private int pageCnt;
	private int currentPage;
	
	public BoardPage(int contentCount, int currentPage, int contentPageCount, int pa) {
		contentPageCount = 10;
		pa = 10;
		this.currentPage=currentPage;
		
		pageCnt = contentCount / contentPageCount;
		if(contentCount % contentPageCount > 0) {
			pageCnt++;
		}
		
		min=((currentPage - 1) / contentPageCount) * contentPageCount + 1;
		max = min + pa -1;
		
		if(max>pageCnt) {
			max=pageCnt;
		}
		prevPage = min - 1;
		nextPage = max +1;
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
