<%@ tag pageEncoding="UTF-8" body-content="empty" %>
<%@ attribute name="modalMessage" required="false" type="java.lang.String" %>

<div id="modal-backdrop" class="modal-backdrop"></div>
<div id="modal" class="modal">
	<div class="modal_item">
		<div id="modal_content" class="modal_content">${modalMessage}</div>
		<div class="modal_button_wrapper"></div>
	</div>
</div>