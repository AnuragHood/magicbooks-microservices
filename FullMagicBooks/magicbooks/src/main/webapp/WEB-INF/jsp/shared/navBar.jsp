<!-- Dropdown Structure -->
<ul id="addBooks" class="dropdown-content">
    <li><a href="${pageContext.request.contextPath}/home/addOne">Add a Book</a></li>
    <li><a href="${pageContext.request.contextPath}/home/bulkUpload">Upload Books</a></li>
</ul>
<ul id="adminPannel" class="dropdown-content">
    <li><a href="#!">Manage Role</a></li>
    <li><a href="#!">Manage User</a></li>
</ul>
<ul id="addBooksMobile" class="dropdown-content">
    <li><a href="${pageContext.request.contextPath}/home/addOne">Add a Book</a></li>
    <li><a href="${pageContext.request.contextPath}/home/bulkUpload">Upload Books</a></li>
</ul>

<ul id="adminPannelMobile" class="dropdown-content">
    <li><a href="#!">Manage Role</a></li>
    <li><a href="#!">Manage User</a></li>
</ul>
<nav class="teal">
    <div class="nav-wrapper">
        <div class="nav-wrapper">
            <a href="#" onclick="return false;" onClick="return false;" class="logo">
                <img class="nav-img" src="${pageContext.request.contextPath}/resources/images/book_logo.svg"
                    alt="logo"></img><a href="${pageContext.request.contextPath}/home/show"
                    style="font-size: 1.4em;">Magic
                    Books</a>
            </a>
            <a href="${pageContext.request.contextPath}/home/show" data-target="mobile-demo" class="sidenav-trigger"><i
                    class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <!-- Dropdown Trigger -->
                <li><a class="dropdown-trigger" href="#!" data-target="addBooks">Add Books<i
                            class="material-icons right">arrow_drop_down</i></a></li>
                <li><a class="dropdown-trigger" href="#!" data-target="adminPannel">Admin<i
                            class="material-icons right">arrow_drop_down</i></a></li>
                <li><a href="${pageContext.request.contextPath}/home/magicbooks/managebooks">Manage Books
                    </a></li>
                <li>

                    <div class="center row">
                        <div class="col s12 ">
                            <div class="row" id="topbarsearch">
                                <div class="input-field col s6 s12 red-text">
                                    <form:form method="post" modelAttribute="bookDao"
                                        action="${pageContext.request.contextPath}/home/magicbooks/search">
                                        <i class="white-text material-icons prefix">search</i>
                                        <form:input path="name" type="text" placeholder="Search books"
                                            id="autocomplete-search-input"></form:input>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
    </div>
</nav>

<ul class="sidenav" id="mobile-demo">
    <!-- Dropdown Trigger -->
    <li><a class="dropdown-trigger" href="#!" data-target="addBooksMobile">Add Books<i
                class="material-icons right">arrow_drop_down</i></a></li>
    <li><a class="dropdown-trigger" href="#!" data-target="adminPannelMobile">Admin<i
                class="material-icons right">arrow_drop_down</i></a></li>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/managebooks">Manage Books
        </a></li>
    <li>
        <div class="center row">
            <div class="col s12 ">
                <div class="row" id="topbarsearch2">
                    <div class="input-field col s6 s12 red-text">
                        <form:form method="post" modelAttribute="bookDao"
                            action="${pageContext.request.contextPath}/home/magicbooks/search">

                            <form:input path="name" type="text" placeholder="Search books" id="autocomplete-input"
                                class="autocomplete white-text"></form:input>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>