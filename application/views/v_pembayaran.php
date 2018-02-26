<?php 
// print_r($this->session->all_userdata());
// var_dump($data_rute);
// echo "<br/>";
// echo "<br/>";
// echo "<br/>";
// var_dump($customer_data);
// echo "<br/>";
// echo "<br/>";
// var_dump($data_reservation);
// echo "<br/>";
// echo "<br/>";
// var_dump($customer_data['form_customer']);

?>

<section class="section-80 section-md-120">
	<div class="shell">
		<div class="range text-lg-left">
			<div class="cell-lg-6">	
				<div class="shell well">
					<h3>Pembayaran</h3>
					<p class="offset-top-20">Silahkan melakukan pembayaran melalui bank yang tersedia</p>
					<select name="my-select" class="js-my-select">
						<option value="nothing">Pilih Bank</option>
						<option value="mandiri">Mandiri</option>
						<option value="danamon">Danamon</option>
						<option value="bca">BCA</option>
						<option value="bri">BRI</option>
					</select>
					<table class="table table-striped text-left">
						<tr>
							<td>Nomor rekening</td>
							<td>:</td>
							<td>
								<span class="js-my-bank nothing">-- Pilih Bank --</span>
								<span class="js-my-bank mandiri">444444898989898989</span>
								<span class="js-my-bank danamon">987981236657653555</span>
								<span class="js-my-bank bca">123123111112312311</span>
								<span class="js-my-bank bri">299999000000011233</span>
							</td>
						</tr>
						<tr>
							<td>Harga</td>
							<td>:</td>
							<td>
								<?php 
								echo "Rp ".strrev(implode('.', str_split(strrev(strval($data_rute['price'])), 3))); 
								?>
								
							</td>
						</tr>
						<tr>
							<td>Jumlah kursi</td>
							<td>:</td>
							<td><?php echo $customer_data['seat'] ?></td>
						</tr>
						<tr>
							<td><h5>Total pembayaran</h5></td>
							<td><h5>:</h5></td>
							<td><h5>
								<?php
								$kode_unik = substr($this->input->get('reservation_code'), 6,-4);
								echo "Rp ".strrev(implode('.', str_split(strrev(strval($customer_data['seat'] * $data_rute['price']+$kode_unik)),3))) 
								?></h5>
								<p class="offset-top-20" style="font-size: 12px;">Terdapat kode unik diakhir total jumlah pembayaran sesuai dengan 3 digit angka terakhir pada reservation kode</p></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="cell-lg-6 ">
					<div class="range text-lg-left">
						<div class="shell">
							<div class="cell-xs-12 text-lg-left well">
								<h3>Important</h3>

								<table class="table table-striped text-left">
									<tr>
										<td>Reservation Code</td>
										<td>:</td>
										<td><input type="name" name="" value="<?php echo $this->input->get('reservation_code') ?>" /></td>
									</tr>
									<tr>
										<td>Key</td>
										<td>:</td>
										<td><input type="name" name="" value="<?php echo $this->input->get('key') ?>" /></td>
									</tr>
									<tr>
										<td>Reservation at</td>
										<td>:</td>
										<td><?php echo date('G:i:s, d/m/Y', strtotime($data_reservation[0]->reservation_at));?></td>
									</tr>
								</table>
							</div>
							<div class="cell-xs-12 text-lg-left well">
								<h4>Status Pembayaran</h4>
								<div class="table-responsive">
									<table class="table table-striped text-left">
										<tr>
											<td>Status</td>
											<td>:</td>
											<td>Menunggu Konfirmasi</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- <div class="cell-xs-12 text-lg-left well">
								<h5>Upload bukti pembayaran</h5>
								<?php
								echo form_open_multipart('upload/do_upload');
								?>

								<input type="file" name="gambar">
								<button type="submit">Upload Gambar</button>
								<?php echo form_close(); ?>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php for ($i=0; $i < $customer_data['seat']; $i++) { ?>
		<div class="shell offset-top-20">
			<div class="range text-lg-left">
				<div class="cell-lg-6">	
					<div class="shell well">
						<div class="cell-xxs-12">
							<?php $i = $i+1;?>
							<h5>Detail Penumpang <?php echo $i;?></h5>
							<?php $i = $i-1;?>
							<table class="table table-striped text-left">
								<tr>
									<td>Nama</td>
									<td>:</td>
									<td><?php echo $customer_data['form_customer']['name'][$i] ?></td>
								</tr>
								<tr>
									<td>Address</td>
									<td>:</td>
									<td><?php echo $customer_data['form_customer']['address'][$i] ?></td>
								</tr>
								<tr>
									<td>Phone</td>
									<td>:</td>
									<td><?php echo $customer_data['form_customer']['phone'][$i] ?></td>
								</tr>
								<tr>
									<td>Email</td>
									<td>:</td>
									<td><?php echo $customer_data['form_customer']['email'][$i] ?></td>
								</tr>
								<tr>
									<td>Gender</td>
									<td>:</td>
									<td><?php echo $customer_data['form_customer']['gender'][$i] ?></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="cell-lg-6">	
					<div class="shell">
						<!-- <div class="cell-xs-12 well">
							<?php $i = $i+1;?>
							<h5>Status Penumpang <?php echo $i ?></h5>
							<?php $i = $i-1;?>
							<table class="table table-striped text-left">
								<tr>
									<td>Status</td>
									<td>:</td>
									<td><?php echo $data_reservation[$i]->status ?></td>
								</tr>
							</table>
						</div> -->
						<div class="cell-xs-12 well">
							<?php $i = $i+1;?>
							<h5>Keberangkatan Penumpang <?php echo $i ?></h5>
							<?php $i = $i-1;?>
							<table class="table table-striped text-left">
								<tr>
									<td>Depart at</td>
									<td>:</td>
									<td><?php echo date('G:i:s, d M Y', strtotime($data_reservation[$i]->depart_at)); ?></td>
								</tr>
								<tr>
									<td>Depart arrive</td>
									<td>:</td>
									<td><?php echo date('G:i:s, d M Y' ,strtotime($data_rute['depart_arrive'])) ?></td>
								</tr>
								<tr>
									<td>Transportation Code</td>
									<td>:</td>
									<td><?php echo $data_rute['code'] ?></td>
								</tr>
								<tr>
									<td>Class</td>
									<td>:</td>
									<td><?php echo $data_rute['class'] ?></td>
								</tr>
								<tr>
									<td>Seat</td>
									<td>:</td>
									<td><?php echo $data_reservation[$i]->seat_code ?></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php } ?>


	</section>
	<script type="text/javascript">
		$(function() {
			var $select = $('.js-my-select'),
			$images =  $('.js-my-bank');

			$select.on('change', function() {
				var value = '.' + $(this).val();
				$images.show().not(value).hide();
			});
		});
	</script>
