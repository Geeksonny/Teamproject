<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

    <!-- 헤더단(광고같은 거 들어가도 됨) -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>커뮤니티</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Community</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!--  내용 -->
    <div class="container">
    여기에 뭘 넣으면 됨
    <article class="my-3" id="badge">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Badge</h3>
        <a class="d-flex align-items-center" href="/docs/5.2/components/badge/">Documentation</a>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="h1">Example heading <span class="badge bg-primary">New</span></p>
        <p class="h2">Example heading <span class="badge bg-secondary">New</span></p>
        <p class="h3">Example heading <span class="badge bg-success">New</span></p>
        <p class="h4">Example heading <span class="badge bg-danger">New</span></p>
        <p class="h5">Example heading <span class="badge text-bg-warning">New</span></p>
        <p class="h6">Example heading <span class="badge text-bg-info">New</span></p>
        <p class="h6">Example heading <span class="badge text-bg-light">New</span></p>
        <p class="h6">Example heading <span class="badge bg-dark">New</span></p>
        </div></div>


        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        
        <span class="badge rounded-pill bg-primary">Primary</span>
        <span class="badge rounded-pill bg-secondary">Secondary</span>
        <span class="badge rounded-pill bg-success">Success</span>
        <span class="badge rounded-pill bg-danger">Danger</span>
        <span class="badge rounded-pill text-bg-warning">Warning</span>
        <span class="badge rounded-pill text-bg-info">Info</span>
        <span class="badge rounded-pill text-bg-light">Light</span>
        <span class="badge rounded-pill bg-dark">Dark</span>
        </div></div>

      </div>
    </article>
    <article class="my-3" id="breadcrumb">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Breadcrumb</h3>
        <a class="d-flex align-items-center" href="/docs/5.2/components/breadcrumb/">Documentation</a>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Library</a></li>
            <li class="breadcrumb-item active" aria-current="page">Data</li>
          </ol>
        </nav>
        </div></div>

      </div>
    </article>
    <article class="my-3" id="buttons">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Buttons</h3>
        <a class="d-flex align-items-center" href="/docs/5.2/components/buttons/">Documentation</a>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        
        <button type="button" class="btn btn-primary">Primary</button>
        <button type="button" class="btn btn-secondary">Secondary</button>
        <button type="button" class="btn btn-success">Success</button>
        <button type="button" class="btn btn-danger">Danger</button>
        <button type="button" class="btn btn-warning">Warning</button>
        <button type="button" class="btn btn-info">Info</button>
        <button type="button" class="btn btn-light">Light</button>
        <button type="button" class="btn btn-dark">Dark</button>

        <button type="button" class="btn btn-link">Link</button>
        </div></div>


        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        
        <button type="button" class="btn btn-outline-primary">Primary</button>
        <button type="button" class="btn btn-outline-secondary">Secondary</button>
        <button type="button" class="btn btn-outline-success">Success</button>
        <button type="button" class="btn btn-outline-danger">Danger</button>
        <button type="button" class="btn btn-outline-warning">Warning</button>
        <button type="button" class="btn btn-outline-info">Info</button>
        <button type="button" class="btn btn-outline-light">Light</button>
        <button type="button" class="btn btn-outline-dark">Dark</button>
        </div></div>


        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <button type="button" class="btn btn-primary btn-sm">Small button</button>
        <button type="button" class="btn btn-primary">Standard button</button>
        <button type="button" class="btn btn-primary btn-lg">Large button</button>
        </div></div>

      </div>
    </article>
  </div>


  
    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>