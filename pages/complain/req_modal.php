<!-- ========================= MODAL ======================= -->
<div id="reqModal" class="modal fade">
            <form method="post">
              <div class="modal-dialog modal-sm" style="width:370px !important;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Create New Complains</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    
                                <label>Name of defendant/suspect:</label>
                                        <input name="txt_compainto" class="form-control input-sm" type="text" placeholder="Name"/>

                                        <label>Date:</label>
                                        
                                        <input type="date" name="date" class="form-control input-sm" value="<?php echo date('Y-m-d'); ?>" placeholder="Date"/>
                                        <label>Time:</label>
                                        <input name="txttime" class="form-control input-sm" type="time" value="<?php echo date('h:i') ?>" placeholder="Time"/>
                                    <label>Purpose:</label>
                                    <input name="txt_purpose" class="form-control input-sm" type="text" placeholder="Purpose"/>
                                    <label for="complain_descripiton">Complain Description:</label>
                                    <input name="txt_complaindescription" class="form-control input-sm" type="text" placeholder="description"/>
                                <label for="response_complain">Response:</label>
                                <input name="txt_complain_response" class="form-control input-sm" type="text" placeholder="response"/>
                    
                 
                                
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel"/>
                        <input type="submit" class="btn btn-primary btn-sm" name="btn_save_complain" value="Create Complain"/>
                    </div>
                </div>
              </div>
              </form>
            </div>