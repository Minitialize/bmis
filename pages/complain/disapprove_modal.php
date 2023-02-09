<!-- ========================= MODAL ======================= -->
<div id="disapproveModal<?php echo $row['pid']?>" class="modal fade">
            <form method="post">
              <div class="modal-dialog modal-sm" style="width:300px !important;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Disapproved Complains</h4>
                    </div>
                    <div class="modal-body">
                        <?php
                        echo '
                <input  value="'.$row['pid'].'" name="hidden_id" id="hidden_id"/>';
                        ?>
                            <p>Are you sure you want to disapproved this complain? If yes, put the findings.</p>
                       
                       <!-- <div class="row">
                           <div class="col-md-12">
                                <div class="form-group">
                                    <label>Findings:</label>
                                    <input name="txt_findings" class="form-control input-sm" type="text" placeholder="Findings"/>
                                </div>
                                </div>
                       </div> -->

                       <div class="col-md-12">
                                <div class="form-group">
                                    <label>Complainant:</label>
                                    <?php
                        echo '
                <input readonly value="'.$row['residentname'].'" class="form-control input-sm" name="residentname" id="residentname"/>';
                        ?>
                                </div>
                                <div class="form-group">
                                    <label>Against To:</label>
                                    <?php
                        echo '
                <input readonly value="'.$row['againstto'].'" class="form-control input-sm" name="againstto" id="againstto"/>';
                        ?>
                                </div>
                                <div class="form-group">
                                    <label>Date:</label>
                                    <?php
                        echo '
                <input readonly value="'.$row['datesched'].'" class="form-control input-sm" name="Date" id="Date"/>';
                        ?>
                                </div>
                                <div class="form-group">
                                    <label>Time:</label>
                                    <?php
                        echo '
                <input readonly value="'.$row['time'].'" class="form-control input-sm" name="Time" id="Time"/>';
                        ?>
                                </div>

                                <div class="form-group">
                                    <label>Purpose:</label>
                                    <?php
                        echo '
                <input readonly value="'.$row['purpose'].'" class="form-control input-sm" name="Purpose" id="Purpose"/>';
                        ?>
                                </div>

                                <div class="form-group">
                                    <label>Complain Description:</label>
                                    <?php
                        echo '
                <input readonly value="'.$row['complain_description'].'" class="form-control input-sm" name="Complain_Description" id="Complain_Description"/>';
                        ?>
                                </div>
                        
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel"/>
                        <input type="submit" class="btn btn-primary btn-sm" name="btn_disapprove_complain" value="Disapprove"/>
                    </div>
                </div>
              </div>
              </form>
            </div>